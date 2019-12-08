# StateMachines.jl

`StateMachines.jl` provides a framework to describe, model and simulate communicating and queueing *systems*. Its components are *processes* or *blocks* of processes interacting via channels. Processes behave as state machines with defined transitions between their states. Through state actions processes can change their environment and communicate with other processes.

`StateMachines.jl` is implemented in Julia, but its framework follows loosely that of the system design language SDL [^1].


## Installation

`StateMachines.jl` is not yet an registered package and is installed with

```
pkg> add("https://github.com/pbayer/StateMachines.jl")
```

**Author:** Paul Bayer
**License:** MIT


[^1]: [SDL](https://en.wikipedia.org/wiki/Specification_and_Description_Language) is maintained by the [SDL-Forum](http://sdl-forum.org/index.htm) and [published](https://www.itu.int/rec/T-REC-Z/en) by the [ITU](https://www.itu.int/) (International Telecommunications Union)
