#!/bin/bash
PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin
sleep 30
#zenity --info  --no-wrap --text="Usted solo podrá descargar archivos en la carpeta Descarga. Tras apagar el equipo, ésta se borrará. Guarde su información en dispositivos externos o en la nube. Evitará sorpresas" --title="Información al usuario" --display=:0.0

feh -Y --fullscreen -Z -N --info 'echo "Pulsa con el ratón para continuar"' --cycle-once /home/bibliotecario/aviso_1.png /home/bibliotecario/aviso_3.png /home/bibliotecario/aviso_4.png
