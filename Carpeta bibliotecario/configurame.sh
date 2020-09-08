#!/bin/bash
# Menu de opciones para configurar equipo segun biblioteca
## ----------------------------------

RUTABASICA=/home/bibliotecario/configura
RUTAREL=/
BIBLIO=
SALAMANDRA=FALSE;
# ----------------------------------
# Step #2: User defined function
# ----------------------------------
pause(){
  read -p "Presiona [Enter] para continuar" fackEnterKey
}

 
# do something in two()
configNav(){
	echo "Instalando fichero configuracion Firefox para $BIBLIO"
	echo "Ruta-> $RUTABASICA$RUTAREL/prefs.js"
	cp ${RUTABASICA}${RUTAREL}/prefs.js /home/usuario/.mozilla/firefox/17c9tqu5.default
	chown usuario:usuario /home/usuario/.mozilla/firefox/17c9tqu5.default/prefs.js
	chmod 400 /home/usuario/.mozilla/firefox/17c9tqu5.default/prefs.js
	echo "Cambiado archivo configuracion Mozilla Firefox"
	chattr -i /home/usuario/.local/share/applications/google-chrome.desktop
	cp $RUTABASICA$RUTAREL/google-chrome.desktop /home/usuario/.local/share/applications/google-chrome.desktop
	chown usuario:usuario /home/usuario/.local/share/applications/google-chrome.desktop
	chmod 555 /home/usuario/.local/share/applications/google-chrome.desktop
	chattr +i /home/usuario/.local/share/applications/google-chrome.desktop 

	chattr -i /home/usuario/Escritorio/google-chrome.desktop
	cp $RUTABASICA$RUTAREL/google-chrome.desktop /home/usuario/Escritorio
	chown usuario:usuario /home/usuario/Escritorio/google-chrome.desktop
	chmod 555 /home/usuario/Escritorio/google-chrome.desktop
	chattr +i /home/usuario/Escritorio/google-chrome.desktop 
	echo "Cambiado lanzador de Google Chrome"
	pause
}
 rebooting(){
	echo "Se va a reiniciar el equipo"
	reboot
	pause
}
# function to display menus
show_menus() {
	clear
	echo "~~~~~~~~~~~~~~~~~~~~~"	
	echo " C O N F I G U R A M E"
	echo "~~~~~~~~~~~~~~~~~~~~~"
	echo "Selecciona la biblioteca a la que va dirigida esta imagen"
	echo "~~~~~~~~~~~~~~~~~~~~~"
	echo " 1. Rector Machado (Fondo Antiguo y Archivo)"
	echo " 2. Arquitectura"
	echo " 3. Bellas Artes"
	echo " 4. Centros de la Salud"
	echo " 5. Comunicacion"
	echo " 6. CRAI Ulloa"
	echo " 7. Derecho y trabajo"
	echo " 8. Economicas"
	echo " 9. Educacion"
	echo "10. Filosofía y Psicología"
	echo "11. Humanidades"
	echo "12. Informática"
	echo "13. Ingeniería"
	echo "14. Ingeniería Agronómica"
	echo "15. Matematicas"
	echo "16. Politécnica"
	echo "17. Turismo y Finanzas"
}

show_menus2(){
	echo "~~~~~~~~~~~~~~~~~~~~~"	
	echo ""	
	echo "¿Encender salamandra?"
	echo "~~~~~~~~~~~~~~~~~~~~~"
	echo "1 - Si"
	echo "2 - No"
}
configuraSalamandra(){
	cp /etc/bus/apps/salamandra/SalamandraTIUSv.025/salamandra.service /etc/systemd/system/salamandra.service
	systemctl enable salamandra
	rm -f /home/bibliotecario/avisoencendido.sh
	echo "Salamandra configurado para arrancar en el siguiente arranque"

}
apagaSalamandra(){
	systemctl disable salamandra
	cp /home/bibliotecario/configura/avisoencendido.sh /home/bibliotecario/avisoencendido.sh
	echo "Salamandra desactivado"
}
# read input from the keyboard and take a action
# invoke the one() when the user select 1 from the menu option.
# invoke the two() when the user select 2 from the menu option.
# Exit when user the user select 3 form the menu option.

read_optionsalamandra(){
	local choice
	read -p "Selecciona [ 1 - 2] " choice
	case $choice in
		1)   
			configuraSalamandra
			rebooting
			;;
		2)    
			apagaSalamandra
			;;
		*) 
			echo -e "Opcion no contemplada" && sleep 2
			;;
	esac
}
read_options(){
	local choice
	read -p "Selecciona [ 1 - 17] " choice
	case $choice in
		1)   
			RUTAREL=/rectormachado
			BIBLIO="Rector Machado"
			configNav
			;;
		2)    
			RUTAREL=/arquitectura
			BIBLIO="Arquitectura"
			configNav
			;;
		3)    
			RUTAREL=/bellasartes
			BIBLIO="Bellas Artes"
			configNav
			;;
		4)    
			RUTAREL=/centrossalud
			BIBLIO="Centros de la Salud"
			configNav
			;;
		5)    
			RUTAREL=/comunicacion
			BIBLIO="Comunicacion"
			configNav
			;;
		6)    
			RUTAREL=/ulloa
			BIBLIO="CRAI Ulloa"
			configNav
			;;
		7)    
			RUTAREL=/derecho
			BIBLIO="Derecho y Trabajo"
			configNav
			;;
		8)    
			RUTAREL=/economicas
			BIBLIO="Economicas"
			configNav
			;;
		9)    
			RUTAREL=/educacion
			BIBLIO="Educacion"
			configNav
			;;
		10)    
			RUTAREL=/filosofia
			BIBLIO="Filosofia y Psicologia"
			configNav
			;;
		11)    
			RUTAREL=/humanidades
			BIBLIO="Humanidades"
			configNav
			;;
		12)    
			RUTAREL=/informatica
			BIBLIO="Informatica"
			configNav
			;;
		13)    
			RUTAREL=/ingenieria
			BIBLIO="Ingeniería"
			configNav
			;;
		14)    
			RUTAREL=/agronomos
			BIBLIO="Ingenieria Agronómica"
			configNav
			;;
		15)    
			RUTAREL=/matematicas
			BIBLIO="Matemáticas"
			configNav
			;;
		16)    
			RUTAREL=/politecnica
			BIBLIO="Politécnica"
			configNav
			;;
		17)    
			RUTAREL=/turismo
			BIBLIO="Turismo y Finanzas"
			configNav
			;;
		*) echo -e "Opcion no contemplada" && sleep 2
	esac
}
 
# ----------------------------------------------
# Step #3: Trap CTRL+C, CTRL+Z and quit singles
# ----------------------------------------------
trap '' SIGINT SIGQUIT SIGTSTP
 
# -----------------------------------
# Step #4: Main logic - infinite loop
# ------------------------------------
while true
do
 
	show_menus
	read_options
	show_menus2
	read_optionsalamandra
	exit 0
done
