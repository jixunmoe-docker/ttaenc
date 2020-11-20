#!/bin/sh

set -ex

# Added flags:
#  * -static: static build
#  * -s     : strip
export CFLAGS="-Wall -O3 -fomit-frame-pointer -funroll-loops \
               -fforce-addr -falign-functions=4 -msse \
               -static -s"

pkgname=ttaenc
pkgrel=3
pkgver=3.4.1

pkgsrc="http://downloads.sourceforge.net/tta/${pkgname}-${pkgver}-src.tgz"

# Download source
wget -O- "$pkgsrc" | tar -zxvf -

# Patch & Build
cd "${pkgname}-${pkgver}-src"
sed -i -E 's/(CFLAGS\s*)=/\1?=/' "Makefile"
make ttaenc

# Copy
[ -n "$BIN_OWNER" ] && chown "$BIN_OWNER" ttaenc
cp -p ttaenc /workspace/bin/
