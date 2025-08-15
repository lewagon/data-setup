print('Loading pandas...')
import pandas as pd
df = pd.DataFrame({'pandas':['OK']})
df.shape
print('✅ pandas OK')
print('Loading Scikit-learn...')
from sklearn.decomposition import PCA
pca = PCA()
print('✅ Scikit-learn OK')
print('Loading TensorFlow...')
from tensorflow.keras import Sequential, layers
model = Sequential()
model.add(layers.Input(shape=(4,)))
model.add(layers.Dense(10, activation='relu'))
model.add(layers.Dense(1, activation='linear'))
model.summary()
print('✅ TensorFlow OK')
