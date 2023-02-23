
import pandas as pd
import matplotlib.pyplot as plt
import numpy as np

# Import bodyfatwomen.csv

df = pd.read_csv('bodyfatwomen.csv')

# Create model
y = df['DEXfat']
X = df[['age', 'waistcirc', 'hipcirc', 'elbowbreadth', 'kneebreadth', 'anthro3a', 'anthro3b', 'anthro3c', 'anthro4']]
X.insert(0, 'Ones', 1)

# Calculate beta = (X'X)^-1*X'y

beta = np.linalg.inv(X.T.dot(X)).dot(X.T).dot(y)
y_hat = X.dot(beta)

# calculate residuals
residuals = y - y_hat

standard_deviation = np.sqrt(np.dot(residuals, residuals) / (len(y) - len(X.columns)))
print('Standard deviation: ', standard_deviation)

# Plot residuals
plt.figure(figsize=(20, 10))
plt.scatter(residuals.index, residuals)
plt.axhline(y=residuals.mean(), color = 'r', linestyle = '-')

# Plot the upper and lower standard deviation lines
plt.axhline(y=residuals.mean() + standard_deviation, color = 'g', linestyle='--')
plt.axhline(y=residuals.mean() - standard_deviation, color = 'g', linestyle='--')

plt.title('Residuals', fontsize = 20)
plt.xlabel('Index', fontsize = 15)
plt.ylabel('Error Magnitude', fontsize = 15)
plt.legend(['Error Magnitude', 'Error Mean', 'Standard Deviation'])
plt.show()

