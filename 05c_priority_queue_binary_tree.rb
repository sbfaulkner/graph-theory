# http://theoryofprogramming.com/2015/01/11/dijkstras-algorithm/

# in order by average/worst-case performance
# Unordered Array = n^2 [best = n^2]
# Ordered Array = n^2 [best = n]
# self-balancing binary search tree = n log(n) [best = n log(n)]
# Heap = n log(n) [best = n log(n)]
# Leonardo Heap = n log(n) [best = n]

# Q: where does a Skip List fall in the order?

$LOAD_PATH.unshift File.expand_path('lib', __dir__)

require 'forwardable'

class PriorityQueue
  class Node
    extend Forwardable

    def initialize(value, parent: nil)
      @value  = value
      @lnode  = nil
      @rnode  = nil
      @parent = parent
    end

    attr_accessor :lnode, :parent, :rnode, :value
    alias lnode? lnode
    alias parent? parent
    alias rnode? rnode

    def inspect
      parent_value = (parent && parent.value).inspect
      "<node value=#{value.inspect} parent=#{parent_value} lnode=#{lnode.inspect} rnode=#{rnode.inspect}>"
    end

    def leaf?
      !(lnode? || rnode?)
    end
  end

  def initialize
    @tree = nil
  end

  def inspect
    @tree.inspect
  end

  def peek
    leftmost.value if @tree
  end

  def pop
    delete_leftmost.value if @tree
  end

  def push(value)
    if @tree
      insert(value)
    else
      @tree = Node.new(value)
    end

    value
  end

  private

  def delete_leftmost
    return unless node = leftmost

    if node == @tree
      @tree = node.rnode
    else
      node.parent.lnode = node.rnode
    end

    node.rnode.parent = node.parent if node.rnode?

    node
  end

  def insert(value)
    node = @tree

    loop do
      if value < node.value
        break node.lnode = Node.new(value, parent: node) unless node.lnode?

        node = node.lnode
      else
        break node.rnode = Node.new(value, parent: node) unless node.rnode?

        node = node.rnode
      end
    end
  end

  def leftmost
    node = @tree

    node = node.lnode while node.lnode?

    node
  end
end

require_relative 'test/priority_queue_test'
