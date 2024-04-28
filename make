#!/bin/sh

#YassOS make file
#this file create a .flp and .iso for YassOS

if test "`whoami`" != "root" ; then
	echo "You must be logged in as root to build (for loopback mounting)"
	echo "Enter 'su' or 'sudo bash' to switch to root"
	exit
fi

if [ ! -e Images/yassOS.flp ]
then
	rm -f Images/yassOS.flp
	echo ">>> Creating new floppy image..."
	mkdosfs -C Images/yassOS.flp 1440 || exit
fi

echo ">>> Assembling bootloader..."
nasm -O0 -w+orphan-labels -f bin -o SourceCode/Bootloader/bootload.bin SourceCode/Bootloader/bootload.asm || exit


echo ">>> Assembling kernel..."
cd SourceCode
nasm -O0 -w+orphan-labels -f bin -o kernel.bin kernel.asm || exit
cd ..



echo ">>> Adding bootloader to floppy image..."
dd status=noxfer conv=notrunc if=SourceCode/Bootloader/bootload.bin of=Images/yassOS.flp || exit


echo ">>> Copying kernel"
rm -rf tmp-loop
mkdir tmp-loop && mount -o loop -t vfat Images/yassOS.flp tmp-loop && cp SourceCode/*.bin  tmp-loop/

sleep 0.5

echo ">>> Unmounting loopback floppy..."
umount tmp-loop || exit
rm -rf tmp-loop


echo ">>> Creating CD-ROM ISO image..."
rm -f Images/yassOS.iso
mkisofs -quiet -V 'YassOS' -input-charset iso8859-1 -o Images/yassOS.iso -b yassOS.flp Images/ || exit
echo '>>> Done!'

