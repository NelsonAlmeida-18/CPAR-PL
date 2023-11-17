CC = gcc
SRC = src/
CFLAGS = -O3 -funroll-loops -ffast-math -ftree-vectorize -mavx -mfpmath=sse -march=x86-64
.DEFAULT_GOAL = all

all: MDseq.exe MDpar.exe

MDseq.exe: $(SRC)/MDseq.cpp
	module load gcc/11.2.0;
	$(CC) $(CFLAGS) $(SRC)MDseq.cpp -lm -o MDseq.exe

MDpar.exe: $(SRC)/MDpar.cpp
	module load gcc/11.2.0;
	$(CC) $(CFLAGS) $(SRC)MDpar.cpp -lm -fopenmp -o MDpar.exe

clean:
	rm ./MD*.exe

runseq:
	sbatch script_MD.sh ./MDseq.exe

runpar:
	sbatch script_MD.sh ./MDpar.exe

run_perfseq:
	sbatch script_perf.sh ./MDseq.exe

run_perfcmpar:
	sbatch script_perf.sh ./MDpar.exe

#run_gperf:
#	perf record -g -o gperf.out ./MD.exe < inputdata.txt
