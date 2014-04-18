dna = File.readlines('small_dataset.txt')[1..-1].map(&:strip).join

failure_array = [0] + 
		(1..dna.size-1).map { |i| 
					max = (0..i-1).reverse_each.drop_while { |len| dna[0..len] != dna[i-len..i] }.first
					(max||-1) + 1
				}

puts failure_array.join(' ')
