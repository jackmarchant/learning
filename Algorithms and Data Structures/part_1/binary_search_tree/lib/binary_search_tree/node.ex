defmodule BinarySearchTree.Node do
  defstruct [:value, :parent, :left, :right]

  def new(value, left \\ :leaf, right \\ :leaf, parent \\ nil) do
    %__MODULE__{
      value: value,
      left: left,
      right: right,
      parent: parent,
    }
  end

  def insert(:leaf, value), do: new(value)
  def insert(%{value: node_value, right: right, left: left} = parent, value) do
    node_value
    |> compare(value)
    |> IO.inspect
    |> case do
      :equal -> %{parent | right: insert(right, value)}
      :less_than -> %{parent | left: insert(left, value)}
      :more_than -> %{parent | right: insert(right, value)}
    end
  end

  defp compare(node_value, value) when node_value > value, do: :less_than
  defp compare(node_value, value) when node_value == value, do: :equal
  defp compare(node_value, value) when node_value < value, do: :more_than
end
