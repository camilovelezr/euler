"""
What is the millionth lexicographic permutation of the digits 0, 1, 2, 3, 4, 5, 6, 7, 8 and 9?
"""

using Combinatorics

@time nthperm(0:9, 10^6)
"""
julia> @time nthperm(0:9, 10^6)
  0.000003 seconds (1 allocation: 144 bytes)
10-element Vector{Int64}
"""