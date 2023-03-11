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
    _z::Vector{Int}
    function DiophantineSolution(x::Vector{Int}, y::Vector{Int}, z::Vector{Int})
        new(DiophantineFunction(x[1], x[2], true), DiophantineFunction(y[1], y[2], false), z)
    end
end
function Base.show(io::IO, ds::DiophantineSolution)
    print(io, "DiophantineSolution($(repr(ds.x)), $(repr(ds.y)))")
end


"""
    firstzero(f::DiophantineFunction)::Int

    Return first value of λ that makes coefficient <= 0.
"""
function firstzero(f::DiophantineFunction)::Int
    # solve the inequality a ⨦ bλ < 0
    return Int(floor(-f.c / f.λ))
end


"""
    npos(f::DiophantineSolution)::Int

Return the number of positive solutions to the Diophantine equation.
"""
function npos(f::DiophantineSolution)::Int
    z = firstzero(f)
    # (z[1] + 1 == z[2] - 1 == 0) && return 1
    return length(z[1]+1:z[2]-1)
end

"""
    positivesol(f::DiophantineSolution)::Int

Return which values of λ generate positive solutions to the Diophantine equation.
"""
function positivesol(f::DiophantineSolution)::Union{Nothing,Int} # TODO change to vector
    z = firstzero(f)
    (z[1] + 1 == z[2] - 1) && return nothing
    return collect(z[1]+1:z[2]-1)
end

function firstzero(f::DiophantineSolution)::Vector{Int}
    [firstzero(f.x), firstzero(f.y)]
end
function (d::DiophantineSolution)(x)
    return (d.x(x), d.y(x))
end


"""
    solve(x::Int, y::Int, eq::Int)
    x = coefficient of x
    y = coefficient of y
    eq = rhs 

Solve a Diophantine equation.

"""
function solve(x::Int, y::Int, eq::Int)::DiophantineSolution
    g = gcd(x, y)
    @assert rem(eq, g) == 0
    x1 = eq / x
    if isinteger(x1)
        return DiophantineSolution(Int.([x1, y]), Int.([0, x]), [x, y, eq])
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
        return DiophantineSolution(Int.([x1, y]), Int.([y1, x]), [x, y, eq])
    end
end



