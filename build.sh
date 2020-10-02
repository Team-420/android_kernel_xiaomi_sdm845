# Select this dir for ROMDIR

export ROMDIR=$(pwd)

# Select arch
export ARCH=arm64
export SUBARCH=arm64

# Use GCC toolchains from this dir

KERNEL_TOOLCHAIN=/home/sleepy/Lineage-GCC/64/bin/aarch64-linux-android-
ARM32_TOOLCHAIN=/home/sleepy/Lineage-GCC/32/bin/arm-linux-androideabi-


export CROSS_COMPILE=$KERNEL_TOOLCHAIN
export CROSS_COMPILE_ARM32=$ARM32_TOOLCHAIN

echo "Starting compile"
make O=out skull_defconfig
make O=out -j8
make O=out -j8 INSTALL_MOD_PATH=MODULES_OUT modules_install
# make O=out bindeb-pkg 
cp out/arch/arm64/boot/Image.gz-dtb anykernel/Image.gz-dtb
cp -r out/MODULES_OUT/lib/modules/4.9* anykernel/modules/system/lib/modules/
rm  anykernel/modules/system/lib/modules/*/build
rm  anykernel/modules/system/lib/modules/*/source
rm anykernel/*.zip
cd anykernel
zip -r9 Team420-Nethunter-RC1.zip *