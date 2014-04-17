TRANSITIONS = { 'A' => 'G', 'G' => 'A', 'C' => 'T', 'T' => 'C' }

s1, s2 = File.readlines('small_dataset.txt')
             .reduce([]) { |acc, s|
                if s.start_with?('>')
                  acc << ''
                else
                  acc[-1] = acc[-1] + s.strip
                end
                acc
             }
             .map { |s| s.split(//) }

transitions = 0.0
transversions = 0.0

s1.zip(s2)
  .select { |a, b| a!=b }
  .map { |a, b|
    if TRANSITIONS[a] == b
      transitions = transitions + 1
    else
      transversions = transversions + 1
    end
  }

p transitions/transversions