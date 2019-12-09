# This file is part of the StateMachines.jl Julia package
#
# Paul Bayer
# MIT License
# Github: https://github.com/pbayer/StateMachines.jl
#

"""
    Id

An agent identifier, used to identify and to register agents.
"""
const Id = AbstractString

"An abstract type for `System`, `Block` and `Process`."
abstract type Agent end
abstract type StateMachine end
abstract type State end
abstract type SEvent end

"""
    System(id::Id, clk::Clock)

A system is the outermost container of blocks and processes. It has one or more
input channels and one or more output channels. It cannot contain other systems,
but it can interact with other systems.

# Arguments, Fields
- `id::Id`: an identifier string
- `clk::Clock`: the system clock, this may be a clock shared with other systems,
- `state::State`:
- `gate::Dict{Id, Channel}`: a dictionary of channels,
- `childs::Dict{Id, Agent}`: a dictionary of registered blocks or processes.
"""
mutable struct System <: Agent
    id::Id
    clk::Clock
    state::State
    gate::Dict{Id, Channel}
    childs::Dict{Id, Agent}

    System(id::Id, clk::Clock) =
            new(id, clk, Undefined(), Dict{Id, Channel}(), Dict{Id, Agent}())
end

"""
    Block(id::Id, surr::Agent)

A block is a container of blocks and processes. It has one or more input
and one or more output channels. It registers to a `System`.

# Arguments, Fields
- `id::Id`: each block in a surrounding has to have an unique identifier,
- `surr::Agent`: this links to the surrounding `Block` or `System`,
- `state::State`:
- `gate::Dict{Id, Channel}`: a dictionary of channels,
- `childs::Dict{Id, Agent}`: a dictionary of registered agents.
"""
mutable struct Block <: Agent
    id::Id
    surr::Agent
    state::State
    gate::Dict{Id, Channel}
    childs::Dict{Id, Agent}

    Block(id::Id, surr::Agent) =
            new(id, surr, Undefined(), Dict{Id, Channel}(), Dict{Id, Agent}())
end

"""
    Process{T}(id::Id, sm::T, surr::Agent) where {T <: StateMachine}

A process is a container for a state machine. It cannot contain other processes.
It has one input and one output channel. It registers to a `Block` or a `System`.

# Arguments, Fields
- `id::Id`: each process in a surrounding has to have an unique identifier,
- `surr::Agent`: links to the surrounding `Block` or `System`,
- `state::State`: this is read and changed by the process's state machine,
- `gate::Dict{Id, Channel}`: events and tokens flow through the gates,
"""
mutable struct Process{T <: StateMachine} <: Agent
    id::Id
    sm::T
    surr::Agent
    state::State
    gate::Dict{Id, Channel}

    Process{T}(id::Id, sm::T, surr::Agent) where {T <: StateMachine} =
            new(id, sm, surr, Undefined(), Dict{Id, Channel}())
end
