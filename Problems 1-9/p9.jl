"""
There exists exactly one Pythagorean triplet for which a + b + c = 1000.
    Find the product abc.
"""

unique([prod([x, y, z]) for (x, y) in Base.product(1:500, 1:500) for z in 1:500 if ((x^2 + y^2 == z^2) & (x + y + z == 1000))])

"""
julia> @btime unique([prod([x, y, z]) for (x, y) in Base.product(1:500, 1:500) for z in 1:500 if ((x^2 + y^2 == z^2) & (x + y + z == 1000))])
  41.436 ms (11 allocations: 912 bytes)
1-element Vector{Int64}:
 31875000

julia> @time unique([prod([x, y, z]) for (x, y) in Base.product(1:500, 1:500) for z in 1:500 if ((x^2 + y^2 == z^2) & (x + y + z == 1000))])
 0.120871 seconds (296.80 k allocations: 15.262 MiB, 65.11% compilation time)
1-element Vector{Int64}:
31875000
"""
