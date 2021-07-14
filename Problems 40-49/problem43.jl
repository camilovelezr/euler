#Problem 43
using Combinatorics
using BenchmarkTools

function CreateNumber(array, start, finish)
    a = array[start:finish]
    return n = parse(Int, join(string.(a)))
end

function conditions(array)
    if CreateNumber(array, 2, 4) % 2 != 0
        return false
    elseif CreateNumber(array, 3, 5) % 3 != 0
        return false
    elseif CreateNumber(array, 4, 6) % 5 != 0
        return false
    elseif CreateNumber(array, 5, 7) % 7 != 0
        return false
    elseif CreateNumber(array, 6, 8) % 11 != 0
        return false
    elseif CreateNumber(array, 7, 9) % 13 != 0
        return false
    elseif CreateNumber(array, 8, 10) % 17 != 0
        return false
    else
        return true
    end
end

function ConvertToNumber(array)
    return parse(Int, join(string.(array)))
end

test = [1, 4, 0, 6, 3, 5, 7, 2, 8, 9]

function main()
    opt = 0:9

    l = permutations(opt)

    l = Iterators.filter(x -> x[1]!=0, l)

    num = Iterators.filter(x -> conditions(x), l)

    num = Iterators.map(x -> ConvertToNumber(x), num)
    return sum(num)
end

#Running time 2.5 s msi.