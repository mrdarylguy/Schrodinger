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

p1 = (x, 
      y,
      w=3,
      label="probability amplitude: ψ(x, $n, $L)",
      xlabel="x",
      ylabel="ψ",
      ylim = (-1, 1)
)

p2 = (x, 
      y.^2,
      w=3,
      label="probability distribution: ψ^2(x, $n, $L)",
      xlabel="x",
      ylabel="ψ^2",
      ylim=(-1, 1)
)
