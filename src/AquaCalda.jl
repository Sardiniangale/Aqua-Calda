module AquaCalda

# Include and define your sub-modules
include("Geometry/Geometry.jl")
include("DEM/DEM.jl")
include("HeatTransfer/HeatTransfer.jl")

# Use the modules to bring their functions into AquaCalda's namespace
using .Geometry
using .DEM
using .HeatTransfer

# Export the functions you want users to have access to
# export System, step!, Sphere # etc.

end # module
