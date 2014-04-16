f = File.readlines('small_dataset.txt')

n = f[0].to_i

A = f[1].delete('{}').split(',').map(&:to_i)
B = f[2].delete('{}').split(',').map(&:to_i)

U = (1..n).to_a

[A | B, A & B, A - B, B - A, U - A, U - B].each { |s| puts "{" + s.join(', ') + "}" }

