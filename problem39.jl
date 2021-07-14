#Problem 39

function proof(triple, suma)
    if (sum(triple) == suma) & (triple[1]^2 + triple[2]^2 == triple[3]^2)
        return true
    else
        return false
    end
end


function findtriples()
    results = Dict()
    line = Iterators.product(1:500, 2:500, 3:500)
    last = 0
    for i in 12:400
        new = Iterators.filter(x -> proof(x, i), line)
        t = collect(new)
        print(Threads.threadid())
        if length(t) > last
            last = length(t)
            global maxi = [i, last]
            print(maxi)
        end
    end
    return maxi
end

@time f = findtriples()

maximum(values(f))


for (k, v) in f
    if v == 16
        println(k)
    end
end
