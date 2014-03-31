require 'test/unit'
require_relative 'longest_sub_sequence'

class LongestSubSequenceTest < Test::Unit::TestCase

  def test_simple
    seq = [5, 1, 4, 2, 3]
    assert_equal [1, 2, 3], LongestSubsequence.find_increasing_sub_sequence(seq)
    assert_equal [5, 4, 2], LongestSubsequence.find_decreasing_sub_sequence(seq)
  end

end