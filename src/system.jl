# This file is part of the StateMachines.jl Julia package
#
# Paul Bayer
# MIT License
# Github: https://github.com/pbayer/StateMachines.jl
#

"""
    isConsistent

Check if a system (including all of its subsystems) is consistent.
"""
function isConsistent(S::System)::Bool
    # a system must have registered blocks or processes
    # each of its input channels must be connected to a block or a process
    return false
end
