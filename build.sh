#!/bin/sh
# BUILD_CONFIG=build.config.apollo.gcc build/build.sh -j32
workdir="$HOME/Scrivania"
srcdir="$workdir/android_kernel_xiaomi_sm8250"
objdir="$srcdir/out/arch/arm64/boot"

PATH="$workdir/proton-clang-master/bin:$PATH"
export PATH
export KBUILD_BUILD_USER="Andreock"
export KBUILD_BUILD_HOST="Serverone"
export ARCH=arm64
${CROSS_COMPILE}ld -v

build() {
 make O=out clean
 make O=out apollo_defconfig
 make ARCH=arm64 O=out menuconfig
 make -j"$(nproc --all)" \
    O=out \
    CC="ccache clang" \
    CXX="ccache clang++" \
    AR="ccache llvm-ar" \
    AS="ccache llvm-as" \
    NM="ccache llvm-nm" \
    STRIP="ccache llvm-strip" \
    OBJCOPY="ccache llvm-objcopy" \
    OBJDUMP="ccache llvm-objdump"\
    OBJSIZE="ccache llvm-size" \
    READELF="ccache llvm-readelf" \
    HOSTCC="ccache clang" \
    HOSTCXX="ccache clang++" \
    HOSTAR="ccache llvm-ar" \
    HOSTAS="ccache llvm-as" \
    HOSTNM="ccache llvm-nm" \
    CROSS_COMPILE="aarch64-linux-gnu-" \
    CROSS_COMPILE_ARM32="arm-linux-gnueabi-"

}

build