class LongestSubsequence

  def self.find_increasing_sub_sequence seq
    find(seq, :increasing)
  end

  def self.find_decreasing_sub_sequence seq
    find(seq, :decreasing)
  end

  private
  def self.find seq, direction
    case direction
      when :increasing
        op = :<
      when :decreasing
        op = :>
    end
    seq[1..-1].reduce([[seq[0]]]) { |acc, i|
      acc.map { |sub_seq|
        if sub_seq.last.send(op, i)
          sub_seq << i
          [sub_seq]
        else
          [sub_seq, sub_seq.reverse.drop_while { |v| i.send(op, v) }.reverse + [i]]
        end
      }.flatten(1)
    }.max_by {|sub_seq| [sub_seq.size, -seq.find_index(sub_seq.last)] }
  end

end