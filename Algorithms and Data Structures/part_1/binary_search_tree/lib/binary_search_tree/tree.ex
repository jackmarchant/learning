defmodule BinarySearchTree.Tree do
  alias BinarySearchTree.Node

  defstruct [:root]

  def new(root_value) do
    %__MODULE__{
      root: Node.new(root_value)
    }
  end

  def insert(tree, value) do
    node = Node.insert(tree.root, value)
    %__MODULE__{root: node}
  end
end
