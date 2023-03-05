struct DiophantineFunction <: Function
    c::Int
    λ::Int
    _x::Bool
end
function (d::DiophantineFunction)(x)
    (d._x) && (l = d.λ)
    !(d._x) && (l = -d.λ)
    return d.c + l * x
end
function Base.show(io::IO, df::DiophantineFunction)
    (df._x) && (print(io, "$(df.c) + $(df.λ)λ"); return)
    print(io, "$(df.c) - $(df.λ)λ")
end
struct DiophantineSolution
    x::DiophantineFunction
    y::DiophantineFunction
    z::Vector{Int}
    function DiophantineSolution(x::String, y::String, z::Vector{Int})
        function coefs(s::String)::Vector{Int}
            xs = split(s)[[1, end]]
            xs[2] = xs[2][1:end-1]
            return parse.(Int, xs)
        end
        x1, x2 = coefs(x)
        y1, y2 = coefs(y)
        new(DiophantineFunction(x1, x2, true), DiophantineFunction(y1, y2, false), z)
    end
end
function (d::DiophantineSolution)(x)
    return (d.x(x), d.y(x))
end




function solve(x::Int, y::Int, eq::Int)::DiophantineSolution
    g = gcd(x, y)
    @assert rem(eq, g) == 0
    # set y = 0
    # x = x/g
    # y = y/g
    x1 = eq / x
    if isinteger(x1)
        return DiophantineSolution("$(Int(x1)) + $(Int(y))λ", "0 - $(Int(x))λ", [x, y, eq])
    else
        function f(x, y)
            xx1 = div(eq, x)
            yy1 = (eq - xx1 * x) / y
            return (xx1, yy1)
        end
        function f(x, y, x1)
            yy1 = (eq - x1 * x) / y
            return (x1, yy1)
        end
        x1, y1 = f(x, y)
        while !isinteger(y1)
            x1 = x1 - 1
            x1, y1 = f(x, y, x1)
        end
        return DiophantineSolution("$(Int(x1)) + $(Int(y))λ", "$(Int(y1)) - $(Int(x))λ", [x, y, eq])
    end
end



