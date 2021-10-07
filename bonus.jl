function pass()
    n = Iterators.countfrom(100)
    function isit(x)
        if (sum(digits(x))^3) == x
            return false
        else
            return true
        end
    end
    f = Iterators.dropwhile(isit, n)
    (t, a) = Iterators.peel(f)
    return t
end

"""
i7
@btime pass()
    14.831 μs (413 allocations: 45.17 KiB)
512
"""