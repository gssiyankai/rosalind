
def fib n, k
  case n
    when 1 then 1
    when 2 then 1
    else fib(n-1, k) + fib(n-2, k) * k
  end
end

p fib 31, 3