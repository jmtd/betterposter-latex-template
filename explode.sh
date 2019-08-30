#!/bin/bash
set -u
set -e
set -o pipefail

# explodes the A1 landscape PDF into 8 A4 pages.

# shrinks the whole thing down to 1 A4 landscape:
# convert example.pdf -page  842x595 out.pdf 
# 842x595 is A4, landscape

# default imagemagick density is 72ppi

# example.pdf PDF 2384x1684 2384x1684+0+0 16-bit sRGB 217284B 0.000u 0:00.000


for w in 0 1 2 3; do
    for h in 0 1; do
        x=$((w * 596))
        y=$((h * 842))
        echo convert \
            -units PixelsPerInch \
            -crop  595x842+$x+$y \
            -page A4 \
            example.pdf \
            out$w$h.pdf
    done
done

x=0
y=842
w=zomg
h=lol
crop=595x842+$x+$y

echo $crop
convert \
    -units PixelsPerInch \
    -crop  $crop \
    -page A4 \
    example.pdf \
    out$w$h.pdf



#-define pdf:use-trimbox=true 
#or
#-define pdf:use-cropbox=true
