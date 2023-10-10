#!/bin/bash

function box_out_success() {
  local s=("$@") b w

  for l in "${s[@]}"; do
    ((w<${#l})) && { b="$l"; w="${#l}"; }
  done

  tput setaf 2
  echo " -${b//?/-}-"
  echo "| ${b//?/ } |"
  for l in "${s[@]}"; do
    printf '| %s%*s%s |\n' "$(tput setaf 2)" "-$w" "$l" "$(tput setaf 2)"
  done

  echo "| ${b//?/ } |"
  echo " -${b//?/-}-"
  tput sgr 0
}

function box_out_warning() {
  local s=("$@") b w

  for l in "${s[@]}"; do
    ((w<${#l})) && { b="$l"; w="${#l}"; }
  done

  tput setaf 3
  echo " -${b//?/-}-"
  echo "| ${b//?/ } |"
  for l in "${s[@]}"; do
    printf '| %s%*s%s |\n' "$(tput setaf 3)" "-$w" "$l" "$(tput setaf 3)"
  done

  echo "| ${b//?/ } |"
  echo " -${b//?/-}-"
  tput sgr 0
}

function box_out_failure() {
  local s=("$@") b w

  for l in "${s[@]}"; do
    ((w<${#l})) && { b="$l"; w="${#l}"; }
  done

  tput setaf 1
  echo " -${b//?/-}-"
  echo "| ${b//?/ } |"
  for l in "${s[@]}"; do
    printf '| %s%*s%s |\n' "$(tput setaf 1)" "-$w" "$l" "$(tput setaf 1)"
  done

  echo "| ${b//?/ } |"
  echo " -${b//?/-}-"
  tput sgr 0
}


clear

box_out_success FEXDROID
sleep 3
clear
echo "[SELECT AN OPTION]"

lines=("1) FEXDROID ROOT"
       "2) FEXDROID NON-ROOT"
       ""
       "[CTRL+C] EXIT")

box_out_warning "${lines[@]}"
read -p "Option: " option

if [ $option = 1 ] || [ $option = 2 ]
then
	&>/dev/null
else
       clear
       box_out_failure "INVALID OPTION"
       exit
fi
clear 
termux-setup-storage & &>/dev/null

lines=("STORAGE PERMISSION"
       "PLEASE WAIT"
       ""
       "[CTRL+C] EXIT")

box_out_warning "${lines[@]}"
wait
clear 

lines=("UPDATING PACKAGES"
       "PLEASE WAIT"
       ""
       "[CTRL+C] EXIT")

box_out_warning "${lines[@]}"
#pkg update -y
#
#clear
#
#echo "==============================="
#echo "=                             ="
#echo "=  INSTALANDO REPOSITORIO..   ="
#echo "=                             ="
#echo "=  [CRT + C] PARA CANCELAR    ="
#echo "=                             ="
#echo "=  AGUARDE .                  ="
#echo "=                             ="
#echo "=                             ="
#echo "==============================="
#
#pkg install x11-repo -y &>/dev/null
#
#clear
#
#echo "==============================="
#echo "=                             ="
#echo "=  REPOSITORIO INSTALADO..    ="
#echo "=                             ="
#echo "=  [CRT + C] PARA CANCELAR    ="
#echo "=                             ="
#echo "=  AGUARDE .                  ="
#echo "=                             ="
#echo "=                             ="
#echo "==============================="
#
#sleep 2
#
#clear 
#
#echo "==============================="
#echo "=                             ="
#echo "=  INSTALANDO PACOTES..       ="
#echo "=                             ="
#echo "=  [CRT + C] PARA CANCELAR    ="
#echo "=                             ="
#echo "=  AGUARDE .                  ="
#echo "=                             ="
#echo "=                             ="
#echo "==============================="
#
#
#if [ $opcao = 1 ]
#then
#
#       pkg install pulseaudio wget tsu xkeyboard-config wget -y &>/dev/null
#
#elif [ $opcao = 2 ]
#then
#       pkg install pulseaudio wget xkeyboard-config proot-distro wget -y &>/dev/null  
#
#fi
#
#clear
#
#echo "==============================="
#echo "=                             ="
#echo "=  PACOTES INSTALADOS..       ="
#echo "=                             ="
#echo "=  [CRT + C] PARA CANCELAR    ="
#echo "=                             ="
#echo "=  AGUARDE .                  ="
#echo "=                             ="
#echo "=                             ="
#echo "==============================="
#
#sleep 1
#
#clear
#
#echo "==============================="
#echo "=                             ="
#echo "=  INSTALANDO TERMUX:X11.DEB  ="
#echo "=                             ="
#echo "=  [CRT + C] PARA CANCELAR    ="
#echo "=                             ="
#echo "=  AGUARDE .                  ="
#echo "=                             ="
#echo "=                             ="
#echo "==============================="
#
#wget https://github.com/OpomboMORTO/FEX-android/raw/main/Apps/termux-x11-nightly-1.03.00-0-all.deb &>/dev/null
#dpkg -i termux-x11-nightly-1.03.00-0-all.deb &>/dev/null
#rm -f termux-x11-nightly-1.03.00-0-all.deb
#
#clear
#
#echo "==============================="
#echo "=                             ="
#echo "=  TERMUX:X11.DEB INSTALADO   ="
#echo "=                             ="
#echo "=  [CRT + C] PARA CANCELAR    ="
#echo "=                             ="
#echo "=  AGUARDE .                  ="
#echo "=                             ="
#echo "=                             ="
#echo "==============================="
#
#sleep 1
#
#clear
#
#echo "==============================="
#echo "=                             ="
#echo "=  CRIANDO DIRETORIO FEX      ="
#echo "=                             ="
#echo "=  [CRT + C] PARA CANCELAR    ="
#echo "=                             ="
#echo "=  AGUARDE .                  ="
#echo "=                             ="
#echo "=                             ="
#echo "==============================="
#
#sleep 1
#
#clear 
#
#if [ -f $PREFIX/bin/Fex ]
#then
#
#echo "==============================="
#echo "=                             ="
#echo "=  DIRETORIO PREFIX JA EXISTE ="
#echo "=                             ="
#echo "=  [CRT + C] PARA CANCELAR    ="
#echo "=                             ="
#echo "=  AGUARDE .                  ="
#echo "=                             ="
#echo "=                             ="
#echo "==============================="
#
#rm $PREFIX/bin/Fex
#
#sleep 1
#
#else
#
#echo "==============================="
#echo "=                             ="
#echo "=  DIRETORIO PREFIX CRIADO    ="
#echo "=                             ="
#echo "=  [CRT + C] PARA CANCELAR    ="
#echo "=                             ="
#echo "=  AGUARDE .                  ="
#echo "=                             ="
#echo "=                             ="
#echo "==============================="
#
#sleep 1
#
#fi
#
#clear
#
#if [ -d /storage/Fex ]
#then
#
#echo "==============================="
#echo "=                             ="
#echo "=  DIRETORIO FEX JA EXISTE    ="
#echo "=                             ="
#echo "=  [CRT + C] PARA CANCELAR    ="
#echo "=                             ="
#echo "=  AGUARDE .                  ="
#echo "=                             ="
#echo "=                             ="
#echo "==============================="
#
#sleep 1
#
#else
#
#mkdir /storage/Fex
#
#echo "==============================="
#echo "=                             ="
#echo "=  DIRETORIO FEX CRIADO  ✓    ="
#echo "=                             ="
#echo "=  [CRT + C] PARA CANCELAR    ="
#echo "=                             ="
#echo "=  AGUARDE .                  ="
#echo "=                             ="
#echo "=                             ="
#echo "==============================="
#
#sleep 1
#
#fi
#
#clear
#
#echo "==============================="
#echo "=                             ="
#echo "=  BAIXANDO ROOTFS UBUNTU     ="
#echo "=                             ="
#echo "=  [CRT + C] PARA CANCELAR    ="
#echo "=                             ="
#echo "=  AGUARDE .                  ="
#echo "=                             ="
#echo "=                             ="
#echo "==============================="
#
#if [ $opcao = 1 ]
#then
#        wget -q https://github.com/Ilya114/Box64Droid/releases/download/chroot/box64droid-rootfs-beta-chroot.tar.xz
#
#elif [ $opcao = 2 ]
#then
#        mkdir -p /data/data/com.termux/files/usr/var/lib/proot-distro/ &>/dev/null
#	mkdir -p /data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/ &>/dev/null
#	mkdir -p /data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/ubuntu &>/dev/null
#	wget -q https://github.com/Ilya114/Box64Droid/releases/download/beta/box64droid-rootfs-beta.tar.xz 
#fi
#
#clear
#
#echo "==============================="
#echo "=                             ="
#echo "=  ROOTFS UBUNTU BAIXADO      ="
#echo "=                             ="
#echo "=  [CRT + C] PARA CANCELAR    ="
#echo "=                             ="
#echo "=  AGUARDE .                  ="
#echo "=                             ="
#echo "=                             ="
#echo "==============================="
#
#sleep 1
#
#clear
#
#echo "==============================="
#echo "=                             ="
#echo "=  INSTALANDO UBUNTU ROOTFS   ="
#echo "=                             ="
#echo "=  [CRT + C] PARA CANCELAR    ="
#echo "=                             ="
#echo "=  AGUARDE .                  ="
#echo "=                             ="
#echo "=                             ="
#echo "==============================="
#
#if [ $opcao = 1 ]
#then
#       sudo mkdir ~/Fex
#       sudo tar -xJf box64droid-rootfs-beta-chroot.tar.xz -C ~/Fex &>/dev/null
#elif [ $opcao = 2 ]
#then
#       proot-distro restore box64droid-rootfs-beta.tar.xz &>/dev/null
#fi
#
#sleep 1
#
#clear
#
#echo "==============================="
#echo "=                             ="
#echo "=  FINALIZANDO ROOTFS         ="
#echo "=                             ="
#echo "=  [CRT + C] PARA CANCELAR    ="
#echo "=                             ="
#echo "=  AGUARDE .                  ="
#echo "=                             ="
#echo "=                             ="
#echo "==============================="
#
#if [ $opcao = 1 ]
#then
#
#cd Fex
#
#sudo curl -O https://raw.githubusercontent.com/OpomboMORTO/FEX-android/main/Rootfs/Ubuntu/opt/checkconfig && sudo chmod +x checkconfig
#sudo curl -O https://raw.githubusercontent.com/OpomboMORTO/FEX-android/main/Rootfs/Ubuntu/opt/Fexconfig && sudo chmod+x Fexconfig
#sudo curl -O https://raw.githubusercontent.com/OpomboMORTO/FEX-android/main/Rootfs/Ubuntu/opt/InstallFex && sudo chmod +x InstallFex
#sudo curl -O https://raw.githubusercontent.com/OpomboMORTO/FEX-android/main/Rootfs/Ubuntu/opt/Fex && sudo chmod +x Fex
#sudo curl -O https://raw.githubusercontent.com/OpomboMORTO/FEX-android/main/Rootfs/Ubuntu/opt/FexMore && sudo chmod +x FexMore
#
#sudo mv FexMore InstallFex Fex checkconfig Fexconfig /data/data/com.termux/files/home/Fex/opt
#
#sudo curl -O https://raw.githubusercontent.com/OpomboMORTO/FEX-android/main/Rootfs/Ubuntu/opt/start-fex && sudo chmod +x start-fex
#
#sudo mv start-fex /data/data/com.termux/files/home/Fex/opt/Scripts
#
#sudo rm -f /data/data/com.termux/files/home/Fex/opt/start
#
#sudo rm -f /data/data/com.termux/files/home/Fex/opt/Box64Droid.conf
#
#sudo rm -f /data/data/com.termux/files/home/Fex/opt/Scripts/start-box64
#
#cd $HOME
#
#elif [ $opcao = 2 ]
#then
#
#cd /data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/ubuntu/opt
#
#rm -f checkconfig start
#
#curl -O https://raw.githubusercontent.com/OpomboMORTO/FEX-android/main/Rootfs/Ubuntu/opt/checkconfig && chmod +x checkconfig
#curl -O https://raw.githubusercontent.com/OpomboMORTO/FEX-android/main/Rootfs/Ubuntu/opt/Fexconfig && chmod+x Fexconfig
#curl -O https://raw.githubusercontent.com/OpomboMORTO/FEX-android/main/Rootfs/Ubuntu/opt/InstallFex && chmod +x InstallFex
#curl -O https://raw.githubusercontent.com/OpomboMORTO/FEX-android/main/Rootfs/Ubuntu/opt/Fex && chmod +x Fex
#curl -O https://raw.githubusercontent.com/OpomboMORTO/FEX-android/main/Rootfs/Ubuntu/opt/FexMore && chmod +x FexMore
#
#cd Scripts
#
#rm -f start-box64
#
#curl -O https://raw.githubusercontent.com/OpomboMORTO/FEX-android/main/Rootfs/Ubuntu/opt/start-fex && chmod +x start-fex
#
#cd $HOME
#
#fi
#
#sleep 1
#
#clear
#
#echo "==============================="
#echo "=                             ="
#echo "=  UBUNTU ROOTFS INSTALADO    ="
#echo "=                             ="
#echo "=  [CRT + C] PARA CANCELAR    ="
#echo "=                             ="
#echo "=  AGUARDE .                  ="
#echo "=                             ="
#echo "=                             ="
#echo "==============================="
#
#sleep 1
#
#clear
#
#echo "==============================="
#echo "=                             ="
#echo "=  CRIANDO INICIAVEL          ="
#echo "=                             ="
#echo "=  [CRT + C] PARA CANCELAR    ="
#echo "=                             ="
#echo "=  AGUARDE .                  ="
#echo "=                             ="
#echo "=                             ="
#echo "==============================="
#
#curl -O https://raw.githubusercontent.com/OpomboMORTO/FEX-android/main/Scripts/fex &>/dev/null
#chmod +x fex
#mv fex $PREFIX/bin &>/dev/null
#
#sleep 1
#
#clear
#
#echo "==============================="
#echo "=                             ="
#echo "=  LIMPANDO ARQUIVOS          ="
#echo "=                             ="
#echo "=  [CRT + C] PARA CANCELAR    ="
#echo "=                             ="
#echo "=  AGUARDE .                  ="
#echo "=                             ="
#echo "=                             ="
#echo "==============================="
#
#rm -rf instalador-Fex.sh &>/dev/null
#
#if [ $opcao = 1 ]
#then
#
#rm box64droid-rootfs-beta-chroot.tar.xz &>/dev/null
#
#elif [ $opcao = 2 ]
#then
#
#rm box64droid-rootfs-beta.tar.xz &>/dev/null
#
#fi
#
#sleep 2
#
#clear
#
#echo "==============================="
#echo "=                             ="
#echo "=  CONCLUIDO A INSTALACÃO     ="
#echo "=                             ="
#echo "=  [CRT + C] PARA CANCELAR    ="
#echo "=                             ="
#echo "=  AGUARDE .                  ="
#echo "=                             ="
#echo "=                             ="
#echo "==============================="
#