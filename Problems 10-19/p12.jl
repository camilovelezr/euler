"""
What is the value of the first triangle number to have over five hundred divisors?
"""
using Primes

t = Iterators.accumulate(+, Iterators.countfrom(1))

# divisible(x::Int, y::Int) = isinteger(y / x)
# divisors(y::Int) = [x for x in 1:y if divisible(x, y)]
# lend(y::Int) = length(divisors(y))
_p(n::Int) = [y + 1 for (x, y) in factor(Dict, n)]
nd(x::Int) = prod(_p(x))

first(Iterators.dropwhile(x -> nd(x) <= 500, t))

"""
julia> @btime first(Iterators.dropwhile(x -> nd(x) <= 500, t))
  6.322 ms (117933 allocations: 14.06 MiB)
76576500
"""
