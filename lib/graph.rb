class Graph
  class Vertex
    def initialize(id)
      @id       = id
      @level    = nil
      @parent   = nil
      @edges    = []
    end

    attr_reader :id, :level, :parent, :edges
    attr_writer :level, :parent
    alias traversed? level

    def <<(vertex)
      edges << vertex
    end

    def inspect
      "<#{id}->[#{edges.map(&:id).join('->')}] level=#{level.inspect}, parent=#{parent ? parent.id : 'nil'}>"
    end

    def replace(original, replacement)
      return unless offset = edges.index(original)
      edges[offset] = replacement
    end

    def reset
      @level = @parent = nil
    end

    def breadth_first_search
      self.level = level = 0

      level += 1 while yield(level)

      level
    end

    def continue_breadth_first_search(level)
      any = false

      edges.each do |vertex|
        next if vertex.traversed?

        vertex.level  = level + 1
        vertex.parent = self

        any = true
      end

      any
    end
  end

  def initialize(vertices, directed: false)
    @vertices = Array.new(vertices) { |i| Vertex.new(i + 1) }
    @directed = directed

    yield self if block_given?
  end

  attr_reader :directed, :vertices
  alias directed? directed

  def <<(edge)
    x, y = edge
    x -= 1
    y -= 1
    vertices[x] << vertices[y]
    vertices[y] << vertices[x] unless directed?
    self
  end

  def breadth_first_search(start)
    vertices.each(&:reset)

    vertices[start - 1].breadth_first_search do |level|
      processing = false

      vertices.each do |vertex|
        next unless vertex.level == level

        processing = vertex.continue_breadth_first_search(level) || processing
      end

      processing
    end
  end

  def inspect
    "<#{directed? ? 'directed' : 'undirected'} graph: #{@vertices.inspect}>"
  end

  def replace(original, replacement)
    original    = vertices[original - 1]
    replacement = vertices[replacement - 1]

    vertices.each { |vertex| vertex.replace(original, replacement) }
    original.edges.clear

    self
  end

  def shortest_path(start, current)
    vertex = vertices[current - 1]

    return [vertex] if current == start

    if vertex.parent.nil?
      shortest_path(start, start) << vertex
    else
      shortest_path(start, vertex.parent.id) << vertex
    end
  end
end
