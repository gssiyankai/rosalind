s1 = 'CCAAGCTGCTAGAGG'
s2 = 'CATGCTGGGCTGGCT'

s1, s2 = File.readlines('rosalind_7f.txt').map(&:strip)
p s1
p s2

(2..s1.size-1).each { |i|
  p i
  (0..s1.size-1).each { |j|
    sub_s1 = s1[j..j+i-1]
    if not s2.include? sub_s1
      p sub_s1
      exit
    end
  }
}