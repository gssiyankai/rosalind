def distance s1, s2
  a1, a2 = [s1,s2].map { |s| s.split('') }
  a1.zip(a2)
    .count{ |a| a[0]!=a[1] }
    .to_f / a1.size
end

strings = File.readlines('small_dataset.txt')
              .each_with_index
              .map { |line, i|
                if i%2==0
                  nil
                else
                  line.strip
                end
              }.reject(&:nil?)

n = strings.size

matrix = (0..n-1).map { |i|
                  (0..n-1).map { |j|
                    distance strings[i], strings[j]
                  }
                }

matrix.each { |r|
  puts r.join(' ')
}
