#!/bin/bash

InstallationPath=~/Desktop/GNUToolchain

#Creating Installation Folder
mkdir $InstallationPath

#Creating Config Foldure
mkdir $InstallationPath/opt/riscv

# Step 1: Navigate to the folder where you want to download RISCV-GNU-Toolchain’s installation files
cd $InstallationPath || exit

# Step 2: Clone the RISCV-GNU-Toolchain repository
git clone --recursive https://github.com/pulp-platform/riscv-gnu-toolchain.git || exit

# Step 3: Navigate inside the cloned folder and configure, make the toolchain
cd riscv-gnu-toolchain || exit
./configure --prefix=$InstallationPath/opt/riscv --with-arch=rv32imc --with-cmodel=medlow --enable-multilib || exit
make || exit

# Step 4: Go back to the root and add environment variables to .bashrc
cd ~ || exit
echo "export PULP_RISCV_GCC_TOOLCHAIN=/opt/riscv" >> .bashrc || exit
echo "export PATH=\$PULP_RISCV_GCC_TOOLCHAIN/bin:\$PATH" >> .bashrc || exit

echo "Installation completed successfully."
