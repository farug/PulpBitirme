#!/bin/bash

# Step 1: Navigate to the folder where pulpissimo will be installed
cd ~/Desktop/proje || exit

# Step 2: Clone pulpissimo repository
git clone https://github.com/pulp-platform/pulpissimo || exit

# Step 3: Clone pulpruntime repository
git clone https://github.com/pulp-platform/pulp-runtime/ || exit

# Step 4: Clone pulp-runtime-examples repository
git clone https://github.com/pulp-platform/pulp-runtime-examples || exit

# Step 5: Navigate inside the pulpissimo folder
cd pulpissimo || exit

# Step 6: Run the initialization script
curl --proto '=https' --tlsv1.2 https://pulp-platform.github.io/bender/init -sSf | sh || exit

# Step 7: Run the "make checkout" command
make checkout || exit

echo "Installation completed successfully."

