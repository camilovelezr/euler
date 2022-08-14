"""
How many Lychrel numbers are there below ten-thousand?
"""

_p(x::Union{BigInt,Int})::Bool = (digits(x) == reverse(digits(x))) ? (return true) : (return false)

function lychrel(x::Int)::Bool
    l = true
    i = 1
    while (l) & (i < 50)
        r = evalpoly(10, reverse(digits(x)))
        (_p(BigInt(x + r))) && (l = false; break)
        x = BigInt(x + r)
        i += 1
    end
    return l
end

@time length(collect(Iterators.filter(lychrel, 1:10^4)))

"""
julia> @btime length(collect(Iterators.filter(lychrel, 1:10^4)))
  63.367 ms (1356021 allocations: 54.82 MiB)
249
"""