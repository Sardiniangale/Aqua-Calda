using UUIDs
using GeometryBasics # For Point3f, Vec3f etc.

# Enum to define the physical behavior of a particle
@enum ParticlePhase SOLID LIQUID GAS

# The main data structure for the entire simulation
struct ParticleSystem
    # --- Core Kinematics & Geometry (Vary per particle) ---
    positions::Vector{Point3f}
    velocities::Vector{Vec3f}
    radii::Vector{Float32}
    masses::Vector{Float32}

    # --- Thermodynamics (Vary per particle) ---
    temperatures::Vector{Float32}

    # --- Grouping and Identification (Tags) ---
    uuids::Vector{UUID}
    object_ids::Vector{UInt32}
    phases::Vector{ParticlePhase}

    # --- Material Properties ---
    materials::Dict{UInt32, Material}
end

# Material properties
struct Material
    thermal_conductivity::Float64
    density::Float64
    specific_heat::Float64
end

# Point of Interest to query the particle system
struct PointOfInterest
    name::String
    position::Point3f
end
