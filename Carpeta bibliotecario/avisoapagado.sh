#!/bin/bash
PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin
#zenity --info  --text="Este equipo se apagará en 5 minutos. Por favor, guarde sus datos en dispositivos externos o en la nube" --title="Información al usuario" --no-wrap --display=:0.0
feh -Y --fullscreen -Z -N --info 'echo "Pulsa con el ratón para continuar"' --cycle-once /home/bibliotecario/sleepingmonitorbg.png
