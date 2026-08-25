#!/bin/sh

set -eu

ARCH=$(uname -m)
VERSION=$(pacman -Q openra | awk '{print $2; exit}')
export ARCH VERSION
export OUTPATH=./dist
export ADD_HOOKS="self-updater.hook"
export UPINFO="gh-releases-zsync|${GITHUB_REPOSITORY%/*}|${GITHUB_REPOSITORY#*/}|latest|*$ARCH.AppImage.zsync"
export ICON=/usr/share/icons/hicolor/scalable/apps/openra-ra.svg
export DESKTOP=/usr/share/applications/openra-ra.desktop
export APPNAME=OpenRA
export DEPLOY_DOTNET=1
export DEPLOY_OPENGL=1
export DEPLOY_PIPEWIRE=1

# Deploy dependencies
quick-sharun /usr/lib/openra

# Turn AppDir into AppImage
quick-sharun --make-appimage
