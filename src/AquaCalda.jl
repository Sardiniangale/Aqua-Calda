module AquaCalda

using DifferentialEquations
using Plots

function lorenz!(du, u, p, t)
    du[1] = 10.0 * (u[2] - u[1])
    du[2] = u[1] * (28.0 - u[3]) - u[2]
    du[3] = u[1] * u[2] - (8 / 3) * u[3]
end

function solve_lorenz()
    u0 = [1.0; 0.0; 0.0]
    tspan = (0.0, 100.0)
    prob = ODEProblem(lorenz!, u0, tspan)
    sol = solve(prob)
    return sol
end

function plot_lorenz()
    sol = solve_lorenz()
    plot(sol, vars = (1, 2, 3))
end

end # module
