#!/bin/bash

BASE_EXTRA="$(dirname "$0")/files/var/www/_extra"

# Font Awesome Pro
URL="$(curl -s https://registry.npmjs.org/fapro-free/ | jq -r '.versions["5.15.4"].dist.tarball')"
PACKAGE=package.tgz
curl -so "$PACKAGE" "$URL"
rm -rf package/
tar zxf "$PACKAGE" package/{css,js,webfonts}
rm -rf "$BASE_EXTRA"/fontawesome
mkdir -p "$BASE_EXTRA"/fontawesome
mv package/{css,js,webfonts} "$BASE_EXTRA"/fontawesome/
rm -rf package package.tgz

# Open Sans
BASEURL="https://fontfacekit.github.io/open-sans"
BASEDIR="$BASE_EXTRA"
curl -so "$BASEDIR/open-sans.css" "$BASEURL/open-sans.css"
for f in $(grep -Po "url\(\K[^)]+" "$BASEDIR/open-sans.css"); do
  mkdir -p "$BASEDIR/$(dirname "$f")"
  curl -sLo "$BASEDIR/${f%%\?*}" "$BASEURL/$f"
done

# Roboto
BASEURL="https://fontfacekit.github.io/roboto"
BASEDIR="$BASE_EXTRA"
curl -so "$BASEDIR/roboto.css" "$BASEURL/roboto.css"
for f in $(grep -Po 'url\("?\K[^")]+' "$BASEDIR/roboto.css"); do
  mkdir -p "$BASEDIR/$(dirname "$f")"
  curl -sLo "$BASEDIR/${f%%\?*}" "$BASEURL/$f"
done

# Roboto Mono
URL="https://download.ibugone.com/fonts/RobotoMono.zip"
curl -so package.zip "$URL"
unzip -od "$BASE_EXTRA"/roboto-mono/ -x package.zip
rm -f package.zip
