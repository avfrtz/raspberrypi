All: checkPrime listPrimes
CC=gcc

checkPrime: checkPrime.o
	$(CC) $@.o -g -o $@

listPrimes: listPrimes.o
	$(CC) $@.o -g -o $@

.s.o:
	$(CC) $(@:.o=.s) -g -c -o $@
