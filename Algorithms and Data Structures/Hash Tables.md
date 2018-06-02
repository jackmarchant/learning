# Hash Tables

A Hash Table is an associative array, the storage of key/value pairs.
In a hash table, each key is unique and mapped to an index in the array.

Hashing is the process of mapping a fixed size result from an input.
Hashing must be:
- Stable, generating the same output from an input every time.
- Uniform, evenly distributed through available space.
- Efficient, should be balanced with the application, not take up too many resources.
- Secure, it should be difficult to find data that would produce the same hash

Don't write your own hashing algorithm, pick the right one for the job at hand.
Some, like MD5 and SHA-2 have been created by mathematicians and tested for their security.

# Adding data to the hash table
1. Create a hash code using an algorithm from the data
2. Get the index to use in the array from (hashCode % arrayLength) in order to distribute evenly.
3. Insert data into the array at the index 

## How to handle collisions
When two items are assigned to the same index in an array, they collide.
Two common strategies:
- Open Addressing
  Moving to the next free index in the array
- Chaining
  Store items in a linked list, using the same index

**Load Factor** is the ratio of filled hash table array slots
If the load factor (e.g. 75% of the array) is reached, create a new array with double the length
of the original, then copy the items in the old array, to the new one.

## Finding and Removing items from the hash table
__Open Addressing__
Get the index using the same hashing algorithm, if the keys match, remove the item, otherise
check the next index.

__Chaining__
Get the index using the hashing algorithm, remove the item from the linked list.

## Enumerating
**Open Addressing** is simple because you loop over the array, and if the item is not null return the item.
**Chaining** requires a looping, and also enumerating over the linked list to find the item.
