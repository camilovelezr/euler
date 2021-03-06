#Problem 42

function main()
    function trianglenumber(n)
        return Int(1/2*n*(n+1))
    end

    txt = open("words.txt", "r") do file
        readlines(file)
    end

    function getscore(x)
        return sum(Int.(codeunits(x)).-64)
    end

    scores = Iterators.map(x -> getscore(x), txt)

    t = Iterators.takewhile(x -> x<=maximum(scores), Iterators.map( x-> trianglenumber(x), Iterators.countfrom(1)))

    return Iterators.count(x -> x in t, scores)
end

#Running time about 2.9 s in msi. 4.2 s in M1