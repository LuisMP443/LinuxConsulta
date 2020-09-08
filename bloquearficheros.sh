#!/bin/bash
# Menu de opciones para configurar equipo segun biblioteca
## ----------------------------------

RUTAUSUARIO=/home/usuario

# ----------------------------------
# Step #2: User defined function
# ----------------------------------
pause(){
  read -p "Presiona [Enter] para continuar" fackEnterKey
}

 
# do something in two()
configbloqueo(){
	echo "Bloqueando ficheros de usuario"
	chattr +i ${RUTAUSUARIO}/.config/xfce4/panel/launcher/*.desktop
	chattr +i ${RUTAUSUARIO}/.config/xfce4/panel/launcher/whiskermenu*.rc
	chattr +i ${RUTAUSUARIO}/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-desktop.xml
	chattr +i ${RUTAUSUARIO}/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-settings-editor.xml
	chattr +i ${RUTAUSUARIO}/.config/xfce4/xfconf/xfce-perchannel-xml/keyboards.xml
	chattr +i ${RUTAUSUARIO}/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-power-manager.xml
	chattr +i ${RUTAUSUARIO}/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-mime-settings.xml
	chattr +i ${RUTAUSUARIO}/.config/xfce4/xfconf/xfce-perchannel-xml/thunar.xml
	chattr +i ${RUTAUSUARIO}/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-keyboard-shortcuts.xm
	chattr +i ${RUTAUSUARIO}/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-notifyd.xml
	chattr +i ${RUTAUSUARIO}/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-panel.xml
	chattr +i ${RUTAUSUARIO}/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-session.xml
	chattr +i ${RUTAUSUARIO}/Escritorio/*.desktop
	chattr +i ${RUTAUSUARIO}/Desktop/*.desktop
	pause
}
configdesbloqueo(){
	echo "Desloqueando ficheros de usuario"
	chattr -i ${RUTAUSUARIO}/.config/xfce4/panel/launcher/*.desktop
	chattr -i ${RUTAUSUARIO}/.config/xfce4/panel/launcher/whiskermenu*.rc
	chattr -i ${RUTAUSUARIO}/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-desktop.xml
	chattr -i ${RUTAUSUARIO}/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-settings-editor.xml
	chattr -i ${RUTAUSUARIO}/.config/xfce4/xfconf/xfce-perchannel-xml/keyboards.xml
	chattr -i ${RUTAUSUARIO}/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-power-manager.xml
	chattr -i ${RUTAUSUARIO}/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-mime-settings.xml
	chattr -i ${RUTAUSUARIO}/.config/xfce4/xfconf/xfce-perchannel-xml/thunar.xml
	chattr -i ${RUTAUSUARIO}/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-keyboard-shortcuts.xm
	chattr -i ${RUTAUSUARIO}/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-notifyd.xml
	chattr -i ${RUTAUSUARIO}/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-panel.xml
	chattr -i ${RUTAUSUARIO}/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-session.xml
	chattr -i ${RUTAUSUARIO}/Escritorio/*.desktop
	chattr -i ${RUTAUSUARIO}/Desktop/*.desktop
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
	echo "Bloqueo de archivos del usuario"
	echo "~~~~~~~~~~~~~~~~~~~~~"
	echo "Selecciona la opción deseada"
	echo "~~~~~~~~~~~~~~~~~~~~~"
	echo " 1. Bloquear ficheros para hacerlos inalterables"
	echo " 2. Desbloquear ficheros para poder alterarlos"
}



# read input from the keyboard and take a action
# invoke the one() when the user select 1 from the menu option.
# invoke the two() when the user select 2 from the menu option.
# Exit when user the user select 3 form the menu option.

read_options(){
	local choice
	read -p "Selecciona [ 1 - 2] " choice
	case $choice in
		1)   
			configbloqueo
			;;
		2)    
			configdesbloqueo
			;;
		*) 
			echo -e "Opcion no contemplada" && sleep 2
			;;
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
	exit 0
done
