# This file is part of the StateMachines.jl Julia package
#
# Paul Bayer
# MIT License
# Github: https://github.com/pbayer/StateMachines.jl
#

abstract type MessageEvent <: AbstractEvent end
abstract type ChangeEvent <: AbstractEvent end
abstract type TimeEvent <: AbstractEvent end


# define typical events

"event `Init(info)` with some initialization info"
struct Init <: MessageEvent
    info::Any
end

"event `Enter(job)` with some job (jobs have a field job.duration)"
struct Enter <: MessageEvent
    job::Any
end

struct Load <: MessageEvent end

"event `Switch(to)` for task switching"
struct Switch <: MessageEvent
    to
end

"event for finishing Setup or Busy"
struct Finish <: TimeEvent end

"event for unloading a server"
struct Unload <: TimeEvent end

"event `Leave(job)` for prematurely leaving a buffer"
struct Leave <: MessageEvent
    job::Any
end

struct Get <: TimeEvent end

"event `Fail(ttr)` with ttr: time to repair"
struct Fail <: MessageEvent
    ttr::Float64
end

struct Repair <: TimeEvent end

"event `Call(from, info)` to a state machine with sender and some info."
struct Call <: MessageEvent
    from
    info
end

"event `Log(A::StateMachine, σ::SEvent, info)` for logging "
struct Log <: MessageEvent
    A::StateMachine
    σ::AbstractEvent
    info::Any
end

"event for user interaction"
struct Step <: MessageEvent end

"event `Run(duration)` for user interaction"
struct Run <: MessageEvent
    duration::Float64
end

"event for user interaction"
struct Start <: MessageEvent end

"event for user interaction"
struct Stop <: MessageEvent end

"event for user interaction"
struct Resume <: MessageEvent end
