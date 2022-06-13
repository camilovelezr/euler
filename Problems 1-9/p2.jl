using BenchmarkTools

function fib(n::Integer)::Vector{Union{Integer,BigInt}}
    n == 1 && return [1]
    n == 2 && return [1, 2]
    c = 3
    v = [BigInt(1), BigInt(2)]
    i = 3
    while c <= n
        push!(v, v[i-1] + v[i-2])
        i += 1
        c += 1
    end
    return v
end

@btime sum(n for n in fib([y for y in 1:40 if fib(y)[end] < 4 * 10^6][end]) if iseven(n)) # medium


phi = ((1 + sqrt(5)) / 2)

function bfib(n::Integer)::Union{Integer,BigInt}
    r = (
        (phi^n - (-phi)^(-n)) / sqrt(5)
    )
    return round(r)
end

@btime sum(Iterators.filter(iseven,
    Iterators.takewhile(n -> n < 4 * 10^6,
        Iterators.map(bfib,
            Iterators.countfrom(1)
        )
    )
)
) # very fast
"""
sum(Iterators....)
M1 Pro  9.208 μs (330 allocations: 5.69 KiB)
4613732
"""