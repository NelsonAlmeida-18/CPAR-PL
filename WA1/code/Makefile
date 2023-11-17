CC = gcc
SRC = src/
CFLAGS = -O3 -funroll-loops -ffast-math -ftree-vectorize -mavx -mfpmath=sse -march=x86-64
.DEFAULT_GOAL = MD.exe

MD: $(SRC)MD.cpp
	$(CC) $(CFLAGS) $(SRC)MD.cpp -lm -o MD.exe

clean:
	rm ./MD.exe

run:
	./MD.exe < inputdata.txt

run_perf:
	srun --partition=cpar perf stat -e instructions,cycles ./MD.exe < inputdata.txt 

run_perf_host:
	perf stat -e instructions,cycles ./MD.exe < inputdata.txt 

annotate:
	perf stat -e instructions,cycles ./MD.exe < inputdata.txt 

gprof_run:
	./MD_gprof < inputdata.txt

gprof_output:
	gprof MD.exe gmon.out > "analysis-$$(date +"%Y-%m-%-d-%H-%M").txt"

run_perfcm:
	srun --partition=cpar --cpus-per-task=2 perf stat -e cache-references,cache-misses,instructions,cycles ./MD.exe < inputdata.txt 

run_perfcm_avg:
	srun --partition=cpar --cpus-per-task=2 perf stat -r 10 -e cache-references,cache-misses,instructions,cycles ./MD.exe < inputdata.txt 

run_gperf:
	srun --partition=cpar --cpus-per-task=2 perf record -g -o gperf.out ./MD.exe < inputdata.txt

run_gperf_host:
	perf record -g -o gperf.out ./MD.exe < inputdata.txt

gprofc:
	gcc -Wall $(CFLAGS) -pg ./src/MD.cpp  -lm -o MD_gprof

gprof_foutput: 
	gprof -b MD.exe gmon.out > "analysis-$$(date +"%Y-%m-%-d-%H-%M").txt"