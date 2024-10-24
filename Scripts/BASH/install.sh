#!/bin/bash

sshpass -p 1111 ssh pulp@192.168.1.13 'bash -s' < install_riscv_toolchain.sh
exit
sshpass -p 1111 ssh pulp@192.168.1.13 'bash -s' < PULPissimo.sh > PULP.log
exit
#sshpass -p 1111 ssh pulp@192.168.1.13 'bash s' <PULP_Simulation.sh
#exit