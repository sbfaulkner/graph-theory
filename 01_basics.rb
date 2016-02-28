# http://theoryofprogramming.com/2014/12/24/graph-theory-basics/

$LOAD_PATH.unshift File.expand_path('lib', __dir__)

require 'graph'

graph = Graph.new(9)

graph << [1, 2]
graph << [2, 4]
graph << [2, 5]
graph << [2, 8]
graph << [3, 4]
graph << [5, 6]
graph << [5, 7]
graph << [5, 9]

puts graph.inspect
