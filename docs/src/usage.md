# User guide

```@meta
CurrentModule = StateMachines
```

## Installation

`StateMachines.jl` can be – once it is registered – installed with
```julia
pkg> add StateMachines
```

`The development version is installed with
```julia
pkg> add("https://github.com/pbayer/StateMachines.jl")
```

The package is then loaded with

```@repl usage
using StateMachines
```

## System description

A system has different levels, which are used to hide complexity.

```@docs
System
Box
Block
```

`StateMachine` and `Process` are used to describe the activities of a system:
```@docs
StateMachine
Process
```

## State machines

### States
```@docs
```

### Events
```@docs
```

### Transitions
```@docs
```

### Operation
```@docs
```
