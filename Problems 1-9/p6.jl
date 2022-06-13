"""
Find the difference between the sum of the squares of the first one hundred natural numbers and the square of the sum.
"""

main() = abs(sum(1:100)^2 - (sum(x -> x^2, 1:100)))

"""
julia> @btime main()
  3.291 ns (0 allocations: 0 bytes)
25164150
"""