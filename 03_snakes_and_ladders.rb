# http://theoryofprogramming.com/2014/12/25/breadth-first-search-algorithm/

$LOAD_PATH.unshift File.expand_path('lib', __dir__)

require 'graph'

def build_graph
  Graph.new(100, directed: true) do |graph|
    # roll the dice
    (1..99).each do |space|
      (1..[100 - space, 6].min).each { |move| graph << [space, space + move] }
    end
  end
end

#
# scenario # 1
#
graph = build_graph

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

graph.breadth_first_search(1)

path = graph.shortest_path(1, 100)
moves = path.length - 1

puts "#{moves} moves required"
puts path.join(' -> ')


#
# scenario # 2
#
graph = build_graph

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
graph.replace(77, 21 )

graph.breadth_first_search(1)

path = graph.shortest_path(1, 100)
moves = path.length - 1

puts "#{moves} moves required"
puts path.join(' -> ')
