# This file is part of the StateMachines.jl Julia package
#
# Paul Bayer
# MIT License
# Github: https://github.com/pbayer/StateMachines.jl
#

"An abstract type used to identify system components"
abstract type System end

"""
    Id

An identifier used to identify and to register system components.
"""
const Id = AbstractString

"""
    Behavior

Behavior differentiates state machines and is needed to correctly 
dispatch on them.

# Example
```julia
using StateMachines, Simulate

struct B1 <: Behavior end               # define the behaviors
struct B2 <: Behavior end

SM1 = StateMachine("SM1", B1())         # create state machine variables with
SM2 = StateMachine("SM2", B2())         # specified behaviors and suroundings

function step!(A::StateMachine{B1}, ::Idle, σ::Load)  # transition functions
    [....]                                            # implement the behaviour
end
function step!(A::StateMachine{B1}, ::Busy, σ::Fail) = [....]
function step!(A::StateMachine{B1}, ::Failed, ::Repair) = [....]
[....]

while true                             # later at runtime ...
    event = put!(SM1.gate[“in”])       # an event is read from an input channel
    step!(SM1, event)                  # and a state machine transition is called
end
```
"""
abstract type Behavior end

"""
    AbstractState

A supertype to different state types. A state stands for a characteristic set of 
activities of a state machine. A set of states describes the state space of a state 
machine. An event may cause a state machine to change its state.

State types can be shared between different state machines. But they may mean 
different things since they stand for different activities.

There are different subtypes of `AbstractState`: 
- [`SimpleState`](@ref),
- [`CompositeState`](@ref) and [`OrthogonalState`](@ref),
- [`SubmachineState`](@ref) and
- [`PseudoState`](@ref)
"""
abstract type AbstractState end

abstract type AbstractEvent end

"""
```
StateMachine{B}(id::Id, b::B) where {B <: Behavior}
StateMachine(id::Id, b::Behavior)
```

A state machine implements a [`Behavior`](@ref). 
It can register to a [complex state](@ref AbstractState) in another state machine.

# Arguments, Fields
- `id::Id`: each process in a box or a block has to have an unique identifier,
- `m::M`: a model identifier,
- `env::Union{AbstractState, Nothing}`: links to the surrounding complex state,
- `gate::Dict{Id, Channel}`: events and tokens flow through the gates, each gate
    has an unique identifier.
- `state::AbstractState`: used to operate the state machine,
- `var::Dict{Id, Any}`: a dictionary of local variables, each with a unique Id.
"""
mutable struct StateMachine{B <: Behavior} <: System
    id::Id
    b::B
    env::Union{AbstractState, Nothing}
    gate::Dict{Id, Channel}
    state::AbstractState
    var::Dict{Id, Any}
    task::Union{Nothing, Task}

    StateMachine{B}(id::Id, b::B) where {B <: Behavior} =
            new(id, b, nothing, Dict{Id, Channel}(),
                Undefined(), Dict{Id, Any}(), nothing)

    StateMachine(id::Id, b::Behavior) = StateMachine{typeof(b)}(id, b)
end
