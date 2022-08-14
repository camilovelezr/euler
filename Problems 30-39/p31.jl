using JuMP
# using HiGHS
using Clp
"""Define the functions"""
P(x::Int64)::Int64 = x * (3x - 1) / 2
P(x::UnitRange)::Base.Generator = (P(x) for x in x)

model = Model(Clp.Optimizer)
@variable(model, j[P(1:50)])
@variable(model, k[P(1:50)])
@variable(model, n[1:100])
@constraint(model, sum(j + k) == 200)

@show model
solution_summary(model)
@show termination_status(model)
@show objective_value(model)