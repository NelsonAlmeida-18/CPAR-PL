#!/bin/bash
#SBATCH --time=1:00
#SBATCH --partition=cpar
#SBATCH --constraint=k20
#SBATCH --ntasks=1

nvcc --version
time nvprof ./bin/MDcuda < inputdata.txt 