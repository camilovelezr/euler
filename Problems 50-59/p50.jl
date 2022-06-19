"""
41 = 2 + 3 + 5 + 7 + 11 + 13
This is the longest sum of consecutive primes that adds to a prime below one-hundred.

Which prime, below one-million, can be written as the sum of the most consecutive primes?
"""

using Primes
using Combinatorics
using IterTools
using ProgressBars
p = primes(2, 10^6)

c = []
# function main(p::Vector{Int})::Tuple{Int, Any}
#     k = []
#     longest = 0
#     Threads.@threads for i in ProgressBar(300:500)
#         for v in IterTools.partition(p, i, 1)
#             (v in c) && continue
#             if (sum(v)<(10^6)) & isprime(sum(v)) 
#                 new_longest = i
#                 (new_longest>longest) && (longest=new_longest)
#                 k = v
#             end
#             push!(c, v)
#         end
#     end
#     return (longest, k)
# end

# function main(col)::Tuple{Int,Vector{Any}}
#     longest = 0
#     k = []
#     l = 1
#     r = length(col)
#     dl = 0
#     dr = 0
#     for n in ProgressBar(l:r)
#         while r - dr - n - dl >= 50
#             s = sum(col[n+dl:r-dr])
#             (s > (10^6)) && continue
#             if isprime(s) & (s > longest)
#                 longest = s
#                 k = col[n+dl:r-dr]
#             end
#             dr += 1
#         end
#     end
#     return (longest, k)
# end











