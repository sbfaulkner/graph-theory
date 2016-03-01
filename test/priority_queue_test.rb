require 'minitest/autorun'
require 'benchmark'

class PriorityQueueTest < Minitest::Test
  def queue
    @queue ||= PriorityQueue.new
  end

  def test_peek_returns_minimum
    queue.push 7
    queue.push 1
    queue.push 5
    assert_equal 1, queue.peek
  end

  def test_pop_returns_items_in_order
    queue.push 7
    queue.push 1
    queue.push 5
    assert_equal 1, queue.pop
    assert_equal 5, queue.pop
    assert_equal 7, queue.pop
  end

  def test_pop_drains_the_queue
    1_000.times { queue.push(rand(100)) }
    1_000.times { queue.pop }
    assert_nil queue.pop
  end

  def test_pop_returns_random_series_in_order
    series = Array.new(1000) { rand(100) }
    series.each { |i| queue.push(i) }
    result = Array.new(1000) { queue.pop }
    assert_equal series.sort, result
  end

  def test_priority_queue_performance
    srand(12_345)

    time = Benchmark.realtime do
      10_000.times { queue.push(rand(1000)) }
      10_000.times { queue.pop }
    end

    assert time < 5, "expected time < 5s, actual time is #{time}s"

    at_exit { STDERR.printf "\nPRIORITY QUEUE RUNTIME: %.3fms (10,000 elements)\n\n", time * 1000 }
  end
end
