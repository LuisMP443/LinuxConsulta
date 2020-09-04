p#!/bin/bash
# Menu de opciones para configurar equipo segun biblioteca
## ----------------------------------

RUTABASICA=/home/bibliotecario/configura
RUTAREL=/
BIBLIO=
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
 reboot(){
	echo "Se va a reiniciar el equipo"
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

configuraSalamandra(){
	systemctl enable salamandratimer.salamandra
	echo "Salamandra configurado para arrancar en el siguiente arranque"

}
# read input from the keyboard and take a action
# invoke the one() when the user select 1 from the menu option.
# invoke the two() when the user select 2 from the menu option.
# Exit when user the user select 3 form the menu option.
read_options(){
	local choice
	read -p "Selecciona [ 1 - 17] " choice
	case $choice in
		1)   
			RUTAREL=/rectormachado
			BIBLIO="Rector Machado"
			configNav
			reboot
			exit 0;;
		2)    
			RUTAREL=/arquitectura
			BIBLIO="Arquitectura"
			configNav
			reboot
			exit 0;;
		3)    
			RUTAREL=/bellasartes
			BIBLIO="Bellas Artes"
			configNav
			reboot
			exit 0;;
		4)    
			RUTAREL=/centrossalud
			BIBLIO="Centros de la Salud"
			configNav
			configuraSalamandra
			reboot
			exit 0;;
		5)    
			RUTAREL=/comunicacion
			BIBLIO="Comunicacion"
			configNav
			reboot
			exit 0;;
		6)    
			RUTAREL=/ulloa
			BIBLIO="CRAI Ulloa"
			configNav
			reboot
			exit 0;;
		7)    
			RUTAREL=/derecho
			BIBLIO="Derecho y Trabajo"
			configNav
			reboot
			exit 0;;
		8)    
			RUTAREL=/economicas
			BIBLIO="Economicas"
			configNav
			reboot
			exit 0;;
		9)    
			RUTAREL=/educacion
			BIBLIO="Educacion"
			configNav
			reboot
			exit 0;;
		10)    
			RUTAREL=/filosofia
			BIBLIO="Filosofia y Psicologia"
			configNav
			reboot
			exit 0;;
		11)    
			RUTAREL=/humanidades
			BIBLIO="Humanidades"
			configNav
			reboot
			exit 0;;
		12)    
			RUTAREL=/informatica
			BIBLIO="Informatica"
			configNav
			reboot
			exit 0;;
		13)    
			RUTAREL=/ingenieria
			BIBLIO="Ingeniería"
			configNav
			reboot
			exit 0;;
		14)    
			RUTAREL=/agronomos
			BIBLIO="Ingenieria Agronómica"
			configNav
			reboot
			exit 0;;
		15)    
			RUTAREL=/matematicas
			BIBLIO="Matemáticas"
			configNav
			reboot
			exit 0;;
		16)    
			RUTAREL=/politecnica
			BIBLIO="Politécnica"
			configNav
			reboot
			exit 0;;
		17)    
			RUTAREL=/turismo
			BIBLIO="Turismo y Finanzas"
			configNav
			reboot
			exit 0;;
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
done
