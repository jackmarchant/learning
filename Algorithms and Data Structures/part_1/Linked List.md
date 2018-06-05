# Creating Linked Lists

A Linked List is a collection data structure that contains a reference to the head and tail of a node chain.
Imagine the following linked list:
```elixir
linked_list = %Node{value: 1, next: %Node{value: 2, next: nil}}
```
The head of this linked list is the outer node, which contains the value `1` and the tail is the next and final
node in the chain, with a value of `2`.
Keeping these pointers to nodes within a single chain, will enable adding, removing and enumerating over the nodes.

### How to add to a linked list:
In an empty linked list the head and tail pointers are null.
When you add a node to an empty list, you point both the head and tail pointers to that node.

**Adding to the front of an existing list:**
- Update head pointer to point to the new node
- Tail pointer stays on existing node
- Update new node `next` pointer to an existing node

**Adding to the end of an existing list**
- Update tail pointer to point to the new node
- Head pointer stays on existing node
- Existing node's next `next` pointer points to new node.

### How to remove from a linked list:
Remove operations are done in a similar way to adding, but with the reverse operations.

**Remove from the end**
- Find the second to last node in the linked list
- Set tail pointer to the second to last node in the chain
- Set the `next` pointer of the new tail to null
- If 
More complex in a singly linked list than removing from the front of the list, because you have to iterate over the list to find the second last node.
**Remove from the front**
- Update the head pointer to reference the node in its `next` pointer.
- If the list is now empty, set head and tail pointers to null
Because you only deal with the first node in the list, it's a very cheap operation, regardless of the number of nodes in the list.

### Enumerating
The key to enumerating over a linked list is keeping a pointer to the next node in the list.
```elixir
Enum.each(fn value -> value end)
```
When you call the `each` function on the `Enum` module, you pass it a function that takes one argument. 
This argument is the current value in the linked list. Then, the next time your function is called, 
it will receive the next item in the linked list, and so on until the tail node is reached, at which point
the enumeration completes.

## Doubly linked list
Similar in implementation to a singly linked list, however we also store a reference to the previous node.
This improves the implementation of removing the last item from a list, because we no longer need to 
iterate over the entire list every time we want to find the second last node. We can simply look at the tail pointer and get the node at its previous pointer.
When adding and removing to a doubly linked list, you will always need at least one extra operation, to assign the bi-directional links between nodes, instead of just one next pointer in a singly linked list.

## How does Elixir handle add/remove from a list
Lists in Elixir are actually linked lists themselves, so a lot of the same concepts will apply.

Elixir provides a way to access the head and tail pointers of a list, for example:
```elixir
[head | tail] = [1, 2, 3]
> head
1
> tail
[2, 3]
```
As you can see, the head pointer is a reference to the first node in the list, and tail is a reference to the rest of the nodes in the list. It is this distinction that makes lists in Elixir singly linked lists.

**Prepending**
In a singly linked list, we know that appending to the list is an expensive operation because it requires traversing the entire list.
```elixir
> list = [2, 3]
> [1 | list]
[1, 2, 3]
```

**Removing**
Removing from a list is pretty cool because it uses pattern matching to remove the item from the list.
This is basically how `List.delete/2` works - without the extra case handling.
```elixir
> delete = fn [item | list], item -> list end
> delete.([1, 2, 3], 1)
[2, 3]
```
When we call the delete function on our list, it matches it by comparing the head pointer in the list, with the second argument of the function. If they match, the function returns the rest of the items in the list, through the tail pointer.

**Enumerating**
```elixir
defmodule MyEnumerator do
  def enumerate([], _), do: :ok
  def enumerate([head | tail], fun) do
    fun.(head)
    enumerate(tail, fun)
  end
end

> MyEnumerator.enumerate([1, 2, 3], &IO.inspect/1)
1
2
3
:ok
```