#! /bin/bash

# Instrucciones para instalar Salamandra Junio_2013.

# Generamos el enlace al Daemon en el 'init.d'.
ln -s /etc/bus/apps/salamandra/SalamandraTIUSv0.25/salamandratiusDaemon /etc/init.d/salamandratiusDaemon
update-rc.d salamandratiusDaemon start 99 0 1 2 3 4 5 6 . stop 20 0 1 6 .
