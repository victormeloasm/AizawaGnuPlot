set size square
set view 60, 30
set xrange [-15:15]
set yrange [-15:15]
set zrange [-5:25]
splot 'aizawa.dat' with points pt 1 lc variable
pause -1