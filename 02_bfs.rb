# http://theoryofprogramming.com/2014/12/25/breadth-first-search-algorithm/

$LOAD_PATH.unshift File.expand_path('lib', __dir__)

require 'graph'

adjacency_list = Graph.new(12)

adjacency_list << [1, 3]
adjacency_list << [1, 4]
adjacency_list << [2, 3]
adjacency_list << [2, 4]
adjacency_list << [2, 5]
adjacency_list << [2, 7]
adjacency_list << [2, 8]
adjacency_list << [2, 12]
adjacency_list << [3, 5]
adjacency_list << [3, 12]
adjacency_list << [4, 7]
adjacency_list << [4, 9]
adjacency_list << [5, 7]
adjacency_list << [5, 8]
adjacency_list << [5, 12]
adjacency_list << [6, 8]
adjacency_list << [6, 10]
adjacency_list << [7, 8]
adjacency_list << [7, 9]
adjacency_list << [9, 10]
adjacency_list << [10, 11]

adjacency_list.breadth_first_search(11)

puts adjacency_list.inspect
