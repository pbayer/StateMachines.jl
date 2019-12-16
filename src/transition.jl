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

For all specified transitions Δ: Q × Σ → P(Q) of A a `step!`-function has to
be implemented. For unspecified transitions a fallback step function is
called and a warning is generated.

# Arguments
- `A::StateMachine`: a state machine
- `q::AbstractState`: any state ∈ Q
- `σ::AbstractEvent`: any discrete event ∈ Σ
"""
function step!(A::StateMachine, q::AbstractState, σ::AbstractEvent)
    at = ""
    try
        if !isa(A.sim, Number)
            at = "at $(now(A.sim))"
        end
    catch
    end
    name = hasfield(typeof(A), :name) ? A.name : ""
    println(stderr, "Warning: undefined transition $at for ",
            "$name: step!(::$(typeof(A)), ::$(typeof(q)), ::$(typeof(σ)))")
end
