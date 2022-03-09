
import tensorflow as tf

import json
import sys

tf.compat.v1.disable_v2_behavior()

with open('/liaoweiduo/ARML/BA/all_filenames.json', 'r') as f:
    all_filenames = json.load(f)

print('\n\nload all_filenames. with len:', len(all_filenames))

# tf.enable_eager_execution()
sess = tf.compat.v1.Session()
with sess.as_default():
    tensor = tf.range(2)

    # make queue for tensorflow to read from
    filename_queue = tf.train.string_input_producer(tf.convert_to_tensor(all_filenames[:10]), shuffle=False)
    print('\n\nGenerating image processing ops')
    image_reader = tf.WholeFileReader()
    image_name, image_file = image_reader.read(filename_queue)

    # print(f'file: {image_name}')
    image = tf.image.decode_jpeg(image_file, channels=3)

    image = tf.image.resize_images(image, (84, 84))
    image.set_shape((84, 84, 3))
    image = tf.reshape(image, [84 * 84 * 3])
    image = tf.cast(image, tf.float32) / 255.0

    print_op = tf.print('tensor:', tensor, {'shape': image.shape.as_list()},
                        output_stream=sys.stdout)   # 'file': image_name,

    print_op_1 = tf.print("tensors:", tensor, {2: tensor * 2},
                        output_stream=sys.stdout)
    with tf.control_dependencies([print_op, print_op_1]):
        tripled_tensor = tensor * 3
        modified_image = tf.cast(tripled_tensor[1], tf.float32) * image

    sess.run(modified_image)

# tf.print(tensor, output_stream=sys.stderr)
#
# print_op = tf.print('tensor:', tensor, output_stream=sys.stdout)

# sess = tf.Session()
# with sess.as_default():
#     sess.run(print_op)
