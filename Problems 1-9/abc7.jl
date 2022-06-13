function f(a::Int, b::Int, c::Int)::Bool
    if a > 800
        a = BigInt(a)
    end
    if b > 800
        b = BigInt(b)
    end
    if c > 800
        c = BigInt(c)
    end
    return (a^2 + b^3 == c^7 ? true : false)
end
f(t::Tuple{Int, Int, Int}) = f(t[1], t[2], t[3])
nl = Iterators.product(Iterators.countfrom(1), Iterators.countfrom(1), Iterators.countfrom(1))

i = 1
@time begin
    for t in nl
        if f(t)
            println(t)
            break
        end
        i += 1
        i%10^8 == 0 && println(i)
    end
end