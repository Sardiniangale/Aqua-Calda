using Test
include("../src/AquaCalda.jl")
using .AquaCalda

# main testset
@testset "AquaCalda.jl" begin
    # simple test
    @test 1 + 1 == 2

    # lorenz simulation tests
    @testset "Lorenz Simulation" begin
        sol = solve_lorenz()
        # test if simulation ran
        @test sol.retcode == :Success
        # test final values
        @test isapprox(sol.u[end][1], -8.3, atol=0.1)
    end

    # stress test placeholder
    # here you could run a large simulation
    # and check if it completes successfully
    @testset "Stress Test" begin
        # large_sim_params = ...
        # large_sol = run_large_simulation(large_sim_params)
        # @test large_sol.retcode == :Success
    end
end
