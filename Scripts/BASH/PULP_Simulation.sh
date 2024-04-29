#!/bin/bash

#step 1: Navigate to the folder where pulpissimo was installed
cd ~/Desktop/proje/pulpissimo || exit

# Step 2: Source the cv32.sh configuration file
source configs/pulpissimo_cv32.sh || exit

# Step 3: Navigate back and go inside pulpissimo folder
cd .. || exit
cd pulpissimo || exit

# Step 4: Source the vsim.sh setup file
source setup/vsim.sh || exit

# Step 5: Build the project
make build || exit

# Step 6: Navigate back and go inside pulp-runtime-examples folder
cd .. || exit
cd pulp-runtime-examples || exit

# Step 7: Go to hello folder
cd hello || exit

# Step 8: Clean, build, and run the simulation
make clean all run || exit

echo "Simulation completed successfully."

