"""
The arithmetic sequence, 1487, 4817, 8147, in which each of the terms increases by 3330, is unusual in two ways: (i) each of the three terms are prime, and, (ii) each of the 4-digit numbers are permutations of one another.

There are no arithmetic sequences made up of three 1-, 2-, or 3-digit primes, exhibiting this property, but there is one other 4-digit increasing sequence.

What 12-digit number do you form by concatenating the three terms in this sequence?
"""

using Primes
using IterTools
using Combinatorics

p = primes(1000, 9999)
p = Iterators.filter(_dn, p)
_di(x::Int, y::Int)::Bool = Set(digits(x)) == Set(digits(y))

function find(v)
    yes = []
    for n in v
        nv = Iterators.filter(x -> _di(x, n), v)
        for r in collect(permutations(collect(nv), 3))
            r in yes && continue
            ((r[3] - r[2]) == (r[2] - r[1]) & (r[2] - r[1]) > 0) && (push!(yes, r))
        end
    end
    return yes
end




