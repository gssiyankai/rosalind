dna = File.readlines('rosalind_kmp.txt')[1..-1].map(&:strip).join


failure_array = (1..dna.size-1).reduce([0]) { |acc, i|
					len = acc.last
					if dna[len] == dna[i]
						acc << len + 1
					else
						max = (0..len).reverse_each.drop_while { |len| dna[0..len] != dna[i-len..i] }.first
						acc << 	(max||-1) + 1
					end
					acc
				}

puts failure_array.join(' ')
