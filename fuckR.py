
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


standardized_residuals = residuals / standard_deviation

# Plot residuals
""" plt.figure(figsize=(20, 10))
plt.scatter(standardized_residuals.index, standardized_residuals)
plt.axhline(y = standardized_residuals.mean(), color = 'r', linestyle = '-')

# Plot the upper and lower standard deviation lines
plt.axhline(y=standardized_residuals.mean() + 2, color = 'g', linestyle='--')
plt.axhline(y=standardized_residuals.mean() - 2, color = 'g', linestyle='--')

plt.title('Standardized Residuals', fontsize = 20)
plt.xlabel('Index', fontsize = 15)
plt.ylabel('Error Magnitude', fontsize = 15)
plt.legend(['Error Magnitude', 'Error Mean', 'Two Standard Deviations'])
plt.show()
  """

# Calculate the Studentized Residuals
studentized_residuals = []

for i in range(len(residuals)):
    studentized_residuals.append(residuals[i] / (standard_deviation * np.sqrt(1 - np.power(X.iloc[i].dot(np.linalg.inv(X.T.dot(X))).dot(X.iloc[i].T), 2))))

#studentized_residuals = residuals / (standard_deviation*np.sqrt(1 - np.power(X.dot(np.linalg.inv(X.T.dot(X))).dot(X.T), 2).diagonal()))

studentized_residuals = pd.Series(studentized_residuals)


# Plot the Studentized Residuals
plt.figure(figsize=(20, 10))
plt.scatter(studentized_residuals.index, studentized_residuals)
plt.title('Studentized Residuals', fontsize = 20)
plt.xlabel('Index', fontsize = 15)
plt.ylabel('Error Magnitude', fontsize = 15)
plt.show() 







