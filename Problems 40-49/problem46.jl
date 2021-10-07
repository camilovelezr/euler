#Problem 46
using Primes
using BenchmarkTools

function goldbach(x)
    p = Primes.primes(x)
    dif = Iterators.map(n -> isinteger(sqrt((x - n)/2)), p)
    if any(dif)
        return true
    else
        return false
    end
end
function find()
    numline = Iterators.countfrom(33, 2)
    works = Iterators.takewhile(x -> goldbach(x), numline)
    return (maximum(works)+2)
end

#Average 14.142 ms in M1.