# This file is part of the StateMachines.jl Julia package
#
# Paul Bayer
# MIT License
# Github: https://github.com/pbayer/StateMachines.jl
#

# define typical events

"event `Init(info)` with some initialization info"
struct Init <: DEvent
    info::Any
end

"event `Enter(job)` with some job (jobs have a field job.duration)"
struct Enter <: DEvent
    job::Any
end

struct Load <: DEvent end

"event `Switch(to)` for task switching"
struct Switch <: DEvent
    to
end

"event for finishing Setup or Busy"
struct Finish <: DEvent end

"event for unloading a server"
struct Unload <: DEvent end

"event `Leave(job)` for prematurely leaving a buffer"
struct Leave <: DEvent
    job::Any
end

struct Get <: DEvent end

"event `Fail(ttr)` with ttr: time to repair"
struct Fail <: DEvent
    ttr::Float64
end

struct Repair <: DEvent end

"event `Call(from, info)` to a state machine with sender and some info."
struct Call <: DEvent
    from
    info
end

"event `Log(A::StateMachine,σ::DEvent,info)` for logging "
struct Log <: DEvent
    A::StateMachine
    σ::DEvent
    info::Any
end

"event for user interaction"
struct Step <: DEvent end

"event `Run(duration)` for user interaction"
struct Run <: DEvent
    duration::Float64
end

"event for user interaction"
struct Start <: DEvent end

"event for user interaction"
struct Stop <: DEvent end

"event for user interaction"
struct Resume <: DEvent end
