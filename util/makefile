#C Compiler
CC=clang

# Build all
all: brightness battery

brightness: src/brightness.c
	$(CC) $^ -o $@

battery: src/battery.c
	$(CC) $^ -o $@

clean:
	rm -rf battery brightness
