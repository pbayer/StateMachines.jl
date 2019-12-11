# A framework for state machines

State machines can be used to describe or implement discrete event systems. `Julia` with its [multiple dispatch system](https://docs.julialang.org/en/v1/manual/methods/#Methods-1) is particularly practical in this regard. `StateMachines.jl` provides a framework to allow a straightforward implementation of interacting state machines.

## Systems

In order to avoid confusion with the fuzzy meaning of the word "system", we declare
[`System`](@ref) as an abstract type used for different things and take a [`Box`](@ref)
as the outermost boundary of the system we interact with. A box contains blocks and
processes.

## Blocks

A [`Block`](@ref) is a container of other blocks and processes and resides inside a
`Box` or another `Block`. It is used to hide complexity of interacting processes to the outside by providing only the needed gates as a simple interface.

## Processes and state machines
