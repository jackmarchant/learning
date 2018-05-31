# Creating Node Chains

A node is defined as an object that has a value, and a pointer to the next object in the chain.
For example: 
```elixir
defmodule MyNode do
  defstruct [:value, :next]
end
```

You can create a node chain by linking one node to another, through the next pointer:
```elixir
first_node = %MyNode{value: 1}
second_node = %MyNode{value: 2}
third_node = %MyNode{value: 3}

In elixir we have to do these operations in backwards order,
so that the value that is added to the node is the version of the node
that has a reference to it's next value

second_node = %{second_node | next: third_node} # create another link in the chain
first_node = %{first_node | next: second_node} # create a link in the chain

# first_node should end up looking like this
%MyNode{next: %MyNode{next: %MyNode{next: nil, value: 3}, value: 2}, value: 1}
```

We can print the values of each node starting with the first node in the chain:
```elixir
defmodule MyNodePrinter do
  require Logger
  def print_node(nil), do: Logger.info "End of the node chain"
  def print_node(node) do
    Logger.info node.value
    print_node(node.next)
  end
end

MyNodePrinter.print_node(first_node)
1
2
3
End of the chain
```