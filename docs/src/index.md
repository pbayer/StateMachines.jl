# StateMachines.jl

`StateMachines.jl` provides a practical way to describe, model and simulate communicating and queueing systems  in Julia.

A [`System`](@ref) has different representations or levels:

1. The outer [`Box`](@ref) provides a clock and an interface to the environment and
  contains *blocks* and *processes*.
2. A [Block`](@ref) can be nested and used to construct more and deeper system levels.
  It contains blocks and processes.
3. A [`StateMachine`](@ref) is used to implement the behaviour of a [`Model`](@ref)
  with defined *transitions* between *states*. Through *actions* state machines change
  their environment and communicate with other processes or blocks via *channels*.

## Installation

`StateMachines.jl` is not yet an registered package and is installed with

```
pkg> add("https://github.com/pbayer/StateMachines.jl")
```

**Author:** Paul Bayer
**License:** MIT
