CC = gcc
SRC = src/
CFLAGS = -g -O3 -funroll-loops -ffast-math -ftree-vectorize -mavx -mfpmath=sse -march=x86-64
# -fsanitize=thread
.DEFAULT_GOAL = all

all: MDseq.exe MDpar.exe

MDseq.exe: $(SRC)/MDseq.cpp
	$(CC) $(CFLAGS) $(SRC)MDseq.cpp -lm -o MDseq.exe

MDpar.exe: $(SRC)/MDpar.cpp
	$(CC) $(CFLAGS) $(SRC)MDpar.cpp -lm -fopenmp -o MDpar.exe

clean:
	rm ./MD*.exe

runseq: MDseq.exe
	./MDseq.exe < inputdata.txt

runpar: MDpar.exe
	export OMP_NUM_THREADS=16;\
	./MDpar.exe < inputdata.txt


#	perf record -g -o gperf.out ./MD.exe < inputdata.txt


