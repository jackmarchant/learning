# Binary Tree
Trees are similar to Linked Lists, in that they link nodes together, except they do so in a hierarchical manner.
There is exactly one path between any nodes in the tree, this limitation is a fundamental rule.

A Binary Tree starts out with a root node, a node with no parent. Each child itself can be a tree.
In a binary tree, each child has only two children, left and right children, hence the name Binary.

## Create a Binary Search Tree
Sorted hierarchy of data. In the left child, its value must be less than the parent, and on the right child, it must be greater than the parent.
This set of rules is followed throughout the tree, the left-most node contains the least value of the tree, 
and the right-most node contains the most value of the tree.

## Add
Adding is performed with a recursive algorithm.
In an empty tree, any value added becomes the root node.
When you add to a root node, if the value is smaller it goes to the left. When we add another value,
we need to determine whether the value is less than or more than the root, then more or less than it's child,
which determines its position.
Equal values are treated as larger values.

## Searching
Perform search recursively, based on smaller, equal values.
If the value is equal, to the one being searched for, return the current node.
Otherwise, if the value is less than the current node, return the left child of the current node.
And finally if none of those conditions are met, the value must be larger, so return the right child of the current node.

If you don't implement the algorithm above, you have to search every node in the tree, rather than a subset.

## Remove
First, check that the node exists to cancel out any unnecessary work.
If we find a node, check if it's a leaf node, in which case the node's pointer to the parent can be deleted.
Tree's are not storing bi-directional links. So, for a non-leaf node you have to find the child to replace the deleted node.

__Cases for removing a non-leaf node__
- Removed node has no right child:
  **Left child replaces removed**
  Find the node, promote the left child without breaking invariance structure of the tree, 
  i.e. right node is larger than left its parent.
  
- Removed node has no left child:
  **Right child replaces removed**
  Find the node, promote right child's, right-most child

- Removed node has a left child:
  **Right child's left-most child replaces removed child.**
  Find the node, promote the right child's, left-most child.

## Traversals
Tree's have multiple links to other nodes. We can enumerate nodes in a well-defined order.

- Basic algorithm
  1. Process node
  2. Visit left
  3. Visit right

Variances occur in the order in which we complete the above algorithm.
- Pre-Order
  Process current node, recurse the function again to visit left, continuing until left-most node is reached.
  Visit the right node of the first left node, we visit it's right children.
  Visit left, visit right, until all children are traversed.
  Order is the same.

- In-Order
  Left node is visited first, and left-most node is reached. Processing the same node again to get it's right children.
  Children are visited first, rather than current, then left-child, which **retains the sort order**.

- Post-Order
  Start at the head node, go to the right child, then left, then current value. 
  It will traverse an entire tree structure, before moving back up the tree.

Pre and post order are commonly used in runtime behaviour, compilers for example, to get dependency graphs.