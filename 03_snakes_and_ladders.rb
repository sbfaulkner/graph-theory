# http://theoryofprogramming.com/2014/12/25/breadth-first-search-algorithm/

$LOAD_PATH.unshift File.expand_path('lib', __dir__)

require 'graph'

class SnakesAndLadders < Graph
  def initialize(name)
    @name = name
    super(100, directed: true) do |graph|
      # roll the dice
      (1..99).each do |space|
        (1..[100 - space, 6].min).each { |move| graph << [space, space + move] }
      end
    end
  end

  def print_shortest_path
    breadth_first_search(1)

    path = shortest_path(1, 100)

    if moves = path.last.level
      puts "#{@name} can be won in #{moves} moves (#{path.map(&:id).join(' -> ')})"
    else
      puts "#{@name} cannot be won"
    end
  end
end

#
# scenario # 1
#
graph = SnakesAndLadders.new("Game 1")

# ladders
graph.replace(32, 62)
graph.replace(42, 68)
graph.replace(12, 98)

# snakes
graph.replace(95, 13)
graph.replace(97, 25)
graph.replace(93, 37)
graph.replace(79, 27)
graph.replace(75, 19)
graph.replace(49, 47)
graph.replace(67, 17)

graph.print_shortest_path


#
# scenario # 2
#
graph = SnakesAndLadders.new("Game 2")

# ladders
graph.replace(8, 52)
graph.replace(6, 80)
graph.replace(26, 42)
graph.replace(2, 72)

# snakes
graph.replace(51, 19)
graph.replace(39, 11)
graph.replace(37, 29)
graph.replace(81, 3)
graph.replace(59, 5)
graph.replace(79, 23)
graph.replace(53, 7)
graph.replace(43, 33)
graph.replace(77, 21)

graph.print_shortest_path


#
# scenario # 3
#
graph = SnakesAndLadders.new("Game 3")

# ladders
graph.replace(3, 90)

# snakes
graph.replace(99, 10)
graph.replace(97, 20)
graph.replace(98, 30)
graph.replace(96, 40)
graph.replace(95, 50)
graph.replace(94, 60)
graph.replace(93, 70)

graph.print_shortest_path
