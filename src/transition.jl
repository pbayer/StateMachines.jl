# This file is part of the StateMachines.jl Julia package
#
# Paul Bayer
# MIT License
# Github: https://github.com/pbayer/StateMachines.jl
#


"""
    step!(A::StateMachine, q::AbstractState, σ::AbstractEvent)

transition function δ causing a state machine A in state q₁ at event σ
to take on a new state q₂.

For all specified transitions of A a `step!(A, q, σ)`-function has to
be implemented. The fallback step function does nothing and is called for all
other calls to `step!(A, q, σ)`.

# Arguments
- `A::StateMachine`: a state machine
- `q::AbstractState`: any state ∈ Q
- `σ::AbstractEvent`: any discrete event ∈ Σ
"""
function step!(A::StateMachine, q::AbstractState, σ::AbstractEvent) 
    trace ? println(stderr, "undefined transition: $(A.id), $(typeof(q)), $(typeof(σ))") : nothing
end
