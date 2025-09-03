# file: src/Geometry/shapes.jl

# abstract type for all shapes
abstract type Shape end

# a sphere shape
# this will be the basic building block for our simulations
struct Sphere{T<:AbstractFloat} <: Shape
    radius::T
    position::Vector{T}
    velocity::Vector{T}
end
