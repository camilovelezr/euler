"""
A palindromic number reads the same both ways.
The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99.

Find the largest palindrome made from the product of two 3-digit numbers.
"""

using Primes

function palindromic(n::Int)::Bool
    digits(n) == reverse(digits(n)) && return true
    return false
end

# Method 1

import Base.*
*(t::Tuple{Int,Int}) = t[1] * t[2]

function findpal()
    nl = Iterators.map(*, Set(Iterators.product(100:999, 100:999)))
    n = Iterators.filter(palindromic, nl)
    l = last(sort(collect(n)))
    return l
end

using BenchmarkTools
@btime findpal()
"""
93.632 ms (2430017 allocations: 287.16 MiB)
906609
"""

"""
polinomial of all integers result of multiplying three digit integers:
10^4ad + 10^3af + 10^2ag + 10^3bd + 10^2bf +10bg + 10^2cd + 10cf + cg;
where a, d are integers greater than 0 and less than 10;
b, c, f, g are integers greater or equal to 0 and less than 10.

10^4 ad + 10^3af + 10^3 bd + 10^2ag + 10^2bf + 10^2cd + 10bg + 10cf + cg;
"""

a, d = 1:9, 1:9
c, b, f, g = 0:9, 0:9, 0:9, 0:9

nl = Iterators.product(a, b, c, d, f, g)
function pol(t::NTuple)::Int64
    a, b, c, d, f, g = t
    return (10^4)a * d + (10^3)a * f + (10^3)b * d + (10^2)a * g + (10^2)b * f + (10^2)c * d + 10b * g + 10c * f + c * g
end

nl = Iterators.map(pol, nl)
function palpol()
    r = Int64(0)
    for t in nl
        if palindromic(t)
            if t > r
                r = t
            end
        end
    end
    return r
end

function palpol2()
    r = []
    Threads.@threads for t in collect(Iterators.flatten(nl))
        palindromic(t) && push!(r, t)
    end
    return maximum(r)
end # fastest

"""
can't @btime
@time palpol2()
  0.064059 seconds (2.43 M allocations: 263.004 MiB, 12.87% gc time)
906609
"""

