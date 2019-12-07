# StateMachines.jl

`StateMachines.jl` provides a framework to describe, model and simulate communicating and queueing *systems*. Its components are *processes* or *blocks* of processes interacting via channels. Processes behave as state machines with defined transitions between their states. Through state actions processes can change their environment e.g. by doing calculations or communicating with other processes.

`StateMachines.jl` follows loosely the system design language [SDL](http://sdl-forum.org/index.htm).


## Installation

`StateMachines.jl` is not yet an registered package and is installed with

```
pkg> add("https://github.com/pbayer/StateMachines.jl")
```

**Author:** Paul Bayer
**License:** MIT
