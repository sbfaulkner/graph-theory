# Adjacency List implementation for working through http://theoryofprogramming.com/tag/graph-theory/
class AdjacencyList
  def initialize(vertices)
    @edges = Array.new(vertices) { [] }
  end

  def <<(edge)
    x, y = edge
    @edges[x - 1] << y
    @edges[y - 1] << x
    self
  end
end
