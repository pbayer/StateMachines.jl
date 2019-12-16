# This file is part of the StateMachines.jl Julia package
#
# Paul Bayer
# MIT License
# Github: https://github.com/pbayer/StateMachines.jl
#

"A simple state has no internal vertices or transitions."
abstract type SimpleState <: AbstractState end

"A composite State contains at least one region."
abstract type CompositeState <: AbstractState end

"An orthogonal state is a composite state containing multiple regions."
abstract type OrthogonalState <: CompositeState end

"A submachine State refers to an entire state machine nested within."
abstract type SubmachineState <: AbstractState end

"""
    PseudoState

A Pseudostate is an abstraction for different transient states. A state machine
enters a pseudo state temporarily within a transition to the next stable state.
"""
abstract type PseudoState <: AbstractState end

# define typical simple states

struct Undefined <: SimpleState end
struct Idle <: SimpleState end
struct Setup <: SimpleState end
struct Busy <: SimpleState end
struct Blocked <: SimpleState end
struct Halted <: SimpleState end
struct Empty <: SimpleState end
struct Ready <: SimpleState end
struct Full <: SimpleState end
struct Failed <: SimpleState end
struct Waiting <: SimpleState end
struct InProcess <: SimpleState end

"""
    enter!(A::StateMachine, q::AbstractState)

A default function for entering a state if no more specific `enter!`-function
is defined. If entering a new state it calls the `exit`-action for the current state,
then it calls the `entry`- and `doActivity`-actions for the new state. If the new
state equals the current state, only the `doActivity`-action is executed.
"""
function enter!(A::StateMachine, q::AbstractState)
    if A.state == q
        doActivity(A, A.state)
    else
        exit(A, A.state)
        A.state = q
        entry(A, A.state)
        doActivity(A, A.state)
    end
end

"""
    entry(A::StateMachine, ::AbstractState)

A fallback entry function, doing nothing. The user can implement more specific
`entry`-actions, which are called by a concrete state machine upon entering a
concrete state.
"""
entry(A::StateMachine, ::AbstractState) = nothing

"""
    exit(A::StateMachine, ::AbstractState)

A fallback exit function, doing nothing. The user can implement more specific
`exit`-actions, which are called by a concrete state machine upon exiting a
concrete state.

"""
exit(A::StateMachine, ::AbstractState) = nothing

"""
    doActivity(A::StateMachine, ::AbstractState)

A fallback doActivity function, doing nothing. The user can implement more specific
`doActivity`-actions, which are called by a concrete state machine upon calling a
concrete state.

"""
doActivity(A::StateMachine, ::AbstractState) = nothing
