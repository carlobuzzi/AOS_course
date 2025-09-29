#!/bin/bash
set -e
#colima start --arch aarch64
# make build-container
echo "[1] Entering in the container"
make enter-container
cd /repo/modules
make build-modules       # compila tutti i moduli lab-*
cd lab-1-intro-hello-module
make copy-to-fs          # copia il tuo .ko dentro initramfs
cd /repo   # root del progetto
make run
insmod modules/lab-1-intro-hello-module.ko

#echo "[6] Preparando kernel per moduli"
#make modules_prepare     # Prepara headers e Module.symvers

#echo "[7] Compilando tutti i moduli del kernel (genera Module.symvers)"
#make modules

#echo "[8] Compilando il modulo esterno"
#make -C /sources/linux M=/repo/modules/lab-1-intro-hello-module modules

#cd /repo/modules/lab-1-intro-hello-module

#echo "[11] Compilando il modulo"
#make

#echo "[12] Starting QEMU"
#/repo/stage/start-qemu.sh --arch aarch64   # abilita quando pronto

#echo "[13] Inserendo modulo con parametro num=42"
#insmod modules/lab-1-intro-hello-module.ko num=42

#echo "✅ Done!"
