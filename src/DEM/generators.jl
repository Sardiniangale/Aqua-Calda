
using UUIDs
using GeometryBasics

using ..DEM: ParticleSystem, ParticlePhase, Material

"""
    generate_cube_of_particles(dims, particle_radius, material_id, phase, material; velocity=Vec3f(0))

Generates a cube of particles arranged in a regular grid.
"""
function generate_cube_of_particles(
    dims::Vec3f,
    particle_radius::Float32,
    material_id::UInt32,
    phase::ParticlePhase,
    material::Material;
    velocity::Vec3f = Vec3f(0),
    temperature::Float32 = 0.0f0
)
    positions = Vector{Point3f}()
    velocities = Vector{Vec3f}()
    radii = Vector{Float32}()
    masses = Vector{Float32}()
    temperatures = Vector{Float32}()
    uuids = Vector{UUID}()
    object_ids = Vector{UInt32}()
    phases = Vector{ParticlePhase}()

    particle_diameter = particle_radius * 2
    
    # Simple grid arrangement
    for z in particle_radius:particle_diameter:dims[3]-particle_radius
        for y in particle_radius:particle_diameter:dims[2]-particle_radius
            for x in particle_radius:particle_diameter:dims[1]-particle_radius
                push!(positions, Point3f(x, y, z))
                push!(velocities, velocity)
                push!(radii, particle_radius)
                
                # mass = density * volume
                mass = material.density * (4/3) * π * particle_radius^3
                push!(masses, mass)

                push!(temperatures, temperature)
                push!(uuids, uuid4())
                push!(object_ids, material_id)
                push!(phases, phase)
            end
        end
    end

    mat_dict = Dict(material_id => material)

    return ParticleSystem(
        positions,
        velocities,
        radii,
        masses,
        temperatures,
        uuids,
        object_ids,
        phases,
        mat_dict
    )
end
