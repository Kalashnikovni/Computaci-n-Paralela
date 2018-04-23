#!/bin/sh
#
# Inspired on http://gnuplot.sourceforge.net/demo/heatmaps.html
# colormaps: http://t16web.lanl.gov/Kawano/gnuplot/plotpm3d2-e.html
#
gnuplot << EOF
set terminal png small
set output "$1.png"
unset key
set view map
set xlabel "Block size 2^X"
set ylabel "Block size 2^Y"
set title "mtxtrans2.c cycles vs. block size -- $1"
set xtics border in scale 0,0
set ytics border in scale 0,0
set ztics border in scale 0,0
set xrange [ -0.5 : 8.5 ]
set yrange [ -0.5 : 8.5 ]
#set logscale cb 2
set cblabel "cycles"
set palette negative
plot "$1" using 1:2:3 with image
EOF

#set palette rgbformulae -7, -5, -15
