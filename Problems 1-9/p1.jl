function p1()::Int # did not improve performance
    n = Iterators.countfrom(3)
    t = Iterators.takewhile(<(1000), n)
    function _t(x::Int)::Bool # did not improve performance
        if (x % 3 == 0) || (x % 5 == 0)
            return true
        else
            return false
        end
    end
    return sum(Iterators.filter(x -> _t(x), t))
end

"""
M1
    1.850 μs (0 allocations: 0 bytes)
233168

M1 Pro
julia> @btime p1()
  1.500 μs (0 allocations: 0 bytes)
233168
"""