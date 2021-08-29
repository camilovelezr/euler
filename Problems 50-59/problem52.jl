"""
It can be seen that the number, 125874, and its double, 251748, contain exactly the same digits, but in a different order.
Find the smallest positive integer, x, such that 2x, 3x, 4x, 5x, and 6x, contain the same digits.
"""

using BenchmarkTools

nl = Iterators.countfrom(10^2)

function main(x)
    nums = [x, 2x, 3x, 4x, 5x, 6x]
    ds = Iterators.map(x -> Set(digits(x)), nums)
    s = Iterators.map(t -> t==Set(digits(x)), ds)
    return all(s)
end

function find()
    return collect(Iterators.takewhile(x -> !main(x), nl))[end] + 1
end

"""
M1: 137.813 ms
"""
