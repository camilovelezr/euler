
# function pandigital2(x::Int)::Bool
#     (Set(unique(digits(x))) == Set(1:9)) && (return true)
#     return false
# end

function pandigital(x::Int)::Bool
    (sum(unique(digits(x))) == 45) && (return true)
    return false
end

function pd(x::Int64)::Bool
    all(in.(1:9, Ref(digits(x))))
end

"""
julia> @btime pandigital(123456789)
  212.462 ns (8 allocations: 1008 bytes)
true

julia> @btime pandigital2(123456789)
  413.945 ns (16 allocations: 1.77 KiB)
true
julia> @btime pd(123456789)
  71.806 ns (4 allocations: 240 bytes)
true
"""

# nine digit pandigitals:
ndp = Iterators.filter(pd, 918273645:999999999)

function concat(n::Int, v::Vector{Int})::Int
    return tryparse(Int, replace(string([n * i for i in v]), "[" => "", "]" => "", ", " => ""))
end

function concat(n::Int, x::Int)::Int
    return concat(n, collect(1:x))
end

function whichcat(n::Int)::Int
    c = Iterators.dropwhile(x -> ndigits(concat(n, x)) < 9, 1:(n-1))
    (isempty(c)) && (return 0)
    f = first(c)
    (ndigits(concat(n, f)) == 9) || (return 0)
    return f
end

function main()::Int
    max = 0
    for n in 9000:9999
        (whichcat(n) == 0) && continue
        x = concat(n, whichcat(n))
        if pd(x)
            (x > max) && (max = x)
        end
    end
    return max
end

"""
julia> @btime main()
  4.193 ms (182000 allocations: 10.09 MiB)
932718654
"""