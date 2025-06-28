"""
Statistics Calculator - Python Implementation (Object-Oriented Programming Paradigm)

This implementation demonstrates core object-oriented programming principles:
- Encapsulation: Data and methods are bundled within a class
- Abstraction: Complex statistical operations are hidden behind simple interfaces
- Data Hiding: Internal data is protected and accessed through methods
- Method Organization: Related functionality is grouped within the class
- Polymorphism: Methods can work with different data inputs
- Composition: Uses built-in Python objects and libraries

Object-Oriented Design Features:
- Class-based organization with clear responsibilities
- Instance and class methods for different use cases
- Property management with getters/setters
- Error handling through exceptions and validation
- Type hints for better code documentation and IDE support
"""

from typing import List, Tuple, Union
from collections import Counter


class StatisticsCalculator:
    """
    OBJECT-ORIENTED CLASS: Statistics Calculator
    
    Demonstrates key OOP principles:
    - ENCAPSULATION: Data (self._data) and methods are bundled together
    - ABSTRACTION: Complex statistical algorithms hidden behind simple method interfaces
    - DATA HIDING: Internal data stored as private attribute (self._data)
    - INTERFACE DESIGN: Clear, consistent method signatures
    
    This class provides a reusable, maintainable solution for statistical calculations
    while demonstrating object-oriented design patterns and Python best practices.
    
    Attributes:
        _data (List[int]): Private instance variable storing the dataset
    """
    
    def __init__(self, data: List[int] = None):
        """
        CONSTRUCTOR METHOD: Object Initialization
        
        Demonstrates OOP initialization patterns:
        - Optional parameter with default value
        - Instance variable initialization
        - Type hints for parameter documentation
        
        Args:
            data: Optional list of integers to initialize the calculator with
            
        OOP Principle: ENCAPSULATION - bundles data with methods that operate on it
        """
        # PRIVATE INSTANCE VARIABLE (encapsulation principle)
        # Using underscore convention to indicate internal/private data
        self._data = data if data is not None else []
    
    def set_data(self, data: List[int]) -> None:
        """
        SETTER METHOD: Data Encapsulation
        
        Demonstrates OOP data management:
        - Controlled access to internal data
        - Input validation and data protection
        - Defensive copying to prevent external modifications
        
        Args:
            data: List of integers to set as the calculator's dataset
            
        OOP Principle: DATA HIDING - controls how internal data is modified
        """
        # DEFENSIVE COPYING (OOP best practice for data protection)
        self._data = data.copy()  # Create a copy to avoid external modifications
    
    def get_data(self) -> List[int]:
        """
        GETTER METHOD: Data Access Control
        
        Demonstrates OOP data protection:
        - Controlled read access to internal data
        - Returns copy to prevent external modification
        - Maintains object state integrity
        
        Returns:
            Copy of the current dataset to prevent external modifications
            
        OOP Principle: DATA HIDING - provides controlled access to internal state
        """
        # Return copy to maintain encapsulation and prevent external modification
        return self._data.copy()
    
    def calculate_mean(self, data: List[int] = None) -> float:
        """
        INSTANCE METHOD: Calculate Arithmetic Mean
        
        Demonstrates OOP method design principles:
        - Method overloading (can work with instance data or provided data)
        - Parameter flexibility with default values
        - Encapsulation of algorithm within class
        - Clear separation of concerns
        
        Args:
            data: Optional data list. If not provided, uses instance data.
            
        Returns:
            The mean value as a float
            
        OOP Benefits:
        - Reusable algorithm encapsulated in class
        - Can work with both instance and external data
        - Consistent interface across all statistical methods
        """
        # POLYMORPHIC BEHAVIOR: method works with different data sources
        working_data = data if data is not None else self._data
        
        # EDGE CASE HANDLING: Graceful handling of empty data
        if not working_data:
            return 0.0
        
        # ALGORITHM ENCAPSULATION: Mean calculation logic hidden in method
        return sum(working_data) / len(working_data)
    
    def calculate_median(self, data: List[int] = None) -> float:
        """
        INSTANCE METHOD: Calculate Median Value
        
        Demonstrates advanced OOP method design:
        - Complex algorithm encapsulated in single method
        - Handles both even and odd-length datasets
        - Uses built-in Python functions (demonstrating composition)
        - Maintains consistency with class interface
        
        Args:
            data: Optional data list. If not provided, uses instance data.
            
        Returns:
            The median value as a float
            
        OOP Design Pattern: TEMPLATE METHOD
        - Defines algorithm structure in method
        - Handles variations (even/odd length) internally
        """
        working_data = data if data is not None else self._data
        
        if not working_data:
            return 0.0
        
        # IMMUTABLE OPERATION: Creates new sorted list without modifying original
        sorted_data = sorted(working_data)
        n = len(sorted_data)
        
        # ALGORITHM ENCAPSULATION: Median logic encapsulated within method
        if n % 2 == 0:
            # Even number of elements - average of two middle values
            mid1 = sorted_data[n // 2 - 1]
            mid2 = sorted_data[n // 2]
            return (mid1 + mid2) / 2.0
        else:
            # Odd number of elements - middle value
            return float(sorted_data[n // 2])
    
    def calculate_mode(self, data: List[int] = None) -> Tuple[List[int], int]:
        """
        INSTANCE METHOD: Calculate Mode(s) - Most Complex Statistical Method
        
        Demonstrates advanced OOP principles:
        - Complex algorithm encapsulation
        - Use of external libraries (Counter) showing COMPOSITION
        - Returns complex data structure (tuple with list and int)
        - Handles multiple modes elegantly
        - Consistent interface with other methods
        
        Args:
            data: Optional data list. If not provided, uses instance data.
            
        Returns:
            Tuple containing:
            - List of mode values (sorted for consistency)
            - Frequency of the mode(s)
            
        OOP Design Benefits:
        - Algorithm complexity hidden behind simple interface
        - Leverages Python's standard library (composition over inheritance)
        - Maintains consistent return patterns
        """
        working_data = data if data is not None else self._data
        
        if not working_data:
            return ([], 0)
        
        # COMPOSITION: Using Counter class from collections module
        # Demonstrates OOP principle of using existing objects
        frequency_counter = Counter(working_data)
        
        # ENCAPSULATED ALGORITHM: Mode finding logic within method
        max_frequency = max(frequency_counter.values())
        
        # LIST COMPREHENSION: Pythonic approach to filtering and extracting
        modes = [value for value, freq in frequency_counter.items() 
                if freq == max_frequency]
        
        # Return sorted modes for consistent output
        return (sorted(modes), max_frequency)
    
    def calculate_all_statistics(self, data: List[int] = None) -> dict:
        """
        AGGREGATE METHOD: Comprehensive Statistics Calculation
        
        Demonstrates OOP composition and method coordination:
        - Orchestrates multiple methods within the class
        - Returns structured data (dictionary)
        - Shows how OOP methods can call other methods
        - Provides convenient single-call interface
        
        Args:
            data: Optional data list. If not provided, uses instance data.
            
        Returns:
            Dictionary containing all calculated statistics and metadata
            
        OOP Pattern: FACADE
        - Provides simplified interface to complex subsystem
        - Coordinates multiple method calls
        - Returns comprehensive result structure
        """
        working_data = data if data is not None else self._data
        
        if not working_data:
            return {
                'mean': 0.0,
                'median': 0.0,
                'mode': ([], 0),
                'data_size': 0
            }
        
        # METHOD COORDINATION: Calling other instance methods
        # Demonstrates how OOP methods can collaborate
        return {
            'mean': self.calculate_mean(working_data),
            'median': self.calculate_median(working_data), 
            'mode': self.calculate_mode(working_data),
            'data_size': len(working_data)
        }
    
    def print_statistics(self, data: List[int] = None) -> None:
        """
        OUTPUT METHOD: Formatted Statistics Display
        
        Demonstrates OOP presentation layer design:
        - Separates calculation logic from presentation logic
        - Uses other class methods for calculations (method coordination)
        - Handles formatting and display concerns
        - Provides user-friendly output interface
        
        Args:
            data: Optional data list. If not provided, uses instance data.
            
        OOP Design Pattern: PRESENTATION LAYER
        - Separates business logic (calculations) from presentation (formatting)
        - Coordinates with other methods to gather data
        - Handles complex formatting logic internally
        """
        working_data = data if data is not None else self._data
        
        print(f"Array: {working_data}")
        
        if not working_data:
            print("Cannot calculate statistics for empty array.")
            print()
            return
        
        # METHOD COORDINATION: Using other instance methods
        # Demonstrates OOP principle of method collaboration
        stats = self.calculate_all_statistics(working_data)
        
        # FORMATTED OUTPUT: Encapsulated presentation logic
        print(f"Mean: {stats['mean']:.2f}")
        print(f"Median: {stats['median']:.2f}")
        
        # COMPLEX FORMATTING: Handles different mode scenarios
        modes, frequency = stats['mode']
        if len(modes) == 1:
            print(f"Mode: {modes[0]} (frequency: {frequency})")
        else:
            print(f"Mode: {modes} (frequency: {frequency} each)")
        
        print()
    
    def __str__(self) -> str:
        """
        SPECIAL METHOD: String Representation (OOP Protocol)
        
        Demonstrates Python's object protocol implementation:
        - Defines how object appears when converted to string
        - Part of Python's object model
        - Provides meaningful object representation
        
        Returns:
            Human-readable string representation of the calculator
            
        OOP Principle: POLYMORPHISM - implements Python's string protocol
        """
        return f"StatisticsCalculator(data={self._data})"
    
    def __repr__(self) -> str:
        """
        SPECIAL METHOD: Developer Representation (OOP Protocol)
        
        Demonstrates advanced Python object protocols:
        - Provides detailed object information for debugging
        - Part of Python's introspection system
        - Shows internal state information
        
        Returns:
            Detailed string representation for developers
            
        OOP Principle: INTROSPECTION - allows examination of object state
        """
        return f"StatisticsCalculator(data={self._data}, size={len(self._data)})"


def main():
    """
    MAIN FUNCTION: Demonstrates Object-Oriented Usage Patterns
    
    Shows various OOP usage scenarios:
    - Static method calls with external data
    - Instance-based usage with internal data management
    - Different ways to interact with the same class
    - Object lifecycle and state management
    
    OOP Demonstration Patterns:
    1. Class usage without persistent state
    2. Class usage with state management
    3. Method chaining and coordination
    4. Object introspection and representation
    """
    print("=== Python Statistics Calculator (Object-Oriented Approach) ===\n")
    
    # OBJECT INSTANTIATION: Creating calculator instance
    calculator = StatisticsCalculator()
    
    # USAGE PATTERN 1: Static-like usage with external data
    # Demonstrates method flexibility and polymorphism
    
    # Test case 1: Normal case with single mode
    test1 = [1, 2, 3, 4, 5, 5, 5]
    calculator.print_statistics(test1)  # Method call with external data
    
    # Test case 2: Multiple modes scenario
    test2 = [1, 1, 2, 2, 3, 3]
    calculator.print_statistics(test2)
    
    # Test case 3: Single element edge case
    test3 = [42]
    calculator.print_statistics(test3)
    
    # Test case 4: Even number of elements for median
    test4 = [1, 2, 3, 4]
    calculator.print_statistics(test4)
    
    # Test case 5: Empty list boundary condition
    test5 = []
    calculator.print_statistics(test5)
    
    # USAGE PATTERN 2: Object state management and instance methods
    # Demonstrates encapsulation and object lifecycle
    print("=== Using Instance Data (OOP State Management) ===")
    
    # SET OBJECT STATE: Encapsulated data management
    calculator.set_data([10, 20, 30, 20, 10])
    
    # OBJECT INTROSPECTION: Using special methods
    print(f"Calculator: {calculator}")  # Uses __str__ method
    
    # INSTANCE METHOD USAGE: Working with object's internal state
    calculator.print_statistics()  # Uses internal data
    
    # ADVANCED OOP USAGE: Method coordination and complex data retrieval
    stats = calculator.calculate_all_statistics()
    print(f"All statistics: {stats}")
    
    # OBJECT REPRESENTATION: Demonstrates __repr__ usage
    print(f"Detailed representation: {repr(calculator)}")


if __name__ == "__main__":
    """
    PYTHON ENTRY POINT: Module execution guard
    
    Demonstrates Python best practices:
    - Proper module structure
    - Conditional execution for script vs. import usage
    - Clean separation of module definition and execution
    """
    main()
