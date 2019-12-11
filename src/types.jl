# This file is part of the StateMachines.jl Julia package
#
# Paul Bayer
# MIT License
# Github: https://github.com/pbayer/StateMachines.jl
#

"""
    Id

An identifier used to identify and to register system components.
"""
const Id = AbstractString

"An abstract type for `Box`, `Block` and `Process`."
abstract type System end

"""
    StateMachine

An abstract type for StateMachines. It is used to declare concrete state machines in
an implementation.

# Example
```julia
using StateMachines, Simulate

struct SM1 <: StateMachine end       # first you declare some state machine types
struct SM2 <: StateMachine end       # you want to use

S1 = Box("Box", 𝐶)                   # then you build a system,
B1 = Block("B1", S1)                 # maybe containing one or more blocks

P1 = Process("P1", SM1(), B1)        # processes inside a block act as state machines
P2 = Process("P2", SM2(), B1)

function step!(A::Process{SM1}, ::Idle, σ::Load)  # transition functions define the
    [....]                                        # activities of a process, maybe
end                                               # using other functions
function step!(A::Process{SM1}, ::Busy, σ::Fail) = [....]
function step!(A::Process{SM1}, ::Failed, ::Repair) = [....]
[....]

while true                           # later at runtime
    event = put!(P1.gate[“in”])      # an event is read from an input channel
    step!(P1, P1.state, event)       # and a process transition is called
end                                  # depending on its state and an incoming event
```
"""
abstract type StateMachine end

"""
    State

An abstract type for states used to define state variables. A state stands for
a characteristic set of activities of a system. A set of state variables describes
the state space of a system. A state machine changes between states according to
events.

States can be shared between different systems. But they may mean different things
for different levels or components of a system since they then stand
for different sets of activities.

A state machine or a system assumes a state instance, but it dispatches along a
state type.

# Examples
```julia
struct Idle <: State end                        # a state type is declared
step!(p::Process, ::Idle, σ::Failure) = [....]  # step! dispatches on a state type
p.state = Idle()                                # a process gets a state instance
step!(p, p.state, Failure(5))                   # step! is called with a state instance
```
"""
abstract type State end


abstract type SEvent end

"""
    Box(id::Id, clk::Clock)

A box is the outermost container of blocks and processes. It has one or more
input channels and one or more output channels. It cannot contain other boxes,
but it can interact with other boxes.

# Arguments, Fields
- `id::Id`: an identifier string
- `clk::Clock`: the system clock, this may be a clock shared with other boxes,
- `state::State`:
- `gate::Dict{Id, Channel}`: a dictionary of channels,
- `childs::Dict{Id, System}`: a dictionary of registered blocks or processes.
"""
mutable struct Box <: System
    id::Id
    clk::Clock
    state::State
    gate::Dict{Id, Channel}
    childs::Dict{Id, System}

    Box(id::Id, clk::Clock) =
            new(id, clk, Undefined(), Dict{Id, Channel}(), Dict{Id, System}())
end

"""
    Block(id::Id, surr::System)

A block is a container of blocks and processes. It has one or more input
and one or more output channels. It registers to a `System`.

# Arguments, Fields
- `id::Id`: each block in a surrounding has to have an unique identifier,
- `surr::System`: this links to the surrounding `Block` or `System`,
- `state::State`:
- `gate::Dict{Id, Channel}`: a dictionary of channels,
- `childs::Dict{Id, System}`: a dictionary of registered agents.
"""
mutable struct Block <: System
    id::Id
    surr::System
    state::State
    gate::Dict{Id, Channel}
    childs::Dict{Id, System}

    Block(id::Id, surr::System) =
            new(id, surr, Undefined(), Dict{Id, Channel}(), Dict{Id, System}())
end

"""
    Process{SM}(id::Id, sm::SM, surr::System) where {SM <: StateMachine}

A process is a container for a state machine. It cannot contain other processes.
It has one input and one output channel. It registers to a `Block` or a `System`.

# Arguments, Fields
- `id::Id`: each process in a box or a block has to have an unique identifier,
- `sm::SM`: a state machine identifier
- `surr::System`: links to the surrounding `Block` or `System`,
- `state::State`: this is read and changed by the process's state machine,
- `gate::Dict{Id, Channel}`: events and tokens flow through the gates, each gate
    has an unique identifier.
"""
mutable struct Process{SM <: StateMachine} <: System
    id::Id
    sm::SM
    surr::System
    state::State
    gate::Dict{Id, Channel}

    Process{SM}(id::Id, sm::SM, surr::System) where {SM <: StateMachine} =
            new(id, sm, surr, Undefined(), Dict{Id, Channel}())

    Process(id::Id, sm, surr::System) = Process{typeof(sm)}(id, sm, surr)
end
