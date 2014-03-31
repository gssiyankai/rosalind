require 'test/unit'
require_relative 'longest_sub_sequence'

class LongestSubSequenceTest < Test::Unit::TestCase

  def read_dataset f
    File.readlines(f)[1].split(' ').map(&:to_i)
  end

  def test_simple
    seq = read_dataset 'small_dataset.txt'
    assert_equal [1, 2, 3], LongestSubsequence.find_increasing_sub_sequence(seq)
    assert_equal [5, 4, 2], LongestSubsequence.find_decreasing_sub_sequence(seq)
  end

end