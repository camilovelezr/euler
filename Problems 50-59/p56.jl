"""
Considering natural numbers of the form, ab, where a, b < 100, what is the maximum digital sum?
"""

_su(t::NTuple{2,Int}) = sum(digits(BigInt(BigInt(t[1])^BigInt(t[2]))))

maximum(_su, Iterators.product(1:99, 1:99))

"""
julia> @btime maximum(_su, Iterators.product(1:99, 1:99))
  6.552 ms (134798 allocations: 10.81 MiB)
972
"""