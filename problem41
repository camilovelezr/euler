#Problem 41

""""
____________mas grande podria ser de 9 digitos y tendria que usar del 1 al 9. cuantos primos de 9 digitos hay? no debe haber muchos.
podemos empezar revisando esos.
cuales numeros enteros son  de 9 digitos? los numeros entre 10^8, 10^9-1
""""
"""
using Primes

number_line = Primes.primes(10^3, 10^8-1)

function removezeroes(x)
    if 0 in digits(x)
        return false
    else
        return true
    end
end

@time nline = Iterators.filter(x -> removezeroes(x), number_line)



function CheckPandigital(x)
    d = Set(digits(x))
    s = string(x)
    l1 = length(d)
    l2 = length(s)
    if l1 == l2
        check = []
        a = 1:l1
        for i in a
            append!(check, i in d)
        end
        if all(check)
            return true
        else
            return false
        end
    else
        return false
    end
end


j = Iterators.filter(x -> CheckPandigital(x), nline)

@time Threads.@threads maximum(j)

Threads.@threads for i in nline
    if CheckPandigital(i)
        println(i)
    end
end
