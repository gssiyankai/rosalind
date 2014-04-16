require 'test/unit'
require_relative 'tree'

class TreeTest < Test::Unit::TestCase

  def read_dataset f
    lines = File.readlines(f)
    n = lines.first.to_i
    edges = lines[1..-1].map { |line|
                          line.split(' ').map(&:to_i)
                        }
    [n, edges]
  end

  def test_simple
    n, edges = read_dataset 'small_dataset.txt'
    assert_equal 3, Tree.minimum_edges(n, edges)
  end

  def test_merge
    assert_equal 1, Tree.minimum_edges(6, [[1,2],[3,4],[2,3],[5,6]])
  end

  def test_big_dataset
    n, edges = read_dataset 'rosalind_tree.txt'
    assert_equal 85, Tree.minimum_edges(n, edges)
  end

end
