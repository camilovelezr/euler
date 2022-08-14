using IterTools
using BenchmarkTools

function el(n::BigInt)
    return BigInt(big(n)^big(n))
end

function main()
    exp = 1:1000
    exp = Iterators.map(x -> el(big(x)), exp)
    s = sum(exp)
    return replace(replace(replace(replace(reverse(string(digits(s)[1:10])), "]" => ""), "[" => ""), "," => ""), " " => "")
end


