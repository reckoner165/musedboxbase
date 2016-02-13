#!/bin/bash
# Zip up image and copy to mounted dir
echo -e "\e[1;32mImage build completed!\e[0m"
echo -e "\e[1;32mBeginning zipping of image file to release directory...\e[0m"
pigz -f --best < /srv/builddir/img/rpi2-musedboxbase.img > $HOSTDIR/rpi2-musedboxbase-${DRONE_COMMIT:0:7}.img.gz
echo -e "\e[1;32mCopying unzipped image file to release directory for further steps...\e[0m"
cp -rf /srv/builddir/img/rpi2-musedboxbase.img $HOSTDIR/rpi-musedboxbase-latest.img
rm -f /srv/builddir/img/rpi2-musedboxbase.img
echo -e "\e[1;32mImage ${DRONE_COMMIT:0:7} deployed to release directory. Linking latest link....\e[0m"
ln -f -s ./rpi2-musedboxbase-${DRONE_COMMIT:0:7}.img.gz $HOSTDIR/rpi2-musedboxbase-latest.img.gz
echo -e "\e[1;32mBuild process completed.\e[0m"
exit 0
