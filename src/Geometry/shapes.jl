# Defines the geometric and intrinsic properties of objects.

abstract type AbstractParticle end

struct Sphere <: AbstractParticle
    mass::Float64
    radius::Float64
end

# You can define other shapes here later, e.g.:
# struct Cube <: AbstractParticle
#     mass::Float64
#     side_length::Float64
# end
