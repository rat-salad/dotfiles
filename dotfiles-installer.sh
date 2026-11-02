#!/bin/sh
clear
echo [1] Alpine
echo [2] Arch
echo [3] Gentoo
echo [4] Void
echo [5] Other
read -p "Enter number of distro: " distro

if [ $distro == "1" ]; then
	echo alpine
elif [ $distro == "2" ]; then
	echo !! Installing packages for arch linux
	sudo pacman -S --needed base-devel git
	git clone https://aur.archlinux.org/yay.git
	cd yay
	makepkg -si
	yay -S strawberry pywal niri foot mc vesktop pavucontrol mksh luakit bluez bluetui
elif [ $distro == "3" ]; then
	echo !! Installing packages for gentoo
	echo Note: pywal needs some bs to get working, good luck
	read -p "Press enter to continue"
	doas eselect repository enable guru
	doas emerge --sync guru
	doas emerge gui-wm/niri gui-apps/foot ranger nicotine+ vesktop-bin firefox-bin pipewire bluez bluetui
elif [ $distro == "4" ]; then
	echo void
else
	echo other
fi
echo !! Installing config files
read -p "Press enter to continue"
git clone https://github.com/rat-salad/dotfiles.git
cd dotfiles
mkdir -p ~/.config/niri
mkdir ~/.config/foot
mv config.kdl ~/.config/niri/
mv luakithomepage ~/
mv foot.ini ~/.config/foot
mv o-0.png ~/
