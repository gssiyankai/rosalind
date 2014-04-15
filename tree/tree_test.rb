require 'test/unit'
require_relative 'tree'

class TreeTest < Test::Unit::TestCase

  def read_dataset f
	lines = File.readlines(f)
	n = lines.first
        edges = lines[1..-1].map { |line|
			        line.split(' ').map(&:to_i)
			     }
	[n, edges]
  end

  def test_simple
    n, edges = read_dataset 'small_dataset.txt'
    assert_equal 3, Tree.minimum_edges(n, edges)
  end

end
