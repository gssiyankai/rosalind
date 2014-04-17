def distance s1, s2
  a1, a2 = [s1,s2].map { |s| s.split('') }
  a1.zip(a2)
    .count{ |a,b| a!=b}
    .to_f / a1.size
end

strings = File.readlines('rosalind_pdst.txt')
              .reduce([]) { |acc, s|
                if s.start_with?('>')
                  acc << ''
                else
                  acc[-1] = acc[-1] + s.strip
                end
                acc
              }

n = strings.size

matrix = (0..n-1).map { |i|
                  (0..n-1).map { |j|
                    distance strings[i], strings[j]
                  }
                }

matrix.each { |r|
  puts r.map{ |d| '%.3f' % d }
        .join(' ')
}
