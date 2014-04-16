def all_reversals
  (1..10).map { |i|
    (1..10).map { |j|
      [i,j]
    }
  }.flatten(1)
   .select { |i,j| i!=j }
   .uniq
end

def transform permutation, reversal
  [
   (1..reversal[0]-1),
   (reversal[1]).downto(reversal[0]),
   (reversal[1]+1..10)
  ].map { |r| r.to_a }
   .reduce(:+)
   .map { |i| permutation[i-1] }
end

def solve_brute_force pis, gamma, cache, reversals
  tuples = all_reversals.map { |r|
                            pis.map { |pi|
                              [pi, r, transform(pi, r)]
                            }
                         }
                         .flatten(1)
                         .reject { |_, _,t|
                           cache.include? t
                         }
  tuples.each { |_,_,t|
    cache << t
  }
  solution = tuples.find { |_,_,t| t == gamma }
  if solution.nil?
    solve_brute_force(tuples.map { |_,_,t| t },
                      gamma,
                      cache,
                      tuples.map { |p,r,t| [t, reversals[p] + [r]] }.to_h)
  else
    r =reversals[solution[0]]
    r << solution[1]
    [r.size, r]
  end
end

def solve pi, gamma
  solve_brute_force([pi], gamma, [pi], { pi => [] })
end

pi, gamma = ['1 2 3 4 5 6 7 8 9 10',
             '1 8 9 3 2 7 6 5 4 10'].map { |s| s.split(' ').map(&:to_i) }
distance, reversals = solve(pi, gamma)
p distance
reversals.each { |r| puts r.join(' ') }