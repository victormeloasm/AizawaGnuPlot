# Aizawa attractor parameters
a = 0.95
b = 0.7
c = 0.6
d = 3.5
e = 0.25
f = 0.1

# Aizawa attractor differential equations
dx(x, y, z) = (z - b) * x - d * y
dy(x, y, z) = d * x + (z - b) * y
dz(x, y, z) = c + a * z - (z**3) / 3.0 - (x**2 + y**2) * (1 + e * z) + f * z * x**3

# Parameters for numerical integration
x0 = 0.1
y0 = 0.1
z0 = 0.1
dt = 0.01
n = 10000

# Generate data points and save to .dat file
set print 'aizawa.dat'
do for [i=1:n] {
    x0 = x0 + dt * dx(x0, y0, z0)
    y0 = y0 + dt * dy(x0, y0, z0)
    z0 = z0 + dt * dz(x0, y0, z0)
    print sprintf('%f %f %f', x0, y0, z0)
}
set print

# Plot the generated data using Gnuplot
set size square
set view equal xyz
set xrange [-20:20]
set yrange [-20:20]
set zrange [-10:30]
set xlabel 'X'
set ylabel 'Y'
set zlabel 'Z'
splot 'aizawa.dat' with points pt 1 lc variable
