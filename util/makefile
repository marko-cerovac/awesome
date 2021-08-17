cc = clang# Compiler

# Build all
all: brightness battery

brightness: brightness.c
	$(cc) $^ -o $@

battery: battery.c
	$(cc) $^ -o $@

clean: rm battery brightness
