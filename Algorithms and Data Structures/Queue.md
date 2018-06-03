# Queue

A collection data structure, which can be a linked list or an array. A Queue uses the First In, First Out (FIFO) method.

## What is a Queue
Returns nodes in the same order that they were added, similar to a grocery checkout.

When an node is added to the queue it is called Enqueue. It will add to the end of the queue.

You can peek at the first node in the queue.

To remove an node from a queue, it is called Dequeue.

## Using a Linked List
When using a Linked List, the head of the list is also the head of the queue, and we add things to the end.

### Dequeue
Add to the end of the list, moving the first node to the head of the queue.

### Enqueue
Remove the first node in the list and return its value.

### Peek
Returns the value of the first item in the queue, unless it's empty.

## Using an Array
Added from the front to the end, when removing it takes from the front.
The head pointer is the next node to dequeue, tail is the last node to be enqueued.

Need to maintain an index for both head and tail.

If working in a language where you need to manage allocating space in an array, managing a queue in an array becomes much more complex
as you need to wrap around the end of the array to the front, until you reach the head pointer.
You can then copy all of the items in the array to a new array with more space.

## Priority Queue
Highest priority items are dequeued first, regardless of FIFO order.

When you enqueue an item in to the queue, it's position in the queue is determined by comparing it to other items in the list.
In a linked list you would need to enumerate the list from the first item (the most important) 
and compare each item individually to the item being enqueued. If the new item is not higher priority than any other item,
it is added to the end.

Priority order example: random number between 1 and 100, higher number is higher priority.

## Elixir/Erlang Queue
In Elixir, you can reference any Erlang modules with atom syntax. We can use the :queue module to demonstrate how a queue works in Elixir.

```elixir
> queue = :queue.new
{[], []}
> queue = :queue.in(1, queue)
{[1], []}
> queue = :queue.in(2, queue)
{[2], [1]}
> queue = :queue.in(3, queue)
{[3, 2], [1]}
> {{:value, head}, queue} = :queue.out(queue)
{{:value, 1}, {[3], [2]}}
```

[Queue Example with priority](https://hexdocs.pm/pex_queue/PexQueue.html)