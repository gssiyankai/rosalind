DNA_CODON_TABLE = {
    'TTT' => 'F', 'CTT' => 'L', 'ATT' => 'I', 'GTT' => 'V',
    'TTC' => 'F', 'CTC' => 'L', 'ATC' => 'I', 'GTC' => 'V',
    'TTA' => 'L', 'CTA' => 'L', 'ATA' => 'I', 'GTA' => 'V',
    'TTG' => 'L', 'CTG' => 'L', 'ATG' => 'M', 'GTG' => 'V',
    'TCT' => 'S', 'CCT' => 'P', 'ACT' => 'T', 'GCT' => 'A',
    'TCC' => 'S', 'CCC' => 'P', 'ACC' => 'T', 'GCC' => 'A',
    'TCA' => 'S', 'CCA' => 'P', 'ACA' => 'T', 'GCA' => 'A',
    'TCG' => 'S', 'CCG' => 'P', 'ACG' => 'T', 'GCG' => 'A',
    'TAT' => 'Y', 'CAT' => 'H', 'AAT' => 'N', 'GAT' => 'D',
    'TAC' => 'Y', 'CAC' => 'H', 'AAC' => 'N', 'GAC' => 'D',
    'TAA' => '-', 'CAA' => 'Q', 'AAA' => 'K', 'GAA' => 'E',
    'TAG' => '-', 'CAG' => 'Q', 'AAG' => 'K', 'GAG' => 'E',
    'TGT' => 'C', 'CGT' => 'R', 'AGT' => 'S', 'GGT' => 'G',
    'TGC' => 'C', 'CGC' => 'R', 'AGC' => 'S', 'GGC' => 'G',
    'TGA' => '-', 'CGA' => 'R', 'AGA' => 'R', 'GGA' => 'G',
    'TGG' => 'W', 'CGG' => 'R', 'AGG' => 'R', 'GGG' => 'G'
}


lines = File.readlines('small_dataset.txt')
	      .reduce([]) { |acc, s|
	        if s.start_with?('>')
	          acc << ''
	        else
	          acc[-1] = acc[-1] + s.strip
	        end
	        acc
	      }

dna = lines[0]
introns = lines[1..-1]

p introns.reduce(dna) { |acc, intron| acc.gsub(intron, '') }
	.scan(/.../)
	.map { |codon| DNA_CODON_TABLE[codon] }
	.reject { |s| s=='-' }
	.join

