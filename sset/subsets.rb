def factorial n
	if n==0 
		1 
	else
		(1..n).reduce(:*) 
	end
end

def binomial n, k
	factorial(n).div(factorial(k)).div(factorial (n-k))
end

def subsets n
	(0..n).reduce(0) { |acc, i|
		(acc + binomial(n, i)).modulo(1000000)
	}
end

n = 953
p subsets n
