# This file is part of the StateMachines.jl Julia package
#
# Paul Bayer
# MIT License
# Github: https://github.com/pbayer/StateMachines.jl
#

# define typical events

"event `Init(info)` with some initialization info"
struct Init <: SEvent
    info::Any
end

"event `Enter(job)` with some job (jobs have a field job.duration)"
struct Enter <: SEvent
    job::Any
end

struct Load <: SEvent end

"event `Switch(to)` for task switching"
struct Switch <: SEvent
    to
end

"event for finishing Setup or Busy"
struct Finish <: SEvent end

"event for unloading a server"
struct Unload <: SEvent end

"event `Leave(job)` for prematurely leaving a buffer"
struct Leave <: SEvent
    job::Any
end

struct Get <: SEvent end

"event `Fail(ttr)` with ttr: time to repair"
struct Fail <: SEvent
    ttr::Float64
end

struct Repair <: SEvent end

"event `Call(from, info)` to a state machine with sender and some info."
struct Call <: SEvent
    from
    info
end

"event `Log(A::Process, σ::SEvent, info)` for logging "
struct Log <: SEvent
    A::Process
    σ::SEvent
    info::Any
end

"event for user interaction"
struct Step <: SEvent end

"event `Run(duration)` for user interaction"
struct Run <: SEvent
    duration::Float64
end

"event for user interaction"
struct Start <: SEvent end

"event for user interaction"
struct Stop <: SEvent end

"event for user interaction"
struct Resume <: SEvent end
