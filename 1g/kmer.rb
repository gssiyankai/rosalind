text = 'ACGTTGCATGTCGCATGATGCATGAGAGCT'
k = 4
d = 1

nucleotides = ['A', 'T', 'G', 'C']
kmers = nucleotides.product(*((1..k-1).map { |_| nucleotides }))
                   .map(&:join)

puts kmers.group_by { |kmer|
                (0..text.size-kmer.size+1).select { |i|
                  s = text[i..i+kmer.size-1]
                  diff = 0
                  (0..kmer.size-1).drop_while { |j|
                                    if kmer[j] != s[j]
                                      diff = diff + 1
                                    end
                                    diff <= d
                                  }
                                  .empty?
                }.size
            }
            .max_by { |k,_| k }[1]
      .join(' ')
