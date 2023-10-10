CC = gcc
SRC = src/
CFLAGS = #None

.DEFAULT_GOAL = MD.exe

MD.exe: $(SRC)/MD.cpp
	$(CC) $(CFLAGS) $(SRC)MD.cpp -lm -o MD.exe

clean:
	rm ./MD.exe

run:
	./MD.exe < inputdata.txt

run_perf:
	srun --partition=cpar perf stat -e instructions,cycles ./MD.exe < inputdata.txt 

gprofc:
	gcc -Wall -pg ./src/MD.cpp  -lm -o MD_gprof

gprof_run:
	./MD_gprof < inputdata.txt

gprof_output:
	gprof MD.exe gmon.out > "analysis-$$(date +"%Y-%m-%-d-%H-%M").txt"