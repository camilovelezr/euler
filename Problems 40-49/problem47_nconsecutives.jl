using Primes
using IterTools
using BenchmarkTools

""" Program to find the first n consecutive integers with n distinct factors 
    For example,
        find(2)
        returns (14, 15) since 14 and 15 are the first two consecutive integers to have two distinct factors:
            14 = 2 x 7
            15 = 3 x 5
"""


function find(n)
    nl = Iterators.countfrom(4)
    nl = Iterators.filter(x -> !(isprime(x)), nl)   
    line = Iterators.filter(x -> (length(factor(x)) == n), nl)
    line = partition(line, n, 1)
    line = Iterators.filter(x->(x==Tuple(x[1]:x[end])), line)
    return nth(line, 1)
end

#find(4) 82.960 ms in M1, find(3) 205.750 µs in M1.


