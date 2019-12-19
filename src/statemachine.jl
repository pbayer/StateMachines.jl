# This file is part of the StateMachines.jl Julia package
#
# Paul Bayer
# MIT License
# Github: https://github.com/pbayer/StateMachines.jl
#

"""
    operate(A::StateMachine, input::Id, output::Id)

Operate a state machine. If needed, create input and output channels.
"""
function operate(A::StateMachine, input::Id, output::Id)
end

"""
    start!(A::StateMachine, input::Id="", output::Id=""; wait4it::Bool=false)

Start a state machine. Eventually setup input and output channels and start a
task operating the state machine.

# Arguments
- `A::StateMachine`:
- `input::Id=""`:
- `output::Id=""`:
- `wait4it::Bool=false`:
"""
function start!(A::StateMachine, input::Id="", output::Id=""; wait4it::Bool=false)
    @assert A.state == Undefined() "unable to start: $(A.id) is in state $(A.state)!"
    if wait4it
        operate(A, input, output)
    else
        A.task = @async operate(A, input, output)
    end
end
