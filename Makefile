# Makefile for Statistics Calculator Multi-Language Project

# Compiler settings
CC = gcc
CFLAGS = -Wall -Wextra -std=c99 -O2
OCAMLC = ocamlc
PYTHON = python3

# Target executables
C_TARGET = statistics_calculator_c
OCAML_TARGET = statistics_calculator_ocaml

# Source files
C_SOURCE = statistics_calculator.c
OCAML_SOURCE = statistics_calculator.ml
PYTHON_SOURCE = statistics_calculator.py

.PHONY: all clean run-all run-c run-ocaml run-python help

# Default target
all: $(C_TARGET) $(OCAML_TARGET)
	@echo "All implementations compiled successfully!"
	@echo "Run 'make run-all' to execute all versions"

# Compile C version
$(C_TARGET): $(C_SOURCE)
	@echo "Compiling C implementation..."
	$(CC) $(CFLAGS) -o $(C_TARGET) $(C_SOURCE)
	@echo "C implementation compiled successfully!"

# Compile OCaml version
$(OCAML_TARGET): $(OCAML_SOURCE)
	@echo "Compiling OCaml implementation..."
	$(OCAMLC) -o $(OCAML_TARGET) $(OCAML_SOURCE)
	@echo "OCaml implementation compiled successfully!"

# Run all implementations
run-all: all run-c run-ocaml run-python

# Run C implementation
run-c: $(C_TARGET)
	@echo "\n" "=" "*" 50
	@echo "Running C Implementation"
	@echo "=" "*" 50
	./$(C_TARGET)

# Run OCaml implementation
run-ocaml: $(OCAML_TARGET)
	@echo "\n" "=" "*" 50
	@echo "Running OCaml Implementation"
	@echo "=" "*" 50
	./$(OCAML_TARGET)

# Run Python implementation
run-python:
	@echo "\n" "=" "*" 50
	@echo "Running Python Implementation"
	@echo "=" "*" 50
	$(PYTHON) $(PYTHON_SOURCE)

# Clean compiled files
clean:
	@echo "Cleaning compiled files..."
	rm -f $(C_TARGET) $(OCAML_TARGET)
	rm -f *.cmi *.cmo
	@echo "Clean complete!"

# Help target
help:
	@echo "Statistics Calculator Build System"
	@echo "=================================="
	@echo ""
	@echo "Available targets:"
	@echo "  all        - Compile C and OCaml implementations"
	@echo "  run-all    - Compile and run all three implementations"
	@echo "  run-c      - Compile and run C implementation"
	@echo "  run-ocaml  - Compile and run OCaml implementation"
	@echo "  run-python - Run Python implementation"
	@echo "  clean      - Remove compiled files"
	@echo "  help       - Show this help message"
	@echo ""
	@echo "Examples:"
	@echo "  make all        # Compile everything"
	@echo "  make run-all    # Run all implementations"
	@echo "  make clean      # Clean up"
