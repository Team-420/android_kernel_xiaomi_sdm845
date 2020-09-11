# This script will make temp out dir in ../out

export ARCH=arm64

export SUBARCH=arm64

make O=../out_menu skull_defconfig
make O=../out_menu menuconfig
cp -rf ../out_menu/.config arch/arm64/configs/skull_defconfig
rm -rf ../out_menu
echo " "
echo " "
echo " "
echo "DONE, BYE."
