# This file is part of the StateMachines.jl Julia package
#
# Paul Bayer
# MIT License
# Github: https://github.com/pbayer/StateMachines.jl
#

c = Clock()
S1 = Box("S1", c)
B1 = Block("B1", S1)

struct SM1 <: StateMachine end

P1 = Process{SM1}("P1", SM1(), B1)
P2 = Process("P2", SM1(), B1)

@test P1 isa Process{SM1}
@test P2 isa Process{SM1}
@test StateMachines.clock(P1) === c
