# This file is part of the StateMachines.jl Julia package
#
# Paul Bayer
# MIT License
# Github: https://github.com/pbayer/StateMachines.jl
#

# define typical states

struct Undefined <: State end
struct Idle <: State end
struct Setup <: State end
struct Busy <: State end
struct Blocked <: State end
struct Halted <: State end
struct Empty <: State end
struct Ready <: State end
struct Full <: State end
struct Failed <: State end
struct Waiting <: State end
struct InProcess <: State end