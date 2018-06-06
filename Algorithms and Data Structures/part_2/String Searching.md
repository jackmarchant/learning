# String Searching

Two main algorithms:

- __Naive Search Algorithm__
Uses a for-loop to search from the start of the string, to the end, where the length is the number of characters in the string to search. If the number of characters found matches the string we want to search, we know that it has been found.

Going through each character in the string to search, if a match is not found for the first letter of the string we want to find, then we discard that index and continue along the string until a match is found. It then continues for the length of the string.

Walks forward in a loop for each character, using a nested while loop to find matches.

If the length of the remaining characters in the string to search, is less than the length of the string to find, no match can possibly be made.

Does not require pre-processing to operate.

- __Boyer Moore Horspool Algorithm__
A two-stage algorithm, the first stage is a pre-processing step to build a table that contains the length to shift when a bad match occurs.
In the second stage, the search algorithm is run, and compares values from right to left to better skip values when a bad match occurs.

1. Store the length of the search string as the default shift length.
2. For each character in the string, shift the index for the current character value.

It uses a "bad match" table to determine how many characters to shift based on that character appearing at some index in the string to find.