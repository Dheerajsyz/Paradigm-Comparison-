/*
 * Statistics Calculator - C Implementation (Procedural Programming Paradigm)
 * 
 * This implementation demonstrates procedural programming principles:
 * - Program is organized as a collection of functions
 * - Each function performs a specific task
 * - Manual memory management using malloc/free
 * - Direct manipulation of arrays and pointers
 * - Explicit control flow and data handling
 */

#include <stdio.h>   // Standard I/O functions (printf, etc.)
#include <stdlib.h>  // Memory allocation functions (malloc, free, qsort)
#include <string.h>  // String manipulation functions (memcpy)

/*
 * PROCEDURAL FUNCTION: Calculate Mean
 * 
 * Demonstrates procedural approach to statistical calculation.
 * Takes array and size as parameters, returns computed result.
 * Uses basic iteration and accumulation pattern.
 * 
 * Parameters:
 *   arr  - Pointer to integer array (procedural data passing)
 *   size - Number of elements in array
 * 
 * Returns: Mean value as double, 0.0 for empty array
 */
double calculate_mean(int* arr, int size) {
    // Edge case handling - procedural validation
    if (size == 0) return 0.0;
    
    // Procedural accumulation using explicit loop
    long sum = 0;  // Use long to prevent integer overflow
    for (int i = 0; i < size; i++) {
        sum += arr[i];  // Direct array element access
    }
    
    // Explicit type conversion and return
    return (double)sum / size;
}

/*
 * PROCEDURAL HELPER FUNCTION: Comparison for qsort
 * 
 * Demonstrates procedural design pattern for function pointers.
 * Required by C's qsort() library function.
 * Shows explicit comparison logic typical in procedural programming.
 */
int compare(const void* a, const void* b) {
    // Cast void pointers back to int pointers (procedural type handling)
    return (*(int*)a - *(int*)b);
}

/*
 * PROCEDURAL FUNCTION: Calculate Median
 * 
 * Demonstrates procedural approach to median calculation:
 * - Manual memory allocation and deallocation
 * - Explicit copying and sorting operations
 * - Conditional logic for even/odd length arrays
 * - Resource management (malloc/free pattern)
 * 
 * Parameters:
 *   arr  - Original array (remains unchanged - procedural immutability)
 *   size - Array size
 * 
 * Returns: Median value as double
 */
double calculate_median(int* arr, int size) {
    // Edge case - procedural validation
    if (size == 0) return 0.0;
    
    // MANUAL MEMORY MANAGEMENT (key procedural characteristic)
    // Allocate memory for a copy to avoid modifying original array
    int* sorted_arr = malloc(size * sizeof(int));
    if (!sorted_arr) {
        // Error handling in procedural style
        fprintf(stderr, "Memory allocation failed\n");
        return 0.0;
    }
    
    // Explicit memory copying (procedural data manipulation)
    memcpy(sorted_arr, arr, size * sizeof(int));
    
    // Sort the array using C standard library function
    qsort(sorted_arr, size, sizeof(int), compare);
    
    double median;
    
    // Procedural conditional logic for median calculation
    if (size % 2 == 0) {
        // Even number of elements - average of two middle values
        median = (sorted_arr[size/2 - 1] + sorted_arr[size/2]) / 2.0;
    } else {
        // Odd number of elements - middle value
        median = sorted_arr[size/2];
    }
    
    // EXPLICIT RESOURCE CLEANUP (procedural memory management)
    free(sorted_arr);
    return median;
}

/*
 * PROCEDURAL DATA STRUCTURE: Mode Result
 * 
 * Demonstrates procedural approach to complex data handling.
 * Uses struct to group related data together.
 * Manual management of dynamic arrays within the structure.
 */
typedef struct {
    int* modes;      // Dynamic array of mode values (procedural dynamic allocation)
    int count;       // Number of modes found
    int frequency;   // Frequency of the mode(s)
} ModeResult;

/*
 * PROCEDURAL FUNCTION: Calculate Mode (Most Complex Algorithm)
 * 
 * Demonstrates advanced procedural programming concepts:
 * - Two-pass algorithm for efficiency
 * - Dynamic memory allocation for results
 * - Explicit frequency counting using loops
 * - Manual array management and copying
 * - Return of complex data structure
 * 
 * This function showcases procedural problem-solving approach:
 * 1. Sort data for efficient processing
 * 2. First pass: find maximum frequency
 * 3. Second pass: collect all values with max frequency
 * 4. Package results in a structure
 * 
 * Parameters:
 *   arr  - Input array
 *   size - Array size
 * 
 * Returns: ModeResult structure containing modes and frequency
 */
ModeResult calculate_mode(int* arr, int size) {
    // Initialize result structure (procedural initialization)
    ModeResult result = {NULL, 0, 0};
    
    // Edge case handling
    if (size == 0) return result;
    
    // STEP 1: Create and sort a copy (procedural data preparation)
    int* sorted_arr = malloc(size * sizeof(int));
    if (!sorted_arr) {
        fprintf(stderr, "Memory allocation failed in calculate_mode\n");
        return result;
    }
    memcpy(sorted_arr, arr, size * sizeof(int));
    qsort(sorted_arr, size, sizeof(int), compare);
    
    // STEP 2: First pass - find maximum frequency (procedural counting)
    int max_frequency = 1;
    int current_frequency = 1;
    int current_value = sorted_arr[0];
    
    // Procedural iteration through sorted array
    for (int i = 1; i < size; i++) {
        if (sorted_arr[i] == current_value) {
            // Same value - increment frequency
            current_frequency++;
        } else {
            // New value - check if current frequency is maximum
            if (current_frequency > max_frequency) {
                max_frequency = current_frequency;
            }
            // Reset for new value
            current_value = sorted_arr[i];
            current_frequency = 1;
        }
    }
    // Check final frequency (procedural boundary condition)
    if (current_frequency > max_frequency) {
        max_frequency = current_frequency;
    }
    
    // STEP 3: Second pass - collect all values with maximum frequency
    int* temp_modes = malloc(size * sizeof(int));  // Temporary storage
    if (!temp_modes) {
        free(sorted_arr);
        return result;
    }
    
    int mode_count = 0;
    current_frequency = 1;
    current_value = sorted_arr[0];
    
    // Procedural collection of modes
    for (int i = 1; i < size; i++) {
        if (sorted_arr[i] == current_value) {
            current_frequency++;
        } else {
            // Check if this value has maximum frequency
            if (current_frequency == max_frequency) {
                temp_modes[mode_count++] = current_value;
            }
            current_value = sorted_arr[i];
            current_frequency = 1;
        }
    }
    // Check final value (procedural boundary condition)
    if (current_frequency == max_frequency) {
        temp_modes[mode_count++] = current_value;
    }
    
    // STEP 4: Allocate final result array (exact size)
    result.modes = malloc(mode_count * sizeof(int));
    if (result.modes) {
        memcpy(result.modes, temp_modes, mode_count * sizeof(int));
        result.count = mode_count;
        result.frequency = max_frequency;
    }
    
    // Cleanup temporary allocations (procedural resource management)
    free(sorted_arr);
    free(temp_modes);
    return result;
}

/*
 * PROCEDURAL UTILITY FUNCTION: Free Mode Result
 * 
 * Demonstrates procedural resource management pattern.
 * Explicit cleanup function to prevent memory leaks.
 * Shows procedural approach to destructor-like functionality.
 */
void free_mode_result(ModeResult* result) {
    if (result->modes) {
        free(result->modes);        // Release dynamically allocated memory
        result->modes = NULL;       // Prevent dangling pointer
    }
    // Reset structure fields (procedural cleanup)
    result->count = 0;
    result->frequency = 0;
}

/*
 * PROCEDURAL UTILITY FUNCTION: Print Array
 * 
 * Demonstrates procedural approach to formatted output.
 * Simple iteration with conditional formatting.
 */
void print_array(int* arr, int size) {
    printf("[");
    for (int i = 0; i < size; i++) {
        printf("%d", arr[i]);
        if (i < size - 1) printf(", ");  // Procedural conditional formatting
    }
    printf("]");
}

/*
 * PROCEDURAL FUNCTION: Print Statistics (Main Output Function)
 * 
 * Demonstrates procedural program organization:
 * - Calls multiple specialized functions in sequence
 * - Handles all output formatting in one place
 * - Manages temporary data structures
 * - Shows procedural error handling patterns
 */
void print_statistics(int* arr, int size) {
    // Display input data
    printf("Array: ");
    print_array(arr, size);
    printf("\n");
    
    // Procedural validation and early return
    if (size == 0) {
        printf("Cannot calculate statistics for empty array.\n");
        return;
    }
    
    // PROCEDURAL CALCULATION SEQUENCE
    // Each calculation is independent and calls specific function
    
    // Calculate and display mean
    double mean = calculate_mean(arr, size);
    printf("Mean: %.2f\n", mean);
    
    // Calculate and display median  
    double median = calculate_median(arr, size);
    printf("Median: %.2f\n", median);
    
    // Calculate and display mode (most complex case)
    ModeResult mode_result = calculate_mode(arr, size);
    printf("Mode: ");
    
    // Procedural conditional output formatting
    if (mode_result.count == 1) {
        // Single mode case
        printf("%d (frequency: %d)\n", mode_result.modes[0], mode_result.frequency);
    } else {
        // Multiple modes case
        printf("[");
        for (int i = 0; i < mode_result.count; i++) {
            printf("%d", mode_result.modes[i]);
            if (i < mode_result.count - 1) printf(", ");
        }
        printf("] (frequency: %d each)\n", mode_result.frequency);
    }
    
    // IMPORTANT: Explicit cleanup (procedural memory management)
    free_mode_result(&mode_result);
    printf("\n");
}

/*
 * PROCEDURAL MAIN FUNCTION: Program Entry Point
 * 
 * Demonstrates procedural program structure:
 * - Sequential execution of test cases
 * - Static array initialization 
 * - Direct function calls with explicit parameters
 * - Linear program flow typical of procedural programming
 * 
 * This main function showcases procedural testing methodology:
 * - Each test case is explicit and independent
 * - Manual calculation of array sizes using sizeof
 * - Direct passing of array pointers and sizes
 */
int main() {
    printf("=== C Statistics Calculator (Procedural Approach) ===\n\n");
    
    // TEST CASE 1: Normal case with clear mode
    // Demonstrates typical procedural array declaration and initialization
    int arr1[] = {1, 2, 3, 4, 5, 5, 5};
    int size1 = sizeof(arr1) / sizeof(arr1[0]);  // Procedural size calculation
    print_statistics(arr1, size1);
    
    // TEST CASE 2: Multiple modes (tie scenario)
    // Shows procedural handling of complex statistical cases
    int arr2[] = {1, 1, 2, 2, 3, 3};
    int size2 = sizeof(arr2) / sizeof(arr2[0]);
    print_statistics(arr2, size2);
    
    // TEST CASE 3: Single element (edge case)
    // Procedural edge case testing
    int arr3[] = {42};
    int size3 = sizeof(arr3) / sizeof(arr3[0]);
    print_statistics(arr3, size3);
    
    // TEST CASE 4: Even number of elements (median edge case)
    // Tests procedural median calculation for even-length arrays
    int arr4[] = {1, 2, 3, 4};
    int size4 = sizeof(arr4) / sizeof(arr4[0]);
    print_statistics(arr4, size4);
    
    // TEST CASE 5: Empty array (boundary condition)
    // Procedural null pointer handling and boundary testing
    int* arr5 = NULL;
    print_statistics(arr5, 0);  // Explicit size of 0 for empty case
    
    // Procedural program termination
    return 0;  // Standard success return code
}
