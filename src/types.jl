# This file is part of the StateMachines.jl Julia package
#
# Paul Bayer
# MIT License
# Github: https://github.com/pbayer/Models.jl
#

"""
    Id

An identifier used to identify and to register system components.
"""
const Id = AbstractString

"An common supertype for `Box`, `Block` and `StateMachine`."
abstract type System end

"""
    Model

An abstract type used to declare the types of state machines, you want to implement.

# Example
```julia
using StateMachines, Simulate

struct M1 <: Model end               # define the models
struct M2 <: Model end

S1 = Box("Box", 𝐶)                   # define their environment,
B1 = Block("B1", S1)                 # maybe containing one or more blocks

SM1 = StateMachine("SM1", M1(), B1)  # create state machine variables
SM2 = StateMachine("SM2", M2(), B1)

function step!(A::StateMachine{M1}, ::Idle, σ::Load)  # transition functions
    [....]                                            # implement their behaviour
end
function step!(A::StateMachine{M1}, ::Busy, σ::Fail) = [....]
function step!(A::StateMachine{M1}, ::Failed, ::Repair) = [....]
[....]

while true                           # later at runtime ...
    event = put!(SM1.gate[“in”])     # an event is read from an input channel
    step!(SM1, event)                # and a state machine transition is called
end
```
"""
abstract type Model end

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
step!(p::StateMachine, ::Idle, σ::Failure) = [....]  # step! dispatches on a state type
p.state = Idle()                                # a process gets a state instance
step!(p, p.state, Failure(5))                   # step! is called with a state instance
```
"""
abstract type State end


abstract type SEvent end

"""
    Box(id::Id, clk::Clock)

A box is the outermost container of blocks and state machines. It has a clock,
a composite state and one or more input/output channels. It cannot contain other
boxes, but it can interact with other boxes.

# Arguments, Fields
- `id::Id`: an identifier string
- `clk::Clock`: the system clock, this may be a clock shared with other boxes,
- `state::State`:
- `gate::Dict{Id, Channel}`: a dictionary of channels,
- `childs::Dict{Id, System}`: a dictionary of registered blocks or state machines.
"""
mutable struct Box <: System
    id::Id
    clk::Clock
    cstate::State
    gate::Dict{Id, Channel}
    childs::Dict{Id, System}

    Box(id::Id, clk::Clock) =
            new(id, clk, Undefined(), Dict{Id, Channel}(), Dict{Id, System}())
end

"""
    Block(id::Id, surr::System)

A block is a container of blocks and state machines. It has one or more input/output
channels. It registers to a system `Box` or to an higher block. It has a
composite state.

# Arguments, Fields
- `id::Id`: each block in a surrounding has to have an unique identifier,
- `surr::System`: this links to the surrounding system `Block` or `Box`,
- `cstate::State`: a composite state of the underlying system,
- `gate::Dict{Id, Channel}`: a dictionary of channels,
- `childs::Dict{Id, System}`: a dictionary of registered blocks or state machines.
"""
mutable struct Block <: System
    id::Id
    surr::System
    cstate::State
    gate::Dict{Id, Channel}
    childs::Dict{Id, System}

    Block(id::Id, surr::System) =
            new(id, surr, Undefined(), Dict{Id, Channel}(), Dict{Id, System}())
end

"""
    StateMachine{M}(id::Id, m::M, surr::System) where {M <: Model}

A state machine operates a model. It has at least one input/output channel.
It registers to a `Block` or a `System`.

# Arguments, Fields
- `id::Id`: each process in a box or a block has to have an unique identifier,
- `m::M`: a model identifier,
- `cstate::State`: the composite state of the state machine,
- `surr::System`: links to the surrounding `Block` or `System`,
- `gate::Dict{Id, Channel}`: events and tokens flow through the gates, each gate
    has an unique identifier.
- `state::State`: the internal state is used to operate the state machine,
- `var::Dict{Id, Any}`: a dictionary of local variables, each with a unique Id.
- `childs::Dict{Id, System}`: a dictionary of registered sub machines.
"""
mutable struct StateMachine{M <: Model} <: System
    id::Id
    m::M
    cstate::State
    surr::System
    gate::Dict{Id, Channel}
    state::State
    var::Dict{Id, Any}
    childs::Dict{Id, System}

    StateMachine{M}(id::Id, m::M, surr::System) where {M <: Model} =
            new(id, m, Undefined(), surr, Dict{Id, Channel}(),
                Undefined(), Dict{Id, Any}(), Dict{Id, System}())

    StateMachine(id::Id, m::Model, surr::System) = StateMachine{typeof(m)}(id, m, surr)
end
