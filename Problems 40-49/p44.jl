p(n::Int)::Int = n * (3n - 1) / 2

p(3)

function pen(x::Int)::Bool
    ((x == 1) | (x == 5)) && return true
    return x in Iterators.take(Iterators.map(p, Iterators.countfrom(1)), x - 5)
end

pen(t::Tuple)::Bool = pen(t[1]) & pen(t[2])

pen(6)

d(n::Int, y::Int)::Tuple = (p(n) + p(y), abs(p(y) - p(n)))
d(t::Tuple) = d(t...)
d(2, 5)
pen(d(2, 5))
using IterTools
function main()
    return Iterators.take(
        Iterators.filter(x -> pen(d(x)), IterTools.partition(Iterators.countfrom(1), 2, 1)), 5)
end


