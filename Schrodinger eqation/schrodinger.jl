using Plots
plotly()
Plots.PlotlyBackend()

#Creating the function
function ψ(x, n, L)
    √(2.0/L) * sin(Float16(n*π*x)/L)
end

#Declare variables feed into the function
L = 20
n = 3
x = 0:0.1:L
y = ψ.(x,n,L)
y_square = y.^2

p1 = plot(x, 
          y,
          w=3,
          label="probability amplitude: ψ(x, $n, $L)",
          xlabel="x",
          ylabel="ψ",
          ylim = (-1, 1)
          );

p2 = plot(x, 
          y_square,
          w=3,
          label="probability distribution: ψ^2(x, $n, $L)", 
          xlabel="x",
          ylabel="ψ^2",
          ylim=(-1, 1)
          );


#display both plots
plot(p1, p2, layout=(1,2), legend=:bottomright, legendfontsize=7)


#Using the Gauss Konrod Integration algorithm
using QuadGK
g(x) = (√(2.0/L)*sin(Float64(n*π*x)/L))^2
integral, err = quadgk(x -> g(x), 0, 20, rtol=1e-5)