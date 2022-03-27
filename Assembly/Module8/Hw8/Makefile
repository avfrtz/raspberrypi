All: mod8Q1 mod8Q2
LIB=libConversions.o
CC=gcc

mod8Q1: mod8Q1.o $(LIB)
	$(CC) $@.o $(LIB) -g -o $@

mod8Q2: mod8Q2.o $(LIB)
	$(CC) $@.o $(LIB) -g -o $@

.s.o:
	$(CC) $(@:.o=.s) -g -c -o $@
