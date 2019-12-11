# StateMachines.jl

`StateMachines.jl` provides a Julia framework to describe, model and simulate communicating and queueing systems. A *system* has different incarnations or levels: 

1. the outer *box* providing a clock and an interface to the environment and containing *blocks* and *processes*.
2. Blocks can be nested and used to construct more and deeper levels.
3. Processes are the basic operating units and behave as *state machines* with defined *transitions* between their *states*. Through their *activities* processes can change their environment and communicate with other processes or blocks via *channels*.

## Installation

`StateMachines.jl` is not yet an registered package and is installed with

```
pkg> add("https://github.com/pbayer/StateMachines.jl")
```

**Author:** Paul Bayer
**License:** MIT
