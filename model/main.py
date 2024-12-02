import os
os.environ['TF_CPP_MIN_LOG_LEVEL'] = '2'
import tensorflow as tf
from tensorflow import keras
import matplotlib.pyplot as plt
import numpy as np
import glob

imgs_path = glob.glob(r'D:\pythonMat\archive\CUB_200_2011\CUB_200_2011\images\*\*.jpg')
all_labels_name = [imgs_p.split('\\')[6].split('.')[1] for imgs_p in imgs_path]
label_names = np.unique(all_labels_name)
label_to_index = dict((name,i) for i,name in enumerate(label_names))
index_to_label = dict((k,v) for v,k in label_to_index.items())
all_labels = [label_to_index.get(name) for name in all_labels_name]
np.random.seed(2024)
random_index = np.random.permutation(len(imgs_path))
imgs_path = np.array(imgs_path)[random_index]
all_labels = np.array(all_labels)[random_index]
train_count = int(len((imgs_path))*0.8)
train_path = imgs_path[:train_count]
train_labels = all_labels[:train_count]
test_path = imgs_path[train_count:]
test_labels = all_labels[train_count:]
#训练集
train_ds = tf.data.Dataset.from_tensor_slices((train_path,train_labels))
#测试集
test_ds = tf.data.Dataset.from_tensor_slices((test_path,test_labels))

def load_img(path,label):
    image = tf.io.read_file(path)
    image = tf.image.decode_jpeg(image,channels=3)
    image = tf.image.resize(image,[256,256])
    image = tf.cast(image,tf.float32)
    image = image/255
    return image,label

AUTOTUNE = tf.data.experimental.AUTOTUNE
train_ds = train_ds.map(load_img,num_parallel_calls=AUTOTUNE)
test_ds = test_ds.map(load_img,num_parallel_calls=AUTOTUNE)
BATCH_SIZE = 8
train_ds = train_ds.repeat().shuffle(300).batch(BATCH_SIZE)
test_ds = test_ds.batch(BATCH_SIZE)
model = tf.keras.Sequential()
model.add(tf.keras.layers.Conv2D(64,(3,3),input_shape=(256,256,3),activation='relu'))
model.add(tf.keras.layers.BatchNormalization())
model.add(tf.keras.layers.Conv2D(64,(3,3),activation='relu'))
model.add(tf.keras.layers.BatchNormalization())
model.add(tf.keras.layers.MaxPool2D())
model.add(tf.keras.layers.Conv2D(128,(3,3),activation='relu'))
model.add(tf.keras.layers.BatchNormalization())
model.add(tf.keras.layers.Conv2D(128,(3,3),activation='relu'))
model.add(tf.keras.layers.BatchNormalization())
model.add(tf.keras.layers.MaxPool2D())
model.add(tf.keras.layers.Conv2D(256,(3,3),activation='relu'))
model.add(tf.keras.layers.BatchNormalization())
model.add(tf.keras.layers.Conv2D(256,(3,3),activation='relu'))
model.add(tf.keras.layers.BatchNormalization())
model.add(tf.keras.layers.MaxPool2D())
model.add(tf.keras.layers.Conv2D(512,(3,3),activation='relu'))
model.add(tf.keras.layers.BatchNormalization())
model.add(tf.keras.layers.Conv2D(512,(3,3),activation='relu'))
model.add(tf.keras.layers.BatchNormalization())
model.add(tf.keras.layers.MaxPool2D())
model.add(tf.keras.layers.Conv2D(512,(3,3),activation='relu'))
model.add(tf.keras.layers.BatchNormalization())
model.add(tf.keras.layers.Conv2D(512,(3,3),activation='relu'))
model.add(tf.keras.layers.BatchNormalization())
model.add(tf.keras.layers.GlobalAvgPool2D())
model.add(tf.keras.layers.Dense(1024,activation='relu'))
model.add(tf.keras.layers.BatchNormalization())
model.add(tf.keras.layers.Dense(200))
#model.summary()
model.compile(optimizer=tf.keras.optimizers.Adam(0.0001),loss=tf.keras.losses.SparseCategoricalCrossentropy(from_logits=True),metrics=['acc'])
train_steps_per_epoch = len(train_path) // BATCH_SIZE
test_steps_per_epoch = len(test_path) // BATCH_SIZE
history = model.fit(train_ds,epochs=10,steps_per_epoch=train_steps_per_epoch,validation_data=test_ds,validation_steps=test_steps_per_epoch)
plt.plot(history.epoch,history.history.get('acc'),label='acc')
plt.plot(history.epoch,history.history.get('val_acc'),label='val_acc')
plt.legend()
plt.show()
plt.plot(history.epoch,history.history.get('loss'),label='loss')
plt.plot(history.epoch,history.history.get('val_loss'),label='val_loss')
plt.legend()
plt.show()
model.save('model_birds')

