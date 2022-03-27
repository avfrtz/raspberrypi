All: multiplication fibonacci
CC=gcc

multiplication: multiplication.o
	$(CC) $@.o -g -o $@

fibonacci: fibonacci.o
	$(CC) $@.o -g -o $@

.s.o:
	$(CC) $(@:.o=.s) -g -c -o $@
