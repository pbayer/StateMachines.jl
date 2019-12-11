using StateMachines, Simulate
using Test

println("...... testing StateMachines.jl ......")
@testset "types.jl" begin
    include("test_types.jl")
end

@testset "box.jl" begin
    include("test_box.jl")
end

@testset "block.jl" begin
    include("test_block.jl")
end

@testset "state.jl" begin
    include("test_state.jl")
end

@testset "event.jl" begin
    include("test_event.jl")
end

@testset "transition.jl" begin
    include("test_transition.jl")
end
