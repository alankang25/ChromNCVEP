import pandas as pd
import numpy as np
import torch
import torch.nn as nn
import torch.optim as optim
from sklearn.model_selection import train_test_split


from sklearn.preprocessing import StandardScaler

# Check if MPS or CUDA is available
if torch.backends.mps.is_available(): device = torch.device("mps")
elif torch.cuda.is_available(): device = torch.device("cuda")
else: device = torch.device("cpu")

# Load the datasets
dfObs = pd.read_csv('/Users/brianhakam/Desktop/ncVEP/chr_21.csv')
dfSyn = pd.read_csv('/Users/brianhakam/Desktop/ncVEP/chr_21_synthetic.csv')

# Ensure both datasets have the same number of samples
dfObs = dfObs.sample(n=len(dfSyn), random_state=42)

# Prepare the data
dfObs['label'] = 0
dfSyn['label'] = 1

df = pd.concat([dfObs, dfSyn], ignore_index=True)

# Identify non-numeric columns (excluding 'label')
non_numeric_columns = df.select_dtypes(include=['object']).columns.tolist()
if 'label' in non_numeric_columns:
    non_numeric_columns.remove('label')  # Ensure 'label' is not dropped from y

# Option 1: Drop non-numeric columns
X = df.drop(['label'] + non_numeric_columns, axis=1).values

# Option 2: Encode non-numeric columns (uncomment if you choose to encode)
# df_encoded = pd.get_dummies(df, columns=non_numeric_columns)
# X = df_encoded.drop(['label'], axis=1).values

y = df['label'].values

# Scale the features
scaler = StandardScaler()
X = scaler.fit_transform(X)

# Split into training and test sets
X_train, X_test, y_train, y_test = train_test_split(
    X, y, test_size=0.2, random_state=42
)

# Define the model
class SimpleNN(nn.Module):
    def __init__(self, *layers):
        super(SimpleNN, self).__init__()
        layer_sizes = []
        for layer in layers:
            if isinstance(layer, tuple):
                layer_sizes.extend([layer[0]] * layer[1])
            else:
                layer_sizes.append(layer)
        
        self.layers = nn.ModuleList()
        for i in range(len(layer_sizes) - 1):
            self.layers.append(nn.Linear(layer_sizes[i], layer_sizes[i + 1]))
            self.layers.append(nn.ReLU())
        self.layers.append(nn.Linear(layer_sizes[-1], 1))
        self.sigmoid = nn.Sigmoid()

    def forward(self, x):
        for layer in self.layers[:-1]:
            x = torch.relu(layer(x))
        x = self.sigmoid(self.layers[-1](x))
        return x

input_dim = X_train.shape[1]
modelLayers = (50, 50, 25)
# modelLayers = ((100, 3), 50, 25, 10)
model = SimpleNN(input_dim, modelLayers).to(device)

# Training the model
criterion = nn.BCELoss()
optimizer = optim.Adam(model.parameters(), lr=0.001)
X_train_tensor = torch.tensor(X_train, dtype=torch.float32).to(device)
y_train_tensor = torch.tensor(y_train, dtype=torch.float32).view(-1, 1).to(device)

for epoch in range(100):
    model.train()
    optimizer.zero_grad()
    outputs = model(X_train_tensor)
    loss = criterion(outputs, y_train_tensor)
    loss.backward()
    optimizer.step()
    if (epoch + 1) % 10 == 0:
        print(f'Epoch [{epoch + 1}/100], Loss: {loss.item():.4f}')

# Testing the model
X_test_tensor = torch.tensor(X_test, dtype=torch.float32).to(device)
y_test_tensor = torch.tensor(y_test, dtype=torch.float32).view(-1, 1).to(device)

model.eval()
with torch.no_grad():
    outputs = model(X_test_tensor)
    predicted = (outputs > 0.5).float()
    accuracy = (predicted.eq(y_test_tensor).sum() / y_test_tensor.shape[0]).item()
    print(f'Accuracy: {accuracy:.4f}')
