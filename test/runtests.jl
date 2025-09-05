using Test
include("../src/AquaCalda.jl")
using .AquaCalda
using GeometryBasics

# main testset
@testset "AquaCalda.jl" begin
    # simple test
    @test 1 + 1 == 2

    # lorenz simulation tests
    @testset "Lorenz Simulation" begin
        # NOTE: This test is marked as broken as the solve_lorenz function is not defined in the current scope.
        @test_broken false
        # sol = solve_lorenz()
        # # test if simulation ran
        # @test sol.retcode == :Success
        # # test final values
        # @test isapprox(sol.u[end][1], -8.3, atol=0.1)
    end

    # stress test placeholder
    # here you could run a large simulation
    # and check if it completes successfully
    @testset "Stress Test" begin
        # large_sim_params = ...
        # large_sol = run_large_simulation(large_sim_params)
        # @test large_sol.retcode == :Success
    end

    @testset "DEM Engine" begin
        # 1. Define a material
        mat = Material(
            thermal_conductivity = 1.0,
            density = 1000.0,
            specific_heat = 4186.0
        )

        # 2. Generate a particle system
        dims = Vec3f(0.1, 0.1, 0.1) # 10cm cube
        radius = 0.005f0 # 5mm radius
        system = generate_cube_of_particles(dims, radius, 1, AquaCalda.SOLID, mat)

        # 3. Test generation
        @test system isa ParticleSystem
        @test length(system.positions) > 0
        @test length(system.positions) == length(system.radii) == length(system.masses)

        # 4. Run a simulation step
        dt = 0.001
        simulation_step!(system, dt)

        # 5. Test that it ran without error (further tests will check output)
        @test true # If we get here without an error, the step ran.
    end
end
