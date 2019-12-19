# This file is part of the StateMachines.jl Julia package
#
# Paul Bayer
# MIT License
# Github: https://github.com/pbayer/StateMachines.jl
#

"""
    StateMachines

A Julia package for state machines.

It can (after registration) be installed with:
```julia
] add StateMachines
```

The development version can be installed with:
```julia
] add("https://github.com/pbayer/StateMachines.jl")
```
"""
module StateMachines

using Simulate

include("types.jl")
include("box.jl")
include("block.jl")
include("statemachine.jl")
include("state.jl")
include("event.jl")
include("transition.jl")
include("action.jl")


export  AbstractEvent, MessageEvent, ChangeEvent, TimeEvent,
        AbstractState, SimpleState, CompositeState, OrthogonalState,
        SubmachineState, PseudoState,
        System, Behavior, StateMachine, step!

"""
    trace

a module variable used for debugging state machines. 
Set `StateMachines.trace = true` if you want to have messages for
undefined transitions.
"""
trace = false

end # module
