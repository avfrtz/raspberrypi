All: Feet2Inches F2C C2F Inches2Feet Miles2Kilometers kph
LIB=libConversions.o
CC=gcc

Feet2Inches: Feet2Inches.o $(LIB)
	$(CC) $@.o $(LIB) -g -o $@

Inches2Feet: Inches2Feet.o $(LIB)
	$(CC) $@.o $(LIB) -g -o $@

F2C: F2C.o $(LIB)
	$(CC) $@.o $(LIB) -g -o $@

C2F: C2F.o $(LIB)
	$(CC) $@.o $(LIB) -g -o $@

Miles2Kilometers: Miles2Kilometers.o $(LIB)
	$(CC) $@.o $(LIB) -g -o $@

kph: kph.o $(LIB)
	$(CC) $@.o $(LIB) -g -o $@

.s.o:
	$(CC) $(@:.o=.s) -g -c -o $@
