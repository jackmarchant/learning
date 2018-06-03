defmodule Ads1Test.QueueTest do
  use ExUnit.Case

  alias Ads1.Queue

  describe "Ads1.Queue (behaving as a normal queue)" do
    setup do
      {:ok, queue} = Queue.start_link()

      %{queue: queue}
    end

    test "it can add to the queue", %{queue: q} do
      assert ["hello"] == Queue.enqueue(q, "hello")
    end

    test "it can remove from the queue in FIFO order", %{queue: q} do
      Queue.enqueue(q, "hello")
      Queue.enqueue(q, "world")

      assert Queue.dequeue(q) == "hello"
    end

    test "removing from an empty queue returns nil", %{queue: q} do
      assert Queue.dequeue(q) == nil
    end

    test "it can peek at the head of the queue", %{queue: q} do
      Queue.enqueue(q, "hi there")
      Queue.enqueue(q, "hello again")

      peek = Queue.peek(q)

      # count should remain unchanged
      assert Queue.count(q) == 2
      assert peek == "hi there"
      assert Queue.count(q) == 2
    end
  end

  describe "Ads1.Queue (with priority order)" do
    setup do
      {:ok, queue} = Queue.start_link(fn (new, item) -> new < item end)

      %{queue: queue}
    end

    test "it can add a priority when enqueuing", %{queue: q} do
      Queue.enqueue(q, 5)
      Queue.enqueue(q, 2)
      Queue.enqueue(q, 4)
      Queue.enqueue(q, 7)

      assert 7 == Queue.dequeue(q)
      assert 5 == Queue.dequeue(q)
      assert 4 == Queue.dequeue(q)
      assert 2 == Queue.dequeue(q)
    end
  end
end
