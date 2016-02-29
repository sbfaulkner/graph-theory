# http://theoryofprogramming.com/2015/01/11/dijkstras-algorithm/

# in order by average/worst-case performance
# Unordered Array = n^2 [best = n^2]
# Ordered Array = n^2 [best = n]
# self-balancing binary search tree = n log(n) [best = n log(n)]
# Heap = n log(n) [best = n log(n)]
# Leonardo Heap = n log(n) [best = n]

# Q: where does a Skip List fall in the order?

$LOAD_PATH.unshift File.expand_path('lib', __dir__)

require 'benchmark'
require 'forwardable'

class PriorityQueue
  extend Forwardable

  def initialize
    @queue = []
  end

  def_delegator :@queue, :shift, :pop

  def push(value)
    @queue.reverse_each.with_index do |v, i|
      return @queue.insert(-i - 1, value) if value > v
    end
    @queue.insert(0, value)
  end
end

require_relative 'test/priority_queue_test'
