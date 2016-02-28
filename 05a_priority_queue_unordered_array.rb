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

seed = ARGV[0] ? ARGV[0].to_i : 12_345
puts "Seed: #{seed}"
srand(seed)

class PriorityQueue
  extend Forwardable

  def initialize
    @queue = []
  end

  def_delegator :@queue, :push

  def pop
    min = Float::INFINITY
    pos = nil
    @queue.each_with_index do |v, i|
      next unless v < min
      min = v
      pos = i
    end
    @queue.delete_at(pos)
  end
end

time = Benchmark.realtime do
  queue = PriorityQueue.new

  10_000.times { queue.push rand(1000) }

  10_000.times { queue.pop }

  puts queue.inspect
end

STDERR.printf "%.3fms elapsed\n", time * 1000
