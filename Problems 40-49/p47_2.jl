### A Pluto.jl notebook ###
# v0.19.9

using Markdown
using InteractiveUtils

# ╔═╡ 59662e5f-f2f8-4dbd-b566-6402bc9fefbf
using IterTools

# ╔═╡ 8895748b-4c77-489e-975e-e9830671103b
using Primes

# ╔═╡ a6a215b9-a04d-48d8-9361-8b1590d112fd
using BenchmarkTools

# ╔═╡ 19def896-23cf-11ed-3caa-8d94e6cf54f9
function find(n)
    nl = Iterators.countfrom(4)
    nl = Iterators.filter(x -> !(isprime(x)), nl)   
    line = Iterators.filter(x -> (length(factor(x)) == n), nl)
    line = partition(line, n, 1)
    line = Iterators.filter(x->(x==Tuple(x[1]:x[end])), line)
    return nth(line, 1)
end

# ╔═╡ a5a693b9-a11d-4db2-8ce2-b4bb1e664013
@btime find(3)

# ╔═╡ 701a56c6-1535-4394-b2eb-aa3f2abec5c7
foldl(-, [1, 2, 3])

# ╔═╡ ca428785-8f88-4134-97ba-397f0d17bf5e
foldl(-, find(4))

# ╔═╡ 09c5573e-961d-499e-8ead-a87ae79e3ddc
function find2(n)
    nl = Iterators.countfrom(4)
    nl = Iterators.filter(x -> !(isprime(x)), nl)   
    line = Iterators.filter(x -> (length(factor(x)) == n), nl)
    line = partition(line, n, 1)
	line = Iterators.map(x -> sum(-.(x)), line)
	line = Iterators.filter(x -> x==(-1*(n-1)))
    return first(line)
end

# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
BenchmarkTools = "6e4b80f9-dd63-53aa-95a3-0cdb28fa8baf"
IterTools = "c8e1da08-722c-5040-9ed9-7db0dc04731e"
Primes = "27ebfcd6-29c5-5fa9-bf4b-fb8fc14df3ae"

[compat]
BenchmarkTools = "~1.3.1"
IterTools = "~1.4.0"
Primes = "~0.5.3"
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

julia_version = "1.8.0-rc1"
manifest_format = "2.0"
project_hash = "49c4b4fc7bec9b8a6f9cc47d3d7377a992adddc0"

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

[[deps.IterTools]]
git-tree-sha1 = "fa6287a4469f5e048d763df38279ee729fbd44e5"
uuid = "c8e1da08-722c-5040-9ed9-7db0dc04731e"
version = "1.4.0"

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
# ╠═59662e5f-f2f8-4dbd-b566-6402bc9fefbf
# ╠═8895748b-4c77-489e-975e-e9830671103b
# ╠═a6a215b9-a04d-48d8-9361-8b1590d112fd
# ╠═19def896-23cf-11ed-3caa-8d94e6cf54f9
# ╠═a5a693b9-a11d-4db2-8ce2-b4bb1e664013
# ╠═701a56c6-1535-4394-b2eb-aa3f2abec5c7
# ╠═ca428785-8f88-4134-97ba-397f0d17bf5e
# ╠═09c5573e-961d-499e-8ead-a87ae79e3ddc
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
