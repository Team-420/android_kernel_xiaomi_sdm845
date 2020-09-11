# Select this dir for ROMDIR

export ROMDIR=$(pwd)

# Select arch
export ARCH=arm64
export SUBARCH=arm64

# Use GCC toolchains from this dir
KERNEL_TOOLCHAIN=$ROMDIR/toolchain/aarch64/aarch64-linux-android-4.9/bin/aarch64-linux-android-
ARM32_TOOLCHAIN=$ROMDIR/toolchain/arm/arm-linux-androideabi-4.9/bin/arm-linux-androideabi-
CLANG_TOOLCHAIN=$ROMDIR/toolchain/clang_custom/bin/clang-11

export CROSS_COMPILE=$KERNEL_TOOLCHAIN
export CROSS_COMPILE_ARM32=$ARM32_TOOLCHAIN

echo "Starting compile"
make O=../out skull_defconfig
make O=../out
