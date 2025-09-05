module DEM

include("core.jl")
include("generators.jl")
include("simulation.jl")

export ParticleSystem, Material, PointOfInterest, ParticlePhase, generate_cube_of_particles, simulation_step!

end
