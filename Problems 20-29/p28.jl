using LinearAlgebra

"""Spiral"""
function spiral(m::Int)
    (iseven(m)) && error("Must be odd")
    (m < 3) && error("Cannot be less than 3")
    first_row = (m^2-m+1):m^2
    v = [collect(first_row)]
    n = Int((m - 1) / 2)
    max_n = copy(n) # for bottom
    cl = 1 # counter of elems with dif 1 left
    cr = -1 # counter of elems with dif 1 right
    """Top"""
    while n >= 1
        d = 7n + n - 1 # difference
        row = [x - d for x in v[end]]
        row[1:cl] = [x - 1 for x in v[end][1:cl]]
        if cr != -1
            row[(m-cr):end] = [x + 1 for x in v[end][(m-cr):end]]
        end
        push!(v, row)
        n -= 1
        cl += 1
        cr += 1
    end
    n = 1
    cl = -1 # counter of elems with dif 1 left
    while n <= max_n
        d = 3n + 5(n - 1)
        row = [x + d for x in v[end]]
        row[1:(max_n-n+1)] = [x - 1 for x in v[end][1:(max_n-n+1)]]
        row[(m-(max_n-n)):end] = [x + 1 for x in v[end][(m-(max_n-n)):end]]
        push!(v, row)
        n += 1
    end
    return reduce(hcat, v)'
end

function sum_diag(n::Int)
    m = spiral(n)
    s = []
    append!(s, diag(m))
    append!(s, diag(reverse(m; dims=2)))
    return sum(s) - 1
end

"""
julia> @time sum_diag(1001)
  0.014216 seconds (8.97 k allocations: 31.361 MiB, 44.56% gc time)
669171001

julia> @btime sum_diag(1001)
  3.569 ms (8973 allocations: 31.36 MiB)
669171001
"""