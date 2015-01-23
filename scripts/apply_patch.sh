#!/bin/bash
export APPLY_ROOT=$PWD

cd $APPLY_ROOT/platform-device/cortex_a15x2_rtsm/guestos/linux
git reset --hard
git clean -xdf
git branch -D temp
git checkout 7d1f9aeff1ee4a20b1aeb377dd0f579fe9647619 -b temp
git branch -D 3.8
git checkout 7d1f9aeff1ee4a20b1aeb377dd0f579fe9647619 -b 3.8
git apply ../../patch/linux-fastmodels-config-add-minimal-linux-config.patch

cd $APPLY_ROOT/platform-device/cortex_a15x2_arndale/guestos/linux
echo $APPLY_ROOT/platform-device/cortex_a15x2_arndale/guestos/linux

cd $APPLY_ROOT/platform-device/cortex_a15x2_arndale/u-boot-native
git reset --hard
git clean -xdf

cd $APPLY_ROOT/platform-device/cortex_a15x2_arndale/guestos/linux
git reset --hard
git clean -xdf
git branch -D temp
git checkout origin/exynos-jb -b temp
git branch -D exynos-jb
git checkout origin/exynos-jb -b exynos-jb
git apply ../../patch/linux-arndale-config-add-minimal-linux-config.patch
