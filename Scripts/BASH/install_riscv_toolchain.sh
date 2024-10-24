#!/bin/bash

InstallationPath=~/Desktop/GNUToolchain

#PreSteps:
#Creating Installation Folder
if [ ! -d "$InstallationPath" ]; then
    echo "Installation Folder $InstallationPath does not exist. Creating folder..."
    mkdir "$InstallationPath"
    echo "Folder created successfully."
else
    echo "Folder already exists."
fi

#Creating Config Foldure
if [ ! -d "$InstallationPath" ]; then
    echo "Installation Folder $InstallationPath/opt/riscv does not exist. Creating folder..."
    mkdir $InstallationPath/opt
    mkdir $InstallationPath/opt/riscv
    echo "Folder created successfully."
else
    echo "Folder already exists."
fi


# Step 1: Navigate to the folder where you want to download RISCV-GNU-Toolchain’s installation files
cd $InstallationPath || exit

# Step 2: Clone the RISCV-GNU-Toolchain repository
git clone --recursive https://github.com/pulp-platform/pulp-riscv-gnu-toolchain >> clone.log|| exit


# Step 3: Navigate inside the cloned folder and configure, make the toolchain
cd riscv-gnu-toolchain || exit
./configure --prefix=$InstallationPath/opt/riscv --with-arch=rv32imc --with-cmodel=medlow --enable-multilib >> configure.log|| exit
make >> make.log|| exit

# Step 4: Go back to the root and add environment variables to .bashrc
cd ~ || exit
echo "export PULP_RISCV_GCC_TOOLCHAIN=$InstallationPath" >> .bashrc || exit
echo "export PATH=\$PULP_RISCV_GCC_TOOLCHAIN/bin:\$PATH" >> .bashrc || exit

echo "Installation completed successfully."
