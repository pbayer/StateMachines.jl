# This file is part of the StateMachines.jl Julia package
#
# Paul Bayer
# MIT License
# Github: https://github.com/pbayer/StateMachines.jl
#

"""
    clock(p::Process)::Clock

Returns the system clock of a process
"""
function clock(p::Process)::Clock
    agent = p
    while !isa(agent.surr, System)
        agent = agent.surr
    end
    return agent.surr.clk
end
