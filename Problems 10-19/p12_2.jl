### A Pluto.jl notebook ###
# v0.19.9

using Markdown
using InteractiveUtils

# ╔═╡ 2c263064-2dab-4f14-82eb-901fab8fb6e4
using Primes

# ╔═╡ 4172f1db-3143-4c9e-b0b1-2795893748d0
using BenchmarkTools

# ╔═╡ c74a25f6-2103-11ed-0a73-731e663ed9a0
# What is the value of the first triangle number to have over five hundred divisors?

# ╔═╡ f6977e24-e9ce-4a7b-81f5-8c524b972d0b
length(factor(22))

# ╔═╡ e951ad0b-de19-4097-9c0f-913cc49f8d56
factor(Dict, 21)

# ╔═╡ cdad27b4-3990-4ec0-aec8-eb56df0853f5
function ndiv(n::Int64)::Int64
	c = Int64(0)
	for x in 1:n
		(n%x == 0) && (c += 1)
	end
	return c
end

# ╔═╡ 8997b748-5389-47cf-ba88-eb26fdef54dd
ndiv(24)

# ╔═╡ 8524c9fe-2fed-44f8-9e9d-2c659462747f
for (x,y) in factor(Dict, 12)
	@show (x,y)
end

# ╔═╡ 101ba8a4-5e89-43ff-b39e-8aa04b34c204
@btime ndiv(2324500)

# ╔═╡ 3d9940ea-c3ef-4b79-b161-138084ed7ca4
t = Iterators.accumulate(+, Iterators.countfrom(1))

# ╔═╡ 591e1644-5133-44d9-9df4-662c86f8e7ad
ndiv(22)

# ╔═╡ 69ab6048-5b60-47f3-b65e-4c9813b4d75d
nd(x::Int64)::Int64 = prod(y[2]+1 for y in factor(Dict, x))

# ╔═╡ 74290b10-4f72-4eec-8b3f-4a314d9af155
@btime nd(243)

# ╔═╡ 35ce70f5-07dc-49bf-8c50-281e6766a10e
@btime first(Iterators.filter(x -> nd(x) > (500), Iterators.filter(>(1), t)))

# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
BenchmarkTools = "6e4b80f9-dd63-53aa-95a3-0cdb28fa8baf"
Primes = "27ebfcd6-29c5-5fa9-bf4b-fb8fc14df3ae"

[compat]
BenchmarkTools = "~1.3.1"
Primes = "~0.5.3"
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

julia_version = "1.8.0-rc1"
manifest_format = "2.0"
project_hash = "9ff7948736e38f30f69a4832fe53359599adb950"

[[deps.Artifacts]]
uuid = "56f22d72-fd6d-98f1-02f0-08ddc0907c33"

[[deps.BenchmarkTools]]
deps = ["JSON", "Logging", "Printf", "Profile", "Statistics", "UUIDs"]
git-tree-sha1 = "4c10eee4af024676200bc7752e536f858c6b8f93"
uuid = "6e4b80f9-dd63-53aa-95a3-0cdb28fa8baf"
version = "1.3.1"

[[deps.CompilerSupportLibraries_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "e66e0078-7015-5450-92f7-15fbd957f2ae"
version = "0.5.2+0"

[[deps.Dates]]
deps = ["Printf"]
uuid = "ade2ca70-3891-5945-98fb-dc099432e06a"

[[deps.IntegerMathUtils]]
git-tree-sha1 = "f366daebdfb079fd1fe4e3d560f99a0c892e15bc"
uuid = "18e54dd8-cb9d-406c-a71d-865a43cbb235"
version = "0.1.0"

[[deps.JSON]]
deps = ["Dates", "Mmap", "Parsers", "Unicode"]
git-tree-sha1 = "3c837543ddb02250ef42f4738347454f95079d4e"
uuid = "682c06a0-de6a-54ab-a142-c8b1cf79cde6"
version = "0.21.3"

[[deps.Libdl]]
uuid = "8f399da3-3557-5675-b5ff-fb832c97cbdb"

[[deps.LinearAlgebra]]
deps = ["Libdl", "libblastrampoline_jll"]
uuid = "37e2e46d-f89d-539d-b4ee-838fcccc9c8e"

[[deps.Logging]]
uuid = "56ddb016-857b-54e1-b83d-db4d58db5568"

[[deps.Mmap]]
uuid = "a63ad114-7e13-5084-954f-fe012c677804"

[[deps.OpenBLAS_jll]]
deps = ["Artifacts", "CompilerSupportLibraries_jll", "Libdl"]
uuid = "4536629a-c528-5b80-bd46-f80d51c5b363"
version = "0.3.20+0"

[[deps.Parsers]]
deps = ["Dates"]
git-tree-sha1 = "0044b23da09b5608b4ecacb4e5e6c6332f833a7e"
uuid = "69de0a69-1ddd-5017-9359-2bf0b02dc9f0"
version = "2.3.2"

[[deps.Primes]]
deps = ["IntegerMathUtils"]
git-tree-sha1 = "311a2aa90a64076ea0fac2ad7492e914e6feeb81"
uuid = "27ebfcd6-29c5-5fa9-bf4b-fb8fc14df3ae"
version = "0.5.3"

[[deps.Printf]]
deps = ["Unicode"]
uuid = "de0858da-6303-5e67-8744-51eddeeeb8d7"

[[deps.Profile]]
deps = ["Printf"]
uuid = "9abbd945-dff8-562f-b5e8-e1ebf5ef1b79"

[[deps.Random]]
deps = ["SHA", "Serialization"]
uuid = "9a3f8284-a2c9-5f02-9a11-845980a1fd5c"

[[deps.SHA]]
uuid = "ea8e919c-243c-51af-8825-aaa63cd721ce"
version = "0.7.0"

[[deps.Serialization]]
uuid = "9e88b42a-f829-5b0c-bbe9-9e923198166b"

[[deps.SparseArrays]]
deps = ["LinearAlgebra", "Random"]
uuid = "2f01184e-e22b-5df5-ae63-d93ebab69eaf"

[[deps.Statistics]]
deps = ["LinearAlgebra", "SparseArrays"]
uuid = "10745b16-79ce-11e8-11f9-7d13ad32a3b2"

[[deps.UUIDs]]
deps = ["Random", "SHA"]
uuid = "cf7118a7-6976-5b1a-9a39-7adc72f591a4"

[[deps.Unicode]]
uuid = "4ec0a83e-493e-50e2-b9ac-8f72acf5a8f5"

[[deps.libblastrampoline_jll]]
deps = ["Artifacts", "Libdl", "OpenBLAS_jll"]
uuid = "8e850b90-86db-534c-a0d3-1478176c7d93"
version = "5.1.0+0"
"""

# ╔═╡ Cell order:
# ╠═c74a25f6-2103-11ed-0a73-731e663ed9a0
# ╠═2c263064-2dab-4f14-82eb-901fab8fb6e4
# ╠═f6977e24-e9ce-4a7b-81f5-8c524b972d0b
# ╠═e951ad0b-de19-4097-9c0f-913cc49f8d56
# ╠═cdad27b4-3990-4ec0-aec8-eb56df0853f5
# ╠═8997b748-5389-47cf-ba88-eb26fdef54dd
# ╠═8524c9fe-2fed-44f8-9e9d-2c659462747f
# ╠═4172f1db-3143-4c9e-b0b1-2795893748d0
# ╠═101ba8a4-5e89-43ff-b39e-8aa04b34c204
# ╠═3d9940ea-c3ef-4b79-b161-138084ed7ca4
# ╠═591e1644-5133-44d9-9df4-662c86f8e7ad
# ╠═69ab6048-5b60-47f3-b65e-4c9813b4d75d
# ╠═74290b10-4f72-4eec-8b3f-4a314d9af155
# ╠═35ce70f5-07dc-49bf-8c50-281e6766a10e
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
