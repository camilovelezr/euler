"""How many pandigital step numbers 
less than 10^40 are there?"""

using IterTools: partition

function pandigital(x::Int)::Bool
    return sum(unique(digits(x))) == 45 # 0 + 1 + ... + 9
end

import Base.-
-(t::Tuple{Int64,Int64}) = abs(t[1] - t[2])
function stepnumber(x::Int)::Bool
    unique(map(-, partition(digits(x), 2, 1))) == [1]
end

function cc(x::Int64)::Bool
    return pandigital(x) & stepnumber(x)
end

# minimum pandigital: 10 digits = 10^9
# length(collect(Iterators.filter(cc, 10^9:10^10)))
using ProgressBars
counter = 0
Threads.@threads for x in ProgressBar(10^9:10^10)
    (cc(x)) && (counter += 1)
end

