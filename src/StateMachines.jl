module StateMachines

abstract type StateMachine end
abstract type State end
abstract type DEvent end
abstract type Work end

"""
    step!(A::StateMachine, q::State, σ::DEvent)

transition function δ causing a state machine A in state q₁ at event σ
to take on a new state q₂.

For all specified transitions Δ: Q × Σ → P(Q) of A a `step!`-function has to
be implemented. For unspecified transitions a fallback step function is
called and a warning is generated.

# Arguments
- `A::StateMachine`: a state machine
- `q::State`: any state ∈ Q
- `σ::DEvent`: any discrete event ∈ Σ
"""
function step!(A::StateMachine, q::State, σ::DEvent)
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

export DEvent, State, StateMachine, step!

end # module
