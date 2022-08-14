"""0.12345678910111213141516171819202122"""

"""
{
    10: 1
    11: 0
    12: 1
    13: 1
    14: 1
    15: 2
    16: 1
    17: 3
    18: 1
    19: 4
    20: 1
    21: 5
    22: 1
    23: 6
    24: 1
    25: 7
    26: 1
    27: 8 
    28: 1
    29: 9
    30: 2
}
"""

"""
From 1 to 9: 1
From 10 to 99: 2
From 100 to 999: 3
"""


# import Orderedollections: OrderedDict
# function dd(r::UnitRange{Int64})::OrderedDict{Int64,Int64}
#     s = 10
#     c = 0
#     d = Dict{Int64,Int64}()
#     for num in r
#         for digit in reverse(digits(num))
#             d[s+c] = digit
#             c += 1
#         end
#     end
#     return sort(d)
# end
# function dd(::Type{Dict}, r::UnitRange{Int64})::Dict{Int64,Int64}
#     s = 10
#     c = 0
#     d = Dict{Int64,Int64}()
#     for num in r
#         for digit in reverse(digits(num))
#             d[s+c] = digit
#             c += 1
#         end
#     end
#     return d
# end

function ddo()::Dict{Int64,Int64}
    s = 10
    c = 0
    d = Dict{Int64,Int64}()
    for num in Iterators.countfrom(10)
        (c == 10^6) && break
        for digit in reverse(digits(num))
            (c == 10^6) && break
            d[s+c] = digit
            c += 1
        end
    end
    return d
end


function main()::Int64
    d = ddo()
    return prod([1, d[10], d[10^2], d[10^3], d[10^4], d[10^5], d[10^6]])
end

# w/o type annotations
function wddo()
    s = 10
    c = 0
    d = Dict()
    for num in Iterators.countfrom(10)
        (c == 10^6) && break
        for digit in reverse(digits(num))
            (c == 10^6) && break
            d[s+c] = digit
            c += 1
        end
    end
    return d
end

function main2()
    d = wddo()
    return prod([1, d[10], d[10^2], d[10^3], d[10^4], d[10^5], d[10^6]])
end

# without being stupid

function vot(::Type{T})::Vector{T} where {T<:Integer}
    v = Vector{T}()
    c = 1
    for num in Iterators.countfrom()
        (c > 10^6) && break
        for d in reverse(digits(num))
            (c > 10^6) && break
            push!(v, d)
            c += 1
        end
    end
    return v
end # quickest Int16
function votd(::Type{T})::Vector{T} where {T<:Integer}
    v = Vector{T}(undef, 10^6)
    c = 1
    for num in Iterators.countfrom()
        (c > 10^6) && break
        for d in reverse(digits(num))
            (c > 10^6) && break
            v[c] = d
            c += 1
        end
    end
    return v
end # faster than vot()

@inline function vo()::Vector{Int16}
    v = Vector{Int16}()
    c = 1
    for num in Iterators.countfrom()
        (c > 10^6) && break
        for d in reverse(digits(num))
            (c > 10^6) && break
            push!(v, d)
            c += 1
        end
    end
    return v
end # for some reason slower than parametric

function main3()::Int16 # assuming result < 32767 (2^15 -1)
    v = votd(Int16)
    return prod([v[10^x] for x in 0:6])
end
"""
M1 Pro
julia> @btime main()
  50.245 ms (370409 allocations: 101.65 MiB)
210

julia> @btime main2()
  221.043 ms (5361914 allocations: 177.81 MiB)
210

julia> @btime main3()
  15.258 ms (370373 allocations: 38.38 MiB)
210
julia> @btime q1()
  12.198 ms (421240 allocations: 41.06 MiB)
210
"""

function vcf()
    return Iterators.countfrom() |>
           num -> Iterators.map(x -> reverse(digits(x)), num) |>
                  l -> Iterators.flatten(l) |> nl -> Iterators.take(nl, 10^6)
end
function main4()::Int16
    v = vcf()
    t = Iterators.filter(x -> x[1] in [1, 10, 100, 1000, 10000, 100000, 1000000], Iterators.enumerate(v))
    return prod(x -> x[2], t)
end
using IterTools
function self(s::T)::T where {T}
    return s
end
function q1()::Int64
    return mapreduce(self, *, Iterators.map(x -> IterTools.nth(
            Iterators.flatten(Iterators.map(x -> reverse(digits(x)),
                Iterators.countfrom())), 10^x), 0:6))
end
function ndig()::Int64
    return 9 + 2 * (99 - 10 + 1) + 3 * (999 - 100 + 1) + 4 * (9999 - 1000 + 1) + 5 * (99999 - 10000 + 1) #+
    #6 * (999999 - 100000 + 1)#  + 7 * (9999999-1000000+1)
end
