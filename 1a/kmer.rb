#s = 'ACGTTGCATGTCGCATGATGCATGAGAGCT'
#k = 4

s = 'GCCAAATCTTCAAAAATTCCAAAAATTCCAAAAATTCTATGCTGAGTCGCGTCATTGCCAAATCTTTCGCGTCATTGCCAAATCTTCAAAAATTCCAAAAATTCTCGCGTCATTGGGCCTACTTGGGCCTACTTGGGCCTACTTTCGCGTCATTCAAAAATTCTATGCTGAGCAAAAATTCTCGCGTCATTGGGCCTACTTCAAAAATTCTCGCGTCATTGCCAAATCTTGGGCCTACTTTCGCGTCATTGCCAAATCTTGCCAAATCTTTATGCTGAGGCCAAATCTTCAAAAATTCGCCAAATCTTTCGCGTCATTGGGCCTACTTTCGCGTCATTGGGCCTACTTCAAAAATTCTCGCGTCATTTATGCTGAGGGGCCTACTTGGGCCTACTTCAAAAATTCGCCAAATCTTTCGCGTCATTGGGCCTACTTCAAAAATTCTCGCGTCATTCAAAAATTCTCGCGTCATTGGGCCTACTTTCGCGTCATTGCCAAATCTTCAAAAATTCGGGCCTACTTCAAAAATTCGGGCCTACTTTATGCTGAGTCGCGTCATTTCGCGTCATTCAAAAATTCGCCAAATCTTGCCAAATCTTCAAAAATTCGCCAAATCTTGGGCCTACTTGCCAAATCTTTATGCTGAGGGGCCTACTTTATGCTGAGTCGCGTCATTCAAAAATTCGGGCCTACTTGGGCCTACTTCAAAAATTCTATGCTGAGGCCAAATCTTCAAAAATTCTCGCGTCATTTCGCGTCATTGCCAAATCTTGCCAAATCTTGCCAAATCTTGCCAAATCTTCAAAAATTCCAAAAATTCTATGCTGAGGGGCCTACTTCAAAAATTCTCGCGTCATTCAAAAATTCGCCAAATCTTCAAAAATTCTATGCTGAGGGGCCTACTTTATGCTGAGGGGCCTACTTGGGCCTACTTGGGCCTACTTGCCAAATCTTGGGCCTACTTTCGCGTCATT'
k = 13

f = (0..s.size-1-k).map { |i| s[i..i+k-1] }
                   .reduce({}) { |acc, cs|
                      acc[cs] = (acc[cs]||0)+1
                      acc
                   }

puts f.select { |_,v| v == f.values.max }
   .map { |k,_| k }
   .join(' ')