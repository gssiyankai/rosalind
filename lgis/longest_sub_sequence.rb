class LongestSubsequence

  def self.find_increasing_sub_sequence seq
    find(seq)
  end

  def self.find_decreasing_sub_sequence seq
    find(seq.reverse).reverse
  end

  private
  def self.find seq
    seq[1..-1].reduce([[seq[0]]]) { |acc, i|
      acc.map { |sub_seq|
        if sub_seq.last < i
          sub_seq << i
          [sub_seq]
        else
          [sub_seq, sub_seq.reverse.drop_while { |v| v > i }.reverse + [i]]
        end
      }.flatten(1)
       .reduce({}) { |acc, i|
          max_sub_seq = acc[i.last]
          if max_sub_seq.nil?
            max_sub_seq = i
          else
            max_sub_seq = i unless i.size < max_sub_seq.size
          end
          acc[i.last] = max_sub_seq
          acc
       }.values
    }.max_by {|sub_seq| [sub_seq.size, -seq.find_index(sub_seq.last)] }
  end

end