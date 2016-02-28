# http://theoryofprogramming.com/2014/12/26/depth-first-search-algorithm/

$LOAD_PATH.unshift File.expand_path('lib', __dir__)

require 'graph'

graph = Graph.new(10, directed: true)

graph << [1, 2]
graph << [1, 3]
graph << [2, 4]
graph << [3, 2]
graph << [4, 3]
graph << [4, 5]
graph << [5, 6]
graph << [7, 8]
graph << [8, 9]
graph << [9, 10]

graph.depth_first_search

puts graph.inspect
