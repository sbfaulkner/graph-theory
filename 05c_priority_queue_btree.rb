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

class PriorityQueue
  def initialize
    @queue = []
  end

  def pop
  end

  def push(value)
  end
end

require_relative 'test/priority_queue_test'
