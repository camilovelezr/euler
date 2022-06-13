"""Find the sum of all the primes below two million."""

using Primes

sum(primes(1, 2 * 10^6 - 1))

"""
julia> @time sum(primes(1, 2*10^6-1))
  0.003916 seconds (7 allocations: 1.649 MiB)
142913828922
"""