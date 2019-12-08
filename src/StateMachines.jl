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
include("systems.jl")
include("blocks.jl")
include("states.jl")
include("events.jl")
include("transitions.jl")


export  SEvent, Init, Enter, Load, Switch, Finish, Unload, Leave, Get,
                Fail, Repair, Call, Log, Step, Run, Start, Stop, Resume,
        State,  Undefined, Idle, Setup, Busy, Blocked, Halted, Empty,
                Ready, Full, Failed, Waiting, InProcess
        System, Block, Process, step!

end # module
