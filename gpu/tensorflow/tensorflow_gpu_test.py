import tensorflow as tf
hello = tf.constant('Hello, TensorFlow!')
sess = tf.Session(config=tf.ConfigProto(log_device_placement=True))
print(sess.run(hello))
