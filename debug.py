
import tensorflow as tf

import json
import sys

tf.compat.v1.disable_v2_behavior()

with open('/liaoweiduo/ARML/BA/all_filenames.json', 'r') as f:
    all_filenames = json.load(f)

print('\n\nload all_filenames. with len:', len(all_filenames))

# tf.enable_eager_execution()

tensor = tf.range(2)

# make queue for tensorflow to read from
filename_queue = tf.train.string_input_producer(tf.convert_to_tensor(all_filenames[:120]), shuffle=False)
print('\n\nGenerating image processing ops')
image_reader = tf.WholeFileReader()
image_name, image_file = image_reader.read(filename_queue)

# print(f'file: {image_name}')
image = tf.image.decode_jpeg(image_file, channels=3)

image = tf.image.resize_images(image, (84, 84))
image.set_shape((84, 84, 3))
image = tf.reshape(image, [84 * 84 * 3])
image = tf.cast(image, tf.float32) / 255.0

# num_preprocess_threads = 1
# min_queue_examples = 256
# examples_per_batch = 5 * 2
# batch_image_size = 4 * examples_per_batch
# print('\n\nBatching images')


sess = tf.compat.v1.Session()
with sess.as_default():

    tf.global_variables_initializer().run()
    threads = tf.train.start_queue_runners(sess=sess)

    count = 0
    for _ in range(120):
        count += 1
        print('count:', count)
        print('image:', image.shape)
        print('image_name:', image_name)
    #
    # for b_idx in range(4):
    #     images = tf.train.batch(
    #         [image],
    #         batch_size=batch_image_size,
    #         num_threads=num_preprocess_threads,
    #         capacity=min_queue_examples + 3 * batch_image_size,
    #     )
    #     image_names = tf.train.batch(
    #         [image_name],
    #         batch_size=batch_image_size,
    #         num_threads=num_preprocess_threads,
    #         capacity=min_queue_examples + 3 * batch_image_size,
    #     )
    #
    #     print_op = tf.print('tensor:', tensor, 'name:', image_names.shape.as_list(), {'shape': images[:, :10]},
    #                         output_stream=sys.stdout)  # 'file': image_name,    .shape.as_list()
    #
    #     # print_op_1 = tf.print("tensors:", tensor, {2: tensor * 2},
    #     #                       output_stream=sys.stdout)
    #
    #     # with tf.control_dependencies([print_op_1]):
    #     tensor = tensor * 2
    #     modified_image = tf.cast(tensor[1], tf.float32) * images
    #
    #     sess.run(print_op)

# tf.print(tensor, output_stream=sys.stderr)
#
# print_op = tf.print('tensor:', tensor, output_stream=sys.stdout)

# sess = tf.Session()
# with sess.as_default():
#     sess.run(print_op)
