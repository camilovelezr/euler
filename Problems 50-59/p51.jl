"""
Find the smallest prime which, by replacing part of the number (not necessarily adjacent digits) with the same digit, is part of an eight prime value family.
"""

"""
We will start checking 6-digit primes and then 7-digit and so on...
"""

using Primes
using IterTools
using Combinatorics
using ProgressBars

function replaced(x::Int)
    d = digits(x)
    l = Dict{Vector,Vector{Int}}([[0] => [x]])
    for a in 0:9
        for n in 1:length(d)
            ind = combinations(1:length(d), n)
            for i in ind
                nd = copy(d)
                nd[i] .= a
                nnum = evalpoly(10, nd)
                (nnum < x) && continue
                (haskey(l, i)) || (l[i] = [])
                # (x in l[i]) || push!(l[i], x)
                nnum in l[i] && continue
                push!(l[i], nnum)
            end
        end
    end
    return l
end

function nprimes(v::Vector)
    return length(collect(Iterators.filter(isprime, v)))
end

function nprimes(d::Dict{<:Any,Vector{Int}})::Vector{Int}
    return [length(collect(Iterators.filter(isprime, y))) for (x, y) in d]
end

function ret(x)::Int
    r = nprimes(replaced(x))
    (8 in r) || return 0
    return minimum([y for (x, y) in Iterators.filter(x -> nprimes(x[2]) == 8, replaced(x))][1])
end


p = primes(11, 10^6)

function main()::Int
    return first(Iterators.filter(>(0), Iterators.map(ret, p)))
end

"""
julia> @btime main()
  822.979 ms (14817701 allocations: 1011.14 MiB)
121313
"""
