# implementing and adjacency list for http://theoryofprogramming.com/2014/12/24/graph-theory-basics/

$LOAD_PATH.unshift File.expand_path('lib', __dir__)

require 'adjacency_list'

adjacency_list = AdjacencyList.new(9)

adjacency_list << [1, 2]
adjacency_list << [2, 4]
adjacency_list << [2, 5]
adjacency_list << [2, 8]
adjacency_list << [3, 4]
adjacency_list << [5, 6]
adjacency_list << [5, 7]
adjacency_list << [5, 9]

puts adjacency_list.inspect
