lines = File.readlines('rosalind_7n.txt').map(&:strip)

s = lines[0]
patterns = lines[1..-1]

p (0..s.size-1).select { |i|
                not patterns.drop_while { |p|
                  not s[i..-1].start_with? p
                }.empty?
              }