#!/bin/bash

pkg install -y ncurses-utils wget

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




box_out_success FEXDROID
sleep 3

echo "[SELECT AN OPTION]"

clear
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
       
       box_out_failure "INVALID OPTION"
       exit
fi
 
termux-setup-storage & &>/dev/null

clear
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

pkg update -y 



clear
lines=("INSTALLING X11-REPO"
       "PLEASE WAIT"
       ""
       "[CTRL+C] EXIT")

box_out_warning "${lines[@]}"
pkg install x11-repo -y &>/dev/null


clear
lines=("X11-REPO INSTALLED"
       ""
       "[CTRL+C] EXIT")

box_out_success "${lines[@]}"
sleep 2


clear
lines=("INSTALLING PACKAGES"
       "PLEASE WAIT"
       ""
       "[CTRL+C] EXIT")

box_out_warning "${lines[@]}"

if [ $option = 1 ]
then

       pkg install pulseaudio wget tsu xkeyboard-config wget -y &>/dev/null

elif [ $option = 2 ]
then
       pkg install pulseaudio wget xkeyboard-config proot-distro wget -y &>/dev/null  

fi

clear
lines=("PACKAGES INSTALLED"
       ""
       "[CTRL+C] EXIT")

box_out_success "${lines[@]}"
sleep 1


clear
lines=("INSTALLING TERMUX:X11.DEB"
       "PLEASE WAIT"
       ""
       "[CTRL+C] EXIT")

box_out_warning "${lines[@]}"

wget https://github.com/GabiAle97/FexDroid/raw/main/Apps/termux-x11-nightly-1.03.00-0-all.deb &>/dev/null
dpkg -i termux-x11-nightly-1.03.00-0-all.deb &>/dev/null
rm -f termux-x11-nightly-1.03.00-0-all.deb

wait


clear
lines=("TERMUX:X11.DEB INSTALLED"
       ""
       "[CTRL+C] EXIT")

box_out_success "${lines[@]}"

sleep 2


clear
lines=("CREATING FEXDROID SYSTEM"
       "PLEASE WAIT"
       ""
       "[CTRL+C] EXIT")

box_out_warning "${lines[@]}"

if [ -f $PREFIX/bin/Fex ]
then

    clear
    lines=("FEXDROID PREFIX ALREADY EXISTS"
         ""
         "[CTRL+C] EXIT")

  box_out_warning "${lines[@]}"

  rm $PREFIX/bin/Fex

  sleep 1

fi


if [ -d /sdcard/Fex ]
then

    clear
    lines=("FEXDROID FOLDER ALREADY EXISTS"
         ""
         "[CTRL+C] EXIT")

  box_out_warning "${lines[@]}"

  sleep 1

else

  mkdir /sdcard/Fex

    clear
    lines=("FEXDROID SYSTEM INSTALLED"
         ""
         "[CTRL+C] EXIT")

  box_out_success "${lines[@]}"

  sleep 1

fi



clear
lines=("INSTALLING UBUNTU-ROOTFS"
       "PLEASE WAIT"
       ""
       "[CTRL+C] EXIT")

box_out_warning "${lines[@]}"

if [ $option = 1 ]
then
  wget -q https://github.com/Ilya114/Box64Droid/releases/download/stable/box64droid-rootfs-chroot.tar.xz
  sudo mkdir ~/Fex
  sudo tar -xJf box64droid-rootfs-chroot.tar.xz -C ~/Fex &>/dev/null
  cd Fex
  sudo wget -q https://raw.githubusercontent.com/GabiAle97/FexDroid/main/Rootfs/Ubuntu/opt/checkconfig && sudo chmod +x checkconfig
  sudo wget -q https://raw.githubusercontent.com/GabiAle97/FexDroid/main/Rootfs/Ubuntu/opt/Fexconfig && sudo chmod +x Fexconfig
  sudo wget -q https://raw.githubusercontent.com/GabiAle97/FexDroid/main/Rootfs/Ubuntu/opt/InstallFex && sudo chmod +x InstallFex
  sudo wget -q https://raw.githubusercontent.com/GabiAle97/FexDroid/main/Rootfs/Ubuntu/opt/Fex && sudo chmod +x Fex
  sudo wget -q https://raw.githubusercontent.com/GabiAle97/FexDroid/main/Rootfs/Ubuntu/opt/FexMore && sudo chmod +x FexMore
  sudo mv FexMore InstallFex Fex checkconfig Fexconfig /data/data/com.termux/files/home/Fex/opt
  sudo wget -q https://raw.githubusercontent.com/GabiAle97/FexDroid/main/Rootfs/Ubuntu/opt/start-fex && sudo chmod +x start-fex
  sudo mv start-fex /data/data/com.termux/files/home/Fex/opt/Scripts
  sudo rm -f /data/data/com.termux/files/home/Fex/opt/start
  sudo rm -f /data/data/com.termux/files/home/Fex/opt/Box64Droid.conf
  sudo rm -f /data/data/com.termux/files/home/Fex/opt/Scripts/start-box64
  cd $HOME

elif [ $option = 2 ]
then
  mkdir -p /data/data/com.termux/files/usr/var/lib/proot-distro/ &>/dev/null
	mkdir -p /data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/ &>/dev/null
	mkdir -p /data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/ubuntu &>/dev/null
	wget -q https://github.com/Ilya114/Box64Droid/releases/download/stable/box64droid-rootfs.tar.xz
  proot-distro restore box64droid-rootfs.tar.xz &>/dev/null
  cd /data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/ubuntu/opt
  rm -f checkconfig start
  wget -q https://raw.githubusercontent.com/GabiAle97/FexDroid/main/Rootfs/Ubuntu/opt/Fexconfig && chmod +x Fexconfig
  wget -q https://raw.githubusercontent.com/GabiAle97/FexDroid/main/Rootfs/Ubuntu/opt/InstallFex && chmod +x InstallFex
  wget -q https://raw.githubusercontent.com/GabiAle97/FexDroid/main/Rootfs/Ubuntu/opt/Fex && chmod +x Fex
  wget -q https://raw.githubusercontent.com/GabiAle97/FexDroid/main/Rootfs/Ubuntu/opt/FexMore && chmod +x FexMore
  cd Scripts
  rm -f start-box64
  wget -q https://raw.githubusercontent.com/GabiAle97/FexDroid/main/Rootfs/Ubuntu/opt/start-fex && chmod +x start-fex
  rm -f checkconfig
  wget -q https://raw.githubusercontent.com/GabiAle97/FexDroid/main/Rootfs/Ubuntu/opt/checkconfig && chmod +x checkconfig
  rm -f changewinever
  wget -q https://raw.githubusercontent.com/GabiAle97/FexDroid/main/Rootfs/Ubuntu/opt/changewinever && chmod +x changewinever
  cd $HOME
fi

sleep 1



clear
lines=("UBUNTU-ROOTFS INSTALLED"
       ""
       "[CTRL+C] EXIT")

box_out_success "${lines[@]}"

sleep 1



clear
lines=("CREATING LAUNCHER"
       "PLEASE WAIT"
       ""
       "[CTRL+C] EXIT")

box_out_warning "${lines[@]}"

wget -q https://raw.githubusercontent.com/GabiAle97/FexDroid/main/Scripts/fex &>/dev/null
chmod +x fex
mv fex $PREFIX/bin &>/dev/null

sleep 1



clear
lines=("DELETING JUNK"
       "PLEASE WAIT"
       ""
       "[CTRL+C] EXIT")

box_out_warning "${lines[@]}"

rm -rf instalador-Fex.sh &>/dev/null

if [ $option = 1 ]
then

  rm box64droid-rootfs-chroot.tar.xz &>/dev/null

elif [ $option = 2 ]
then

  rm box64droid-rootfs.tar.xz &>/dev/null

fi

sleep 2



clear
lines=("INSTALLATION FINISHED")

box_out_warning "${lines[@]}"

fex