# This file is part of the StateMachines.jl Julia package
#
# Paul Bayer
# MIT License
# Github: https://github.com/pbayer/StateMachines.jl
#

"""
    StateMachines

A Julia package for state machines following loosely the system design language
[SDL](http://sdl-forum.org/index.htm).

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
include("process.jl")
include("state.jl")
include("event.jl")
include("transition.jl")


export  SEvent,
        State,
        System, Model, StateMachine, Box, Block, step!

end # module
