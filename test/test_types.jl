# This file is part of the StateMachines.jl Julia package
#
# SMaul Bayer
# MIT License
# Github: https://github.com/pbayer/StateMachines.jl
#

c = Clock()
S1 = Box("S1", c)
B1 = Block("B1", S1)

struct M1 <: Model end

SM1 = StateMachine{M1}("SM1", M1(), B1)
SM2 = StateMachine("SM2", M1(), B1)

@test SM1 isa StateMachine{M1}
@test SM2 isa StateMachine{M1}
@test StateMachines.clock(SM1) === c
