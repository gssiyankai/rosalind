s, t = File.readlines('rosalind_sseq.txt')
           .reduce([]) { |acc, s|
              if s.start_with?('>')
                acc << ''
              else
                acc[-1] = acc[-1] + s.strip
              end
              acc
           }
           .map { |s| s.split(//) }

puts t.reduce([]) { |acc, sym|
          i = s.index(sym) + 1
          s = s[i..-1]
          acc << ((acc[-1]||0) + i)
          acc
       }
       .join(' ')