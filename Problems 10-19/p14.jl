"""
n → n/2 (n is even)
n → 3n + 1 (n is odd)
Which starting number,
under one million, produces the longest chain?
"""

using BenchmarkTools
using IterTools: iterated, takewhile

"""First approach using iterated & takewhile"""

function _c(n::Int64)::Int64
    (n == 1) && return 0
    (iseven(n)) && return n / 2
    return 3n + 1
end
function collatz(n::Int64)::Vector{Int64}
    return iterated(_c, n) |> x -> takewhile(>(0), x) |>
                                   collect
end
"""
julia> @btime collatz(13)
  216.908 ns (4 allocations: 544 bytes)
10-element Vector{Int64}:
"""

"""Second approach using while loop"""

function collatzwhile(n::Int64)::Vector{Int64}
    v = Vector{Int64}()
    while n > 0
        push!(v, n)
        n = _c(n)
    end
    return v
end

"""
julia> @btime collatzwhile(13)
  92.923 ns (3 allocations: 480 bytes)
10-element Vector{Int64}:
"""
# collatzwhile is faster!!!! :O

function ncollatz(n::Int64)::Int64
    return length(collatzwhile(n))
end

function main()::Int64
    return map(ncollatz, 1:10^6-1) |> argmax
end

"""
M1 Pro (all above also M1 Pro)
julia> @btime main()
  1.256 s (4220333 allocations: 3.08 GiB)
837799
"""

function slowncollatz(n::Int64)::Int64
    return length(collatz(n))
end

function mainslow()::Int64
    return map(slowncollatz, 1:10^6-1) |> argmax
end

"""
julia> @btime mainslow()
  2.935 s (95393282 allocations: 4.48 GiB)
837799
"""
