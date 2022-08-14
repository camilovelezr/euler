using Combinatorics
using LinearAlgebra

m1 = transpose(reshape(1:(21^2), (21, 21)))

nl = 1:441
ps = Iterators.filter(x -> first(x) == 1, permutations(nl, 40))
ps = Iterators.filter(x -> last(x) == 441, ps)
_h(t::Tuple) = ((abs(-(t...)) == 1) | (abs(-(t...)) == 21)) ? true : false
ps = Iterators.filter(x -> (x[2] == 2) | (x[2] == 22), ps)
divisible(x::Int, y::Int) = isinteger(y / x)

function _d(itr)::Bool
    for (k, v) in Iterators.enumerate(itr)
        if divisible(23, v)
            (itr[k+1] == v + 1) && return false
        end
    end
    return true
end

ps1 = Iterators.filter(_d, ps)


# function f1(itr)
#     i = 3
#     while i <= 40
#         if divisible(23, itr[i])
#             ((itr[i+1] - itr[i]) != 21) && return false
#         else
#             !(_h((itr[i], itr[i+1]))) && return false
#         end
#         i += 1
#     end
#     return true
# end

# Iterators.peel(Iterators.filter(f1, ps))
function f2(itr)
    i = 3
    x = 3
    y = 23
end
