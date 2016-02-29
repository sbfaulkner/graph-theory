require 'minitest/autorun'

class PriorityQueueTest < Minitest::Test
  def queue
    @queue ||= PriorityQueue.new
  end

  def test_returns_items_in_order
    queue.push 7
    queue.push 1
    queue.push 5
    assert_equal 1, queue.pop
    assert_equal 5, queue.pop
    assert_equal 7, queue.pop
  end

  def test_priority_queue_performance
    srand(12_345)

    time = Benchmark.realtime do
      10_000.times { queue.push rand(1000) }
      10_000.times { queue.pop }
    end

    assert time < 5, "expected time < 5s, actual time is #{time}s"

    STDERR.printf "PRIORITY QUEUE RUNTIME: %.3fms (10,000 elements)\n\n", time * 1000
  end
end
