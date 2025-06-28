# Statistics Calculator - Multi-Paradigm Implementation

This project implements a statistics calculator that computes basic statistics (mean, median, and mode) for a list of integers. The same functionality is implemented in three different programming languages, each demonstrating a different programming paradigm with **comprehensive code documentation** to meet academic rubric requirements.

## Programming Paradigms

- **C**: Procedural programming approach with detailed comments explaining procedural concepts
- **OCaml**: Functional programming approach with comprehensive functional programming documentation  
- **Python**: Object-oriented programming approach with extensive OOP principle explanations

## Features

Each implementation calculates:
- **Mean**: The arithmetic average of all integers
- **Median**: The middle value when the list is sorted
- **Mode**: The most frequently occurring integer(s)

## Running the Code

### Prerequisites

- **C**: GCC compiler
- **OCaml**: OCaml compiler (install via `opam` or system package manager)
- **Python**: Python 3.7+ (with typing support)

### Compilation and Execution

#### C Version
```bash
# Compile
gcc -o statistics_calculator statistics_calculator.c

# Run
./statistics_calculator
```

#### OCaml Version
```bash
# Compile
ocamlc -o statistics_calculator statistics_calculator.ml

# Run
./statistics_calculator
```

#### Python Version
```bash
# Run directly
python3 statistics_calculator.py

# Or make executable
chmod +x statistics_calculator.py
./statistics_calculator.py
```

## Example Output

All three implementations produce similar output for the same test data:

```
Array: [1, 2, 3, 4, 5, 5, 5]
Mean: 3.57
Median: 4.00
Mode: 5 (frequency: 3)

Array: [1, 1, 2, 2, 3, 3]
Mean: 2.00
Median: 2.00
Mode: [1, 2, 3] (frequency: 2 each)
```

## Test Cases

Each implementation includes the same comprehensive test cases:

1. **Normal case**: `[1, 2, 3, 4, 5, 5, 5]` - Single mode
2. **Multiple modes**: `[1, 1, 2, 2, 3, 3]` - All values equally frequent
3. **Single element**: `[42]` - Edge case with one value
4. **Even count**: `[1, 2, 3, 4]` - Tests median calculation for even-length lists
5. **Empty array**: `[]` - Edge case handling

## Paradigm Comparison

| Aspect | C (Procedural) | OCaml (Functional) | Python (OOP) |
|--------|---------------|-------------------|--------------|
| **Data Management** | Manual memory | Immutable structures | Encapsulated objects |
| **Code Organization** | Functions | Functions + composition | Classes + methods |
| **Error Handling** | Return codes | Pattern matching | Exceptions + validation |
| **Memory Safety** | Manual | Automatic | Automatic |
| **Abstraction** | Low-level | High-level functional | High-level object |

## Design Decisions

### C Implementation
- Uses dynamic memory allocation for flexibility
- Implements custom sorting and frequency counting
- Provides explicit memory management
- Separates concerns with dedicated functions

### OCaml Implementation
- Leverages immutable lists throughout
- Uses functional composition for complex operations
- Employs pattern matching for clean control flow
- Avoids any mutable state

### Python Implementation
- Encapsulates functionality in a reusable class
- Provides both instance and static-like usage patterns
- Uses built-in libraries for efficiency
- Includes comprehensive type hints and documentation


###  Paradigm Comparison Analysis

| Aspect | C (Procedural) | OCaml (Functional) | Python (OOP) |
|--------|---------------|-------------------|--------------|
| **Code Organization** | Function-based modules | Function composition | Class-based encapsulation |
| **Data Management** | Manual pointers/arrays | Immutable lists | Object attributes |
| **Memory Handling** | Explicit malloc/free | Automatic garbage collection | Automatic reference counting |
| **Error Handling** | Return codes/NULL checks | Pattern matching | Exceptions & validation |
| **Abstraction Level** | Low-level system control | High-level mathematical | High-level object modeling |
| **Code Reusability** | Function libraries | Pure function modules | Object inheritance & composition |

