class Graph
  class Vertex
    def initialize(id)
      @id     = id
      @level  = nil
      @parent = nil
      @edges  = []
    end

    attr_reader :id, :level, :parent, :edges
    attr_writer :level, :parent

    def <<(vertex)
      edges << vertex
    end

    def inspect
      "<#{id}: level=#{level.inspect}, parent=#{parent ? parent.id : 'nil'} #{edges.map(&:id).inspect}>"
    end

    def reset
      @level = @parent = nil
    end

    def breadth_first_search
      self.level = level = 0

      level += 1 while yield(level)

      self
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

    def traversed?
      @level
    end
  end

  def initialize(vertices)
    @vertices = Array.new(vertices) { |i| Vertex.new(i + 1) }
  end

  attr_reader :vertices

  def <<(edge)
    x, y = edge
    vertices[x - 1] << vertices[y - 1]
    vertices[y - 1] << vertices[x - 1]
    self
  end

  def breadth_first_search(start)
    reset

    vertices[start - 1].breadth_first_search do |level|
      processing = false

      vertices.each do |vertex|
        next unless vertex.level == level

        processing ||= vertex.continue_breadth_first_search(level)
      end

      processing
    end
  end

  def reset
    vertices.each(&:reset)
  end
end
