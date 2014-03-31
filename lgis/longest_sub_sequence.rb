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
      acc = acc + acc.map { |sub_seq|
        if sub_seq.last < i
          sub_seq + [i]
        else
          sub_seq.reverse.drop_while { |v| v > i }.reverse + [i]
        end
      }
      acc = remove_smaller_sub_sequences acc
      acc = remove_sub_sequences_with_higher_delta acc
      p acc.size
      p seq.find_index(i)
      acc
    }.max_by {|sub_seq| [sub_seq.size, -seq.find_index(sub_seq.last)] }
  end

  def self.remove_smaller_sub_sequences sub_sequences
    sub_sequences.reduce({}) { |acc, i|
      max_sub_seq = acc[i.last]
      if max_sub_seq.nil?
        max_sub_seq = i
      else
        max_sub_seq = i unless i.size < max_sub_seq.size
      end
      acc[i.last] = max_sub_seq
      acc
    }.values
  end

  def self.remove_sub_sequences_with_higher_delta sub_sequences
    sub_sequences.reduce({}) { |acc, i|
      sub_seqs = acc[[i.first, i.size]]
      if sub_seqs.nil?
        sub_seqs = [i]
      else
        sub_seqs << i
      end
      acc[[i.first, i.size]] = sub_seqs
      acc
    }.values
     .map { |sub_seqs|
       sub_seqs.min_by { |sub_seq|
         sub_seq.each_with_index.map { |i, index|
           if sub_seq[index+1].nil?
             0
           else
             sub_seq[index+1] - i
           end
         }
       }
     }
  end

end