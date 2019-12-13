# This file is part of the StateMachines.jl Julia package
#
# Paul Bayer
# MIT License
# Github: https://github.com/pbayer/StateMachines.jl
#

"""
    clock(A::StateMachine)::Clock

Returns the system clock of a state machine.
"""
function clock(A::StateMachine)::Clock
    agent = A
    while !isa(agent.surr, Box)
        agent = agent.surr
    end
    return agent.surr.clk
end
