#!/bin/bash
#SBATCH --time=1:00
#SBATCH --ntasks=4
#SBATCH --partition=cpar
perf stat -e cache-references,cache-misses,instructions,cycles $1 < inputdata.txt 