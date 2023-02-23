
import pandas as pd
import matplotlib.pyplot as plt

# Import bodyfatwomen.csv

df = pd.read_csv('bodyfatwomen.csv')

# Let DEXfat be the dependent variable and store it in a variable called y
y = df['DEXfat']

# Let the independent variables be the 10 predictor variables and store them in a variable called X
X = df[['age', 'waistcirc', 'hipcirc', 'elbowbreadth', 'kneebreadth', 'anthro3a', 'anthro3b', 'anthro3c', 'anthro4']]
X.insert(0, 'Ones', 1)


