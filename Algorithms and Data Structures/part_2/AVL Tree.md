# AVL Tree
An AVL Tree is a self-balancing binary tree. They follow all the constraints of a binary tree, so search and enumeration is identical.
Insertion and Deletion is where they differ, because a **Balance algorithm** is run each time any of these two methods are run.

An unbalanced binary tree can become a singly linked list in worse case, where all items inserted are higher or lower than the parent node. This is bad for search performance O(n).

Search speed is the primary goal of the binary tree structure.

## New rules for AVL Trees (differing from binary trees)
- __Self-balancing__
After any changes that changes the tree's contents, the tree performs a balancing operation.
The balancing operation rotates the root nodes so that the tree can be balanced, using an algorithm.

When the balancing operation happens, a height difference restriction is applied - it cannot change by more than one child relative to the root node. Left height must not differ right height by more than or less than 1. It does this by changing the value of the root node.

- __Height__
Height refers to the distance between the current node and it's farthest child node.

When understanding if a tree needs to be balanced, we must calculate the max child high of the current node's left and right children, plus the maximum height of 1 (because we already know the child exists for the current node at this point). If the result of that calculation is more than one, then the tree needs to be balanced.

- __Balance Factor__
Difference between it's right and left node heights. The result of the previously mentioned calculation. It can be positive or negative.

- __Right/Left Heavy__
We use a positive or negative value for the balance factor, so that we can tell whether the right or the left side of the tree is causing it to be unbalanced. For example: A tree with a root node that has a right height of 6 and a left height of 0, the balance factor is -6. This means that the tree is unbalanced, because it is right-heavy.

## Node Rotation Algorithm
Balancing is performed using node rotation, at the point of insertion or deletion, and is repeated for each of the node's parents.

### In a Left-Heavy tree
- **Right-Left Rotation** is used when the left child is right heavy, otherwise use **Right Rotation**

### In a Right-Heavy tree
- **Left-Right Rotation** is used when the right child is left heavy, otherwise use **Left Rotation**

