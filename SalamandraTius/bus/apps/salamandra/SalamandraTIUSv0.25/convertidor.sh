#!/bin/bash

resolucion=`/usr/bin/xdpyinfo | grep dimensions | sed -r 's/^[^0-9]*([0-9]+x[0-9]+).*$/\1/'`
convert -resample $resolucion! /etc/bus/apps/salamandra/SalamandraTIUSv0.25/FondoSalamandraTIUSOrig.png /etc/bus/apps/salamandra/SalamandraTIUSv0.25/FondoSalamandraTIUS.png
