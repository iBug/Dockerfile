#!/bin/bash

# Fetch Font Awesome
URL="$(curl -s https://registry.npmjs.org/fapro-free/ | jq -r '.versions["5.15.4"].dist.tarball')"
PACKAGE=package.tgz
curl -so "$PACKAGE" "$URL"
rm -rf package/
tar zxf "$PACKAGE" package/{css,js,webfonts}
rm -rf files/var/www/fontawesome/{css,js,webfonts}
mv package/{css,js,webfonts} files/var/www/fontawesome/
rm -rf package package.tgz

# Fetch Open Sans
BASEURL="https://fontfacekit.github.io/open-sans"
BASEDIR="files/var/www/opensans"
curl -so "$BASEDIR/open-sans.css" "$BASEURL/open-sans.css"
for f in $(grep -Po "url\(\K[^)]+" "$BASEDIR/open-sans.css"); do
  mkdir -p "$BASEDIR/$(dirname "$f")"
  curl -sLo "$BASEDIR/${f%%\?*}" "$BASEURL/$f"
done
