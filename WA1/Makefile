CC = gcc
SRC = src/
CFLAGS = -O3 -funroll-loops -ffast-math 
.DEFAULT_GOAL = MD.exe

MD: $(SRC)/MD.cpp
	$(CC) $(CFLAGS) $(SRC)MD.cpp -lm -o MD.exe

clean:
	rm ./MD.exe

run:
	./MD.exe < inputdata.txt

run_perf:
	srun --partition=cpar --cpus-per-task=2 perf stat -e instructions,cycles ./MD.exe < inputdata.txt 

run_perfcm:
	srun --partition=cpar --cpus-per-task=2 perf stat -e cache-references,cache-misses,instructions,cycles ./MD.exe < inputdata.txt 

run_perfcm_avg:
	srun --partition=cpar --cpus-per-task=2 perf stat -r 10 -e cache-references,cache-misses,instructions,cycles ./MD.exe < inputdata.txt 

run_gperf:
	srun --partition=cpar --cpus-per-task=2 perf record -g -o gperf.out ./MD.exe < inputdata.txt

gprofc:
	gcc -Wall $(CFLAGS) -pg ./src/MD.cpp  -lm -o MD_gprof

gprof_run:
	./MD_gprof < inputdata.txt

gprof_output:
	gprof MD.exe gmon.out > "analysis-$$(date +"%Y-%m-%-d-%H-%M").txt"
