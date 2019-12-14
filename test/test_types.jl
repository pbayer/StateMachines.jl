# This file is part of the StateMachines.jl Julia package
#
# SMaul Bayer
# MIT License
# Github: https://github.com/pbayer/StateMachines.jl
#

c = Clock()
S1 = Box("S1", c)
Blk1 = Block("Blk1", S1)

struct B1 <: Behavior end

SM1 = StateMachine{B1}("SM1", B1(), Blk1)
SM2 = StateMachine("SM2", B1(), Blk1)

@test SM1 isa StateMachine{B1}
@test SM2 isa StateMachine{B1}
@test StateMachines.clock(SM1) === c
