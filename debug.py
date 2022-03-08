
import tensorflow as tf

import json
import sys


with open('/liaoweiduo/ARML/BA/all_filenames.json', 'r') as f:
    all_filenames = json.load(f)

# tf.enable_eager_execution()

# make queue for tensorflow to read from
filename_queue = tf.train.string_input_producer(tf.convert_to_tensor(all_filenames), shuffle=False)
print('Generating image processing ops')
image_reader = tf.WholeFileReader()
image_name, image_file = image_reader.read(filename_queue)

# print(f'file: {image_name}')
tf.print('file: ', image_name, output_stream=sys.stderr)
image = tf.image.decode_jpeg(image_file, channels=3)

sess = tf.Session()
with sess.as_default():
    sess.run(image)
    