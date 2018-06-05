# Sorting Algorithms

Sorting Algorithms arrange data in a collection based on comparisons, for example: any object with a greater than, less than or equal value.
There are two types of algorithms:
__Linear sorting__
Sort as a single, large operation
__Divide and conquer__
Partition the data, sorting smaller sets at a time, then joining all sorted sets together.

You can compare sorting algorithms through the number of times they:
**Compare** two values for relative equality and **Swap** two values indexes in the collection.
Both of which have a cost, but it depends on many factors, reducing either or both can improve performance.

**Algorithms:**
- __Bubble Sort__
The simpliest conceptually, bubble sort works by comparing each item in the collection to its next value, starting with the first value.
If the current value is larger, it is swapped with the right value.
- __Insertion Sort__
Sort each item as it is encountered, working left to right. Everything to the left, is known to be sorted, and to the right is unsorted. The current item is inserted into place with the sorted (left) section.
- __Selection Sort__
Finds the smallest item and swaps it with the first unsorted item, without revisiting the already sorted data.
- __Merge Sort__
The collection is slit in half, until each collection only has one item in it. When this happens the collection is known to be sorted. The values (individual collections) are then merged back together one at a time until the complete collection is merged and sorted.
- __Quick Sort__
**Divide and Conquer** algorithm. Commonly used. Pick a pivot value from which to partition the collection. The pivot is sorted when everything to the left is smaller, and to the right is larger. The next pivot is found and sorted in the same way.