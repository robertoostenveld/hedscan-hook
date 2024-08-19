CC=gcc
CFLAGS=-I. -Wall
LFLAGS=
DEPS=

all: hedscan-gui

%.o: %.c $(DEPS)
	$(CC) -c -o $@ $< $(CFLAGS)

hedscan-gui: hedscan-gui.o
	gcc -o $@ $^ $(CFLAGS) $(LFLAGS)

