from __future__ import print_function

import numpy as np
import tensorflow as tf
from tensorflow.python.platform import flags

from image_embedding import ImageEmbedding
from metadag import MetaGraph
from task_embedding import LSTMAutoencoder
from utils import mse, xent, conv_block, normalize

FLAGS = flags.FLAGS


class MAML:
    def __init__(self, sess, dim_input=1, dim_output=1, test_num_updates=5):
        self.dim_input = dim_input
        self.dim_output = dim_output
        self.update_lr = FLAGS.update_lr
        self.meta_lr = tf.placeholder_with_default(FLAGS.meta_lr, ())
        self.classification = False
        self.test_num_updates = test_num_updates
        self.sess = sess
        self.lstmae = LSTMAutoencoder(hidden_num=FLAGS.hidden_dim, input_num=FLAGS.hidden_dim + FLAGS.num_classes,
                                      name='lstm_ae')
        self.lstmae_graph = LSTMAutoencoder(hidden_num=FLAGS.hidden_dim, input_num=FLAGS.hidden_dim,
                                            name='lstm_ae_graph')
        if FLAGS.datasource in ['2D']:
            self.metagraph = MetaGraph(input_dim=FLAGS.sync_filters, hidden_dim=FLAGS.sync_filters)
        # elif FLAGS.datasource in ['plainmulti', 'artmulti']:
        else:
            self.metagraph = MetaGraph(input_dim=FLAGS.hidden_dim, hidden_dim=FLAGS.hidden_dim)

        if FLAGS.datasource in ['2D']:
            self.dim_hidden = [40, 40]
            self.loss_func = mse
            self.forward = self.forward_fc
            self.construct_weights = self.construct_fc_weights
        # elif FLAGS.datasource in ['plainmulti', 'artmulti']:
        else:
            self.loss_func = xent
            self.classification = True
            self.dim_hidden = FLAGS.num_filters
            self.forward = self.forward_conv
            self.construct_weights = self.construct_conv_weights
            self.channels = 3
            self.img_size = int(np.sqrt(self.dim_input / self.channels))
            self.image_embed = ImageEmbedding(hidden_num=FLAGS.task_embedding_num_filters, channels=self.channels,
                                              conv_initializer=tf.truncated_normal_initializer(stddev=0.04))
        # else:
        #     raise ValueError('Unrecognized data source.')

    def construct_model(self, input_tensors=None, prefix='metatrain_'):
        if input_tensors is None:
            self.inputa = tf.placeholder(tf.float32, shape=(FLAGS.meta_batch_size, FLAGS.update_batch_size, 2))
            self.inputb = tf.placeholder(tf.float32,
                                         shape=(FLAGS.meta_batch_size, FLAGS.update_batch_size_eval, 2))
            self.labela = tf.placeholder(tf.float32, shape=(FLAGS.meta_batch_size, FLAGS.update_batch_size, 1))
            self.labelb = tf.placeholder(tf.float32,
                                         shape=(FLAGS.meta_batch_size, FLAGS.update_batch_size_eval, 1))
        else:
            self.inputa = input_tensors['inputa']
            self.inputb = input_tensors['inputb']
            self.labela = input_tensors['labela']
            self.labelb = input_tensors['labelb']

        with tf.variable_scope('model', reuse=tf.AUTO_REUSE) as training_scope:
            if 'weights' in dir(self):
                training_scope.reuse_variables()
                weights = self.weights
            else:
                self.weights = weights = self.construct_weights()

            accuraciesa, accuraciesb = [], []
            num_updates = max(self.test_num_updates, FLAGS.num_updates)
            accuraciesb = [[]] * num_updates

            def task_metalearn(inp, reuse=True):
                inputa, inputb, labela, labelb = inp
                if FLAGS.datasource in ['2D']:
                    input_task_emb = tf.concat((inputa, labela), axis=-1)
                    with tf.variable_scope('first_embedding_sync', reuse=tf.AUTO_REUSE):
                        input_task_emb = tf.layers.dense(input_task_emb, units=FLAGS.sync_filters,
                                                         name='first_embedding_sync_dense')
                    if FLAGS.num_classes < FLAGS.update_batch_size:
                        with tf.variable_scope('reg_clustering', reuse=tf.AUTO_REUSE):
                            assign_mat = tf.nn.softmax(tf.layers.dense(input_task_emb, units=FLAGS.num_classes), dim=1)
                            input_task_emb_cat = tf.matmul(tf.transpose(assign_mat, perm=[1, 0]), input_task_emb)

                # elif FLAGS.datasource in ['plainmulti', 'artmulti']:
                else:
                    input_task_emb = self.image_embed.model(tf.reshape(inputa,
                                                                       [-1, self.img_size, self.img_size,
                                                                        self.channels]))

                    proto_emb = []
                    labela2idx = tf.argmax(labela, axis=1)
                    for class_idx in range(FLAGS.num_classes):
                        tmp_gs = tf.equal(labela2idx, class_idx)
                        gs = tf.where(tmp_gs)
                        new_vec = tf.reduce_mean(tf.gather(input_task_emb, gs), axis=0)
                        proto_emb.append(new_vec)
                    proto_emb = tf.squeeze(tf.stack(proto_emb))

                    label_cat = tf.eye(5)

                    input_task_emb_cat = tf.concat((proto_emb, label_cat), axis=-1)

                if FLAGS.datasource in ['2D']:
                    task_embed_vec, task_emb_loss = self.lstmae.model(input_task_emb)
                    propagate_knowledge = self.metagraph.model(input_task_emb_cat)
                # elif FLAGS.datasource in ['plainmulti', 'artmulti']:
                else:
                    task_embed_vec, task_emb_loss = self.lstmae.model(input_task_emb_cat)
                    propagate_knowledge = self.metagraph.model(proto_emb)

                task_embed_vec_graph, task_emb_loss_graph = self.lstmae_graph.model(propagate_knowledge)

                task_enhanced_emb_vec = tf.concat([task_embed_vec, task_embed_vec_graph], axis=1)

                with tf.variable_scope('task_specific_mapping', reuse=tf.AUTO_REUSE):
                    eta = []
                    for key in weights.keys():
                        weight_size = np.prod(weights[key].get_shape().as_list())
                        eta.append(tf.reshape(
                            tf.layers.dense(task_enhanced_emb_vec, weight_size, activation=tf.nn.sigmoid,
                                            name='eta_{}'.format(key)), tf.shape(weights[key])))
                    eta = dict(zip(weights.keys(), eta))
                    task_weights = dict(zip(weights.keys(), [weights[key] * eta[key] for key in weights.keys()]))

                task_outputbs, task_lossesb = [], []

                if self.classification:
                    task_accuraciesb = []

                task_outputa = self.forward(inputa, task_weights, reuse=reuse)
                task_lossa = self.loss_func(task_outputa, labela)

                grads = tf.gradients(task_lossa, list(task_weights.values()))
                if FLAGS.stop_grad:
                    grads = [tf.stop_gradient(grad) for grad in grads]
                gradients = dict(zip(task_weights.keys(), grads))
                fast_weights = dict(
                    zip(task_weights.keys(),
                        [task_weights[key] - self.update_lr * gradients[key] for key in task_weights.keys()]))
                output = self.forward(inputb, fast_weights, reuse=True)
                task_outputbs.append(output)
                task_lossesb.append(self.loss_func(output, labelb))
                for j in range(num_updates - 1):
                    loss = self.loss_func(self.forward(inputa, fast_weights, reuse=True), labela)
                    grads = tf.gradients(loss, list(fast_weights.values()))
                    if FLAGS.stop_grad:
                        grads = [tf.stop_gradient(grad) for grad in grads]
                    gradients = dict(zip(fast_weights.keys(), grads))
                    fast_weights = dict(zip(fast_weights.keys(),
                                            [fast_weights[key] - self.update_lr * gradients[key] for key in
                                             fast_weights.keys()]))
                    output = self.forward(inputb, fast_weights, reuse=True)
                    task_outputbs.append(output)
                    task_lossesb.append(self.loss_func(output, labelb))

                task_output = [task_emb_loss, task_emb_loss_graph, task_outputa, task_outputbs, task_lossa,
                               task_lossesb]

                if self.classification:
                    task_accuracya = tf.contrib.metrics.accuracy(tf.argmax(tf.nn.softmax(task_outputa), 1),
                                                                 tf.argmax(labela, 1))
                    for j in range(num_updates):
                        task_accuraciesb.append(
                            tf.contrib.metrics.accuracy(tf.argmax(tf.nn.softmax(task_outputbs[j]), 1),
                                                        tf.argmax(labelb, 1)))
                    task_output.extend([task_accuracya, task_accuraciesb])

                return task_output

            if FLAGS.norm != 'None':
                unused = task_metalearn((self.inputa[0], self.inputb[0], self.labela[0], self.labelb[0]), False)

            out_dtype = [tf.float32, tf.float32, tf.float32, [tf.float32] * num_updates, tf.float32,
                         [tf.float32] * num_updates]
            if self.classification:
                out_dtype.extend([tf.float32, [tf.float32] * num_updates])
            result = tf.map_fn(task_metalearn, elems=(self.inputa, self.inputb, self.labela, self.labelb),
                               dtype=out_dtype, parallel_iterations=FLAGS.meta_batch_size)
            if self.classification:
                emb_loss, emb_loss_graph, outputas, outputbs, lossesa, lossesb, accuraciesa, accuraciesb = result
            else:
                emb_loss, emb_loss_graph, outputas, outputbs, lossesa, lossesb = result

        ## Performance & Optimization
        if 'train' in prefix:
            self.total_loss1 = total_loss1 = tf.reduce_sum(lossesa) / tf.to_float(FLAGS.meta_batch_size)
            self.total_losses2 = total_losses2 = [tf.reduce_sum(lossesb[j]) / tf.to_float(FLAGS.meta_batch_size) for j
                                                  in range(num_updates)]
            self.total_embed_loss = tf.reduce_sum(emb_loss) / tf.to_float(FLAGS.meta_batch_size)
            self.total_embed_loss_graph = tf.reduce_sum(emb_loss_graph) / tf.to_float(FLAGS.meta_batch_size)
            # after the map_fn
            self.outputas, self.outputbs = outputas, outputbs
            if self.classification:
                self.total_accuracy1 = tf.reduce_sum(accuraciesa) / tf.to_float(FLAGS.meta_batch_size)
                self.total_accuracies2 = [
                    tf.reduce_sum(accuraciesb[j]) / tf.to_float(FLAGS.meta_batch_size) for j in range(num_updates)]
            self.pretrain_op = tf.train.AdamOptimizer(self.meta_lr).minimize(total_loss1)

            if FLAGS.metatrain_iterations > 0:
                optimizer = tf.train.AdamOptimizer(self.meta_lr)
                self.gvs = gvs = optimizer.compute_gradients(
                    self.total_losses2[FLAGS.num_updates - 1] + FLAGS.emb_loss_weight * (
                            self.total_embed_loss + self.total_embed_loss_graph))
                self.metatrain_op = optimizer.apply_gradients(gvs)
        else:
            self.metaval_total_loss1 = tf.reduce_sum(lossesa) / tf.to_float(FLAGS.meta_batch_size)
            self.metaval_total_losses2 = [tf.reduce_sum(lossesb[j]) / tf.to_float(FLAGS.meta_batch_size)
                                          for j in range(num_updates)]
            if self.classification:
                self.metaval_total_accuracy1 = tf.reduce_sum(accuraciesa) / tf.to_float(
                    FLAGS.meta_batch_size)
                self.metaval_total_accuracies2 = [
                    tf.reduce_sum(accuraciesb[j]) / tf.to_float(FLAGS.meta_batch_size) for j in range(num_updates)]

    def construct_fc_weights(self):
        weights = {}
        weights['w1'] = tf.Variable(tf.truncated_normal([self.dim_input, self.dim_hidden[0]], stddev=0.01))
        weights['b1'] = tf.Variable(tf.zeros([self.dim_hidden[0]]))
        for i in range(1, len(self.dim_hidden)):
            weights['w' + str(i + 1)] = tf.Variable(
                tf.truncated_normal([self.dim_hidden[i - 1], self.dim_hidden[i]], stddev=0.01))
            weights['b' + str(i + 1)] = tf.Variable(tf.zeros([self.dim_hidden[i]]))
        weights['w' + str(len(self.dim_hidden) + 1)] = tf.Variable(
            tf.truncated_normal([self.dim_hidden[-1], self.dim_output], stddev=0.01))
        weights['b' + str(len(self.dim_hidden) + 1)] = tf.Variable(tf.zeros([self.dim_output]))
        return weights

    def forward_fc(self, inp, weights, reuse=False):
        hidden = normalize(tf.matmul(inp, weights['w1']) + weights['b1'], activation=tf.nn.relu, reuse=reuse, scope='0')
        for i in range(1, len(self.dim_hidden)):
            hidden = normalize(tf.matmul(hidden, weights['w' + str(i + 1)]) + weights['b' + str(i + 1)],
                               activation=tf.nn.relu, reuse=reuse, scope=str(i + 1))
        return tf.matmul(hidden, weights['w' + str(len(self.dim_hidden) + 1)]) + weights[
            'b' + str(len(self.dim_hidden) + 1)]

    def construct_conv_weights(self):
        weights = {}

        dtype = tf.float32
        conv_initializer = tf.contrib.layers.xavier_initializer_conv2d(dtype=dtype)
        fc_initializer = tf.contrib.layers.xavier_initializer(dtype=dtype)
        k = 3

        weights['conv1'] = tf.get_variable('conv1', [k, k, self.channels, self.dim_hidden],
                                           initializer=conv_initializer, dtype=dtype)
        weights['b1'] = tf.Variable(tf.zeros([self.dim_hidden]))
        weights['conv2'] = tf.get_variable('conv2', [k, k, self.dim_hidden, self.dim_hidden],
                                           initializer=conv_initializer, dtype=dtype)
        weights['b2'] = tf.Variable(tf.zeros([self.dim_hidden]))
        weights['conv3'] = tf.get_variable('conv3', [k, k, self.dim_hidden, self.dim_hidden],
                                           initializer=conv_initializer, dtype=dtype)
        weights['b3'] = tf.Variable(tf.zeros([self.dim_hidden]))
        weights['conv4'] = tf.get_variable('conv4', [k, k, self.dim_hidden, self.dim_hidden],
                                           initializer=conv_initializer, dtype=dtype)
        weights['b4'] = tf.Variable(tf.zeros([self.dim_hidden]))

        weights['w5'] = tf.get_variable('w5', [self.dim_hidden * 5 * 5, self.dim_output],
                                        initializer=fc_initializer)
        weights['b5'] = tf.Variable(tf.zeros([self.dim_output]), name='b5')
        return weights

    def forward_conv(self, inp, weights, reuse=False, scope=''):
        channels = self.channels
        inp = tf.reshape(inp, [-1, self.img_size, self.img_size, channels])

        hidden1 = conv_block(inp, weights['conv1'], weights['b1'], reuse, scope + '0')
        hidden2 = conv_block(hidden1, weights['conv2'], weights['b2'], reuse, scope + '1')
        hidden3 = conv_block(hidden2, weights['conv3'], weights['b3'], reuse, scope + '2')
        hidden4 = conv_block(hidden3, weights['conv4'], weights['b4'], reuse, scope + '3')

        hidden4 = tf.reshape(hidden4, [-1, np.prod([int(dim) for dim in hidden4.get_shape()[1:]])])

        return tf.matmul(hidden4, weights['w5']) + weights['b5']
