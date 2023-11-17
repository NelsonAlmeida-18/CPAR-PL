#!/bin/bash
#SBATCH --time=1:00
#SBATCH --ntasks=4
#SBATCH --partition=cpar
$1 < inputdata.txt