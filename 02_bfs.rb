# http://theoryofprogramming.com/2014/12/25/breadth-first-search-algorithm/

$LOAD_PATH.unshift File.expand_path('lib', __dir__)

require 'graph'

graph = Graph.new(12)

graph << [1, 3]
graph << [1, 4]
graph << [2, 3]
graph << [2, 4]
graph << [2, 5]
graph << [2, 7]
graph << [2, 8]
graph << [2, 12]
graph << [3, 5]
graph << [3, 12]
graph << [4, 7]
graph << [4, 9]
graph << [5, 7]
graph << [5, 8]
graph << [5, 12]
graph << [6, 8]
graph << [6, 10]
graph << [7, 8]
graph << [7, 9]
graph << [9, 10]
graph << [10, 11]

graph.breadth_first_search(11)

puts graph.inspect
