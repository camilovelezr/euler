function l(x::Int, y::Int)::Int
    new_a = y
    n = 1
    while !(new_a in [0, 1])
        new_a = new_a^2 % (x + n - 1)
        n += 1
    end
    return n
end
function l(x::Int, y::Int, v::Vector)::Vector
    push!(v, y)
    new_a = y
    n = 1
    while !(new_a in [0, 1])
        new_a = new_a^2 % (x + n - 1)
        push!(v, new_a)
        n += 1
    end
    return v
end

g(x::Int)::Int = (x == 1) ? (1) : (maximum(y -> l(x, y), 1:(x-1)))
f(n::Int)::Int = maximum(g, 1:n)

using ProgressBars
function mainf(n::Int)::Int
    v = []
    Threads.@threads for x in ProgressBar(1:n)
        push!(v, g(x))
    end
    return maximum(v)
end
