# http://theoryofprogramming.com/2015/01/11/dijkstras-algorithm/

# in order by average/worst-case performance
# Unordered Array = n^2 [best = n^2]
# Ordered Array = n^2 [best = n]
# self-balancing binary search tree = n log(n) [best = n log(n)]
# Heap = n log(n) [best = n log(n)]
# Leonardo Heap = n log(n) [best = n]

$LOAD_PATH.unshift File.expand_path('lib', __dir__)

require 'benchmark'
require 'forwardable'

require 'byebug'

seed = ARGV[0] ? ARGV[0].to_i : 12_345
puts "Seed: #{seed}"
srand(seed)

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

time = Benchmark.realtime do
  queue = PriorityQueue.new

  10_000.times { queue.push rand(1000) }

  10_000.times { queue.pop }

  puts queue.inspect
end

STDERR.printf "%.3fms elapsed\n", time * 1000
