module AquaCalda

# sub modules
include("Geometry/Geometry.jl")
include("DEM/DEM.jl")
include("HeatTransfer/HeatTransfer.jl")

# module use to namespace
using .Geometry
using .DEM
using .HeatTransfer

# exp func
export ParticleSystem, Material, PointOfInterest, ParticlePhase

end # module
