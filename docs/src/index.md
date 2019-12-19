# StateMachines.jl

a framework for state machines in Julia. It supports:

- hierarchical state machines (HSM) as described by [UML statecharts](https://en.wikipedia.org/wiki/UML_state_machine),
- but also [precursor state diagrams](https://en.wikipedia.org/wiki/State_diagram) like Harel statecharts or Moore and Mealy machines

With it reactive systems like communication or queueing systems can be modeled
and implemented.

## Installation

`StateMachines.jl` is not yet an registered package and is installed with

```
pkg> add("https://github.com/pbayer/StateMachines.jl")
```

**Author:** Paul Bayer
**License:** MIT
