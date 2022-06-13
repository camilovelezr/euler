"""
2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.
What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?
"""
divisible(x::Int, y::Int) = isinteger(y / x)
divisible(itr, y::Int) = all(Iterators.map(x -> divisible(x, y), itr))

main() = first(Iterators.dropwhile(x -> (!divisible(1:20, x)), Iterators.countfrom()))

"""
julia> @btime main()
  683.656 ms (0 allocations: 0 bytes)
232792560
"""