"""
By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.

What is the 10 001st prime number?
"""

using Primes

prime(10001)

"""
julia> @btime prime(10001)
  6.953 ms (16997 allocations: 265.58 KiB)
104743
"""