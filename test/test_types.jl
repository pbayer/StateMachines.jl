# This file is part of the StateMachines.jl Julia package
#
# Paul Bayer
# MIT License
# Github: https://github.com/pbayer/StateMachines.jl
#

c = Clock()
S = System("Sys", c)
B1 = Block("B1", S)

struct SM1 <: StateMachine end

P1 = Process{SM1}("P1", SM1(), B1)

@test P1 isa Process{SM1}
@test StateMachines.clock(P1) === c
