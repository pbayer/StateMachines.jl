# A framework for state machines

State machines can be used to describe or implement discrete event systems. `Julia` with its [multiple dispatch system](https://docs.julialang.org/en/v1/manual/methods/#Methods-1) is particularly practical in this regard. `StateMachines.jl` provides a framework to allow a straightforward implementation of interacting state machines.

![UML class diagram](images/SM_classes.svg)

## System

A [`System`](@ref) is an abstract type used to describe entities.

## State machine

A [`StateMachine`](@ref) is the basic operating unit. It has a state variable and reacts to events through a state transition. Thereby it implements the [`Behavior`](@ref) of a system.

### State
> A State models a situation in the execution of a StateMachine Behavior during
> which some invariant condition holds. \
> (UML 2.5 14.2.3.4)

- **simple**:
- **composite**: a simple composite state contains one region. A state machine implements the associated behaviour.  
- **orthogonal**: this is a composite state containing multiple regions.
- **submachine**: a submachine state instantiates a state machine
- **pseudostate**: this is a transient state between two stable states
  - initial
  - deep history
  - shallow history
  - join
  - fork
  - junction
  - choice
  - entry point
  - exit point
  - terminate

#### State actions

enter!, entry, doit, exit

### Event
> An Event is the specification of some occurrence that may potentially trigger
> behavioral effects. \
> (UML 2.5 13.3.3.1)

- message
- change → change variable, conditional event
- time

### Transition
- external
- internal
- local
- compound transition → involving submachines, regions …

### Action
