require 'test/unit'
require_relative 'tree'

class TreeTest < Test::Unit::TestCase

  def read_dataset f
    lines = File.readlines(f)
    lines[1..-1].map { |line|
                  line.split(' ').map(&:to_i)
                }
  end

  def test_simple
    edges = read_dataset 'small_dataset.txt'
    assert_equal 3, Tree.minimum_edges(edges)
  end

end
