cc = clang# Compiler

# Build all
all: brightness battery

brightness: src/brightness.c
	$(cc) $^ -o $@

battery: src/battery.c
	$(cc) $^ -o $@

clean:
	rm -rf battery brightness
