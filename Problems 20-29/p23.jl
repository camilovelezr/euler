"""
A perfect number is a number for which the sum of its proper divisors is exactly equal to the number. For example, the sum of the proper divisors of 28 would be 1 + 2 + 4 + 7 + 14 = 28, which means that 28 is a perfect number.
A number n is called deficient if the sum of its proper divisors is less than n and it is called abundant if this sum exceeds n.
As 12 is the smallest abundant number, 1 + 2 + 3 + 4 + 6 = 16, the smallest number that can be written as the sum of two abundant numbers is 24. By mathematical analysis, it can be shown that all integers greater than 28123 can be written as the sum of two abundant numbers. However, this upper limit cannot be reduced any further by analysis even though it is known that the greatest number that cannot be expressed as the sum of two abundant numbers is less than this limit.
Find the sum of all the positive integers which cannot be written as the sum of two abundant numbers.
"""

using Combinatorics
using ProgressBars

# _divisors(n::Int) = (n==1) ? 1 : sum([x for x in 1:(n-1) if n%x==0]) slower
_divisors(n::Int) = (n == 1) ? 1 : sum(Iterators.filter(x -> n % x == 0, 1:(n-1)))

function n(n::Int)::AbstractString
    (_divisors(n) > n) && return "abundant"
    (_divisors(n) < n) && return "deficient"
    return "perfect"
end

# can be: 28123>
# function to see if can be written as a sum of two abundant?
abn = Iterators.filter(x -> n(x) == "abundant", 12:28123)
# since 28123-12 = 28111, last one can be 28111
abn = Iterators.filter(<=(28111), abn)
abn = collect(abn)
# smaller: 24 = 12+12, larger: 28123

c = []
function canbe(x::Int, itr)
    v = collect(itr)
    for d in collect(Iterators.filter(<=(x), v))
        ((x - d) in v) && (return true)
    end
    return false
end
sum(Iterators.filter(x -> !(canbe(x, abn)), 1:28123))
"""
julia> @time sum(Iterators.filter(x -> !(canbe(x, abn)), 1:28123))
 11.148678 seconds (326.42 k allocations: 3.397 GiB, 3.25% gc time, 0.19% compilation time)
4179871
"""

function main()
    s = []
    Threads.@threads for n in ProgressBar(1:28123)
        (canbe(n, abn)) || (push!(s, n))
    end
    return sum(s)
end
"""
julia> @time main()
99.2%┣██████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████▉ ┫ 27.9k/28.1k [00:03<00:00, 11.1kit/s]
  2.603047 seconds (396.81 k allocations: 3.397 GiB, 7.08% gc time)
4179871
"""