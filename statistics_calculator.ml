(*
 * Statistics Calculator - OCaml Implementation (Functional Programming Paradigm)
 * 
 * This implementation demonstrates core functional programming principles:
 * - Immutable data structures throughout (no mutable state)
 * - Higher-order functions for data transformation
 * - Function composition and pipelining
 * - Pattern matching for control flow
 * - Recursive thinking and list processing
 * - Declarative style (what to compute, not how)
 *)

(*
 * FUNCTIONAL APPROACH: Calculate Mean
 * 
 * Demonstrates functional programming concepts:
 * - Pattern matching for input validation
 * - Higher-order function usage (List.fold_left)
 * - Immutable data processing
 * - Functional composition with type conversion
 * 
 * The functional approach uses fold_left, which is a higher-order function
 * that abstracts the iteration pattern, making code more declarative.
 * 
 * Type: int list -> float
 *)
let calculate_mean lst =
  match lst with
  | [] -> 0.0  (* Pattern matching for empty list - functional edge case handling *)
  | _ -> 
    (* FUNCTIONAL COMPOSITION: combine multiple operations *)
    let sum = List.fold_left (+) 0 lst in        (* Higher-order function for accumulation *)
    let length = List.length lst in              (* Pure function call *)
    (float_of_int sum) /. (float_of_int length)  (* Type conversion and division *)

(*
 * FUNCTIONAL APPROACH: Calculate Median
 * 
 * Demonstrates functional programming patterns:
 * - Immutable data transformation (sort creates new list)
 * - Pattern matching for control flow
 * - Function composition with List operations
 * - No side effects or mutable state
 * 
 * Functional approach benefits:
 * - Original list remains unchanged (immutability)
 * - Operations are chained functionally
 * - Clear declarative logic flow
 * 
 * Type: int list -> float
 *)
let calculate_median lst =
  match lst with
  | [] -> 0.0  (* Functional pattern matching for base case *)
  | _ ->
    (* IMMUTABLE TRANSFORMATION: sort returns new list, original unchanged *)
    let sorted = List.sort compare lst in
    let length = List.length sorted in
    
    (* FUNCTIONAL CONDITIONAL: using if-then-else expression *)
    if length mod 2 = 0 then
      (* Even number of elements - functional computation *)
      let mid1 = List.nth sorted (length / 2 - 1) in
      let mid2 = List.nth sorted (length / 2) in
      (float_of_int (mid1 + mid2)) /. 2.0
    else
      (* Odd number of elements - direct functional access *)
      float_of_int (List.nth sorted (length / 2))

(*
 * FUNCTIONAL HELPER: Count Frequencies using Association Lists
 * 
 * Demonstrates functional data structure manipulation:
 * - Uses association lists (immutable key-value pairs)
 * - Recursive function definition
 * - Higher-order function (fold_left) for iteration
 * - No mutable state - builds new structures
 * 
 * This showcases functional approach to frequency counting without
 * mutable hash tables or arrays. Pure functional data transformation.
 * 
 * Type: int list -> (int * int) list
 *)
let count_frequencies lst =
  (* NESTED FUNCTIONAL DEFINITION: Inner recursive function *)
  let update_count acc x =
    (* RECURSIVE FUNCTION: Functional pattern for list manipulation *)
    let rec update = function
      | [] -> [(x, 1)]  (* Base case: add new element with count 1 *)
      | (key, count) :: rest when key = x -> 
          (key, count + 1) :: rest  (* Found match: increment count *)
      | head :: rest -> 
          head :: update rest  (* Recursive case: continue searching *)
    in
    update acc
  in
  (* HIGHER-ORDER FUNCTION APPLICATION: fold_left with custom function *)
  List.fold_left update_count [] lst

(*
 * FUNCTIONAL HELPER: Find Maximum Frequency
 * 
 * Demonstrates functional maximum finding:
 * - Higher-order function usage (fold_left)
 * - Lambda function for comparison
 * - Pattern matching in lambda (fun (_, freq))
 * - Pure functional aggregation
 * 
 * Type: (int * int) list -> int
 *)
let find_max_frequency freq_list =
  (* LAMBDA FUNCTION: inline function definition for max operation *)
  List.fold_left (fun acc (_, freq) -> max acc freq) 0 freq_list

(*
 * FUNCTIONAL HELPER: Extract Modes with Maximum Frequency
 * 
 * Demonstrates FUNCTIONAL PIPELINE OPERATIONS:
 * - Chain of transformations using |> operator
 * - Filter -> Map -> Sort composition
 * - Each operation returns new immutable data
 * - Declarative description of transformation
 * 
 * This is a classic functional programming pattern:
 * data |> filter |> map |> sort
 * 
 * Type: (int * int) list -> int -> int list
 *)
let get_modes freq_list max_freq =
  freq_list
  |> List.filter (fun (_, freq) -> freq = max_freq)  (* Filter by max frequency *)
  |> List.map fst                                    (* Extract just the values *)
  |> List.sort compare                               (* Sort the results *)

(*
 * FUNCTIONAL APPROACH: Calculate Mode (Complex Functional Composition)
 * 
 * Demonstrates advanced functional programming:
 * - Function composition to solve complex problem
 * - Breaking down problem into smaller functional pieces
 * - Each step is a pure function transformation
 * - Pattern matching for edge cases
 * - Tuple return type for multiple values
 * 
 * Functional decomposition:
 * 1. Count frequencies functionally
 * 2. Find maximum frequency functionally  
 * 3. Filter and extract modes functionally
 * 4. Compose all operations together
 * 
 * Type: int list -> (int list * int)
 *)
let calculate_mode lst =
  match lst with
  | [] -> ([], 0)  (* Pattern matching for empty list *)
  | _ ->
    (* FUNCTIONAL COMPOSITION: Chain of pure function calls *)
    let freq_list = count_frequencies lst in      (* Step 1: Count frequencies *)
    let max_freq = find_max_frequency freq_list in (* Step 2: Find maximum *)
    let modes = get_modes freq_list max_freq in    (* Step 3: Extract modes *)
    (modes, max_freq)  (* Return tuple - immutable result *)

(*
 * FUNCTIONAL UTILITY: Print List
 * 
 * Demonstrates functional string manipulation:
 * - Map for transformation (int -> string)
 * - String.concat for joining
 * - Pure function with no side effects (except output)
 * - Functional pipeline for data transformation
 * 
 * Type: int list -> string
 *)
let print_list lst =
  let str_list = List.map string_of_int lst in  (* FUNCTIONAL MAP: transform each element *)
  "[" ^ (String.concat "; " str_list) ^ "]"    (* Functional string composition *)

(*
 * FUNCTIONAL OUTPUT FUNCTION: Print Statistics
 * 
 * Demonstrates functional approach to I/O and control flow:
 * - Pattern matching for input validation
 * - Let-bindings for intermediate values
 * - Functional composition of calculations
 * - Immutable data flow throughout
 * - Pattern matching on complex data structures
 * 
 * Notice how this function coordinates multiple functional calculations
 * without any mutable state or side effects (except printing).
 * 
 * Type: int list -> unit
 *)
let print_statistics lst =
  (* FUNCTIONAL I/O: Pure function call for display *)
  Printf.printf "Array: %s\n" (print_list lst);
  
  (* PATTERN MATCHING: Functional control flow *)
  match lst with
  | [] -> 
    (* Base case: empty list handled functionally *)
    Printf.printf "Cannot calculate statistics for empty array.\n\n"
  | _ ->
    (* FUNCTIONAL CALCULATION COMPOSITION *)
    (* Each calculation is independent and pure *)
    
    (* Calculate mean using functional approach *)
    let mean = calculate_mean lst in
    Printf.printf "Mean: %.2f\n" mean;
    
    (* Calculate median using functional approach *)
    let median = calculate_median lst in
    Printf.printf "Median: %.2f\n" median;
    
    (* Calculate mode using functional composition *)
    let (modes, frequency) = calculate_mode lst in  (* Tuple destructuring *)
    Printf.printf "Mode: ";
    
    (* PATTERN MATCHING on result structure for output formatting *)
    (match modes with
     | [single_mode] -> 
       (* Single mode case - pattern match on list structure *)
       Printf.printf "%d (frequency: %d)\n" single_mode frequency
     | multiple_modes -> 
       (* Multiple modes case - functional list processing *)
       Printf.printf "%s (frequency: %d each)\n" (print_list multiple_modes) frequency);
    Printf.printf "\n"

(*
 * FUNCTIONAL MAIN PROGRAM: Entry Point with Functional Test Cases
 * 
 * Demonstrates functional programming approach to testing:
 * - Let-bindings for immutable test data
 * - Sequential function application
 * - Each test case is an immutable list
 * - No mutable state throughout the program
 * - Functional composition of operations
 * 
 * This main function showcases functional testing methodology:
 * - Immutable test data definitions
 * - Pure function calls with no side effects
 * - Declarative test case descriptions
 *)
let () =
  Printf.printf "=== OCaml Statistics Calculator (Functional Approach) ===\n\n";
  
  (* TEST CASE 1: Normal case with single mode *)
  (* IMMUTABLE DATA: List literal creates immutable structure *)
  let test1 = [1; 2; 3; 4; 5; 5; 5] in
  print_statistics test1;
  
  (* TEST CASE 2: Multiple modes scenario *)
  (* FUNCTIONAL DATA STRUCTURE: Immutable list with equal frequencies *)
  let test2 = [1; 1; 2; 2; 3; 3] in
  print_statistics test2;
  
  (* TEST CASE 3: Single element edge case *)
  (* MINIMALIST FUNCTIONAL DATA: Single-element list *)
  let test3 = [42] in
  print_statistics test3;
  
  (* TEST CASE 4: Even-length list for median testing *)
  (* FUNCTIONAL EDGE CASE: Tests median calculation with even count *)
  let test4 = [1; 2; 3; 4] in
  print_statistics test4;
  
  (* TEST CASE 5: Empty list boundary condition *)
  (* FUNCTIONAL BOUNDARY: Empty list handled by pattern matching *)
  let test5 = [] in
  print_statistics test5
