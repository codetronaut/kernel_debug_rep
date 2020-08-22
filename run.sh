#!/bin/sh

ping -c1 35.208.145.97 &> /dev/null 2>/dev/null
RET=$?
if [ $RET -eq 0 ]
then
echo "Running Script..."
if [ "$1" = "-y" ]
then
echo "scp bzImage and vmlinux..."
sudo scp -i ~/.ssh/bihar codetronaut@35.208.145.97:/home/codetronaut/test/linux/arch/x86_64/boot/bzImage /home/codetronaut/Desktop/work/Linux_and_kernel/kernel_development/linux-debug/kern-dev-wheezy/ 
fi
echo "Running QEMU..."
sudo qemu-system-x86_64 -kernel /home/codetronaut/Desktop/work/Linux_and_kernel/kernel_development/linux-debug/kern-dev-wheezy/bzImage -append "console=ttyS0 root=/dev/sda debug earlyprintk=serial slub_debug=QUZ" -hda /home/codetronaut/Desktop/work/Linux_and_kernel/kernel_development/linux-debug/kern-dev-wheezy/stretch.img -net user,hostfwd=tcp::10021-:22 -net nic -enable-kvm -nographic -m 2G -smp 2 -pidfile vm.pid 2>&1 | sudo tee vm.log
fi

if [ $RET -ne 0 ]
then
echo "Running QEMU with old bzImage..."
sudo qemu-system-x86_64 -kernel /home/codetronaut/Desktop/work/Linux_and_kernel/kernel_development/linux-debug/kern-dev-wheezy/bzImage -append "console=ttyS0 root=/dev/sda debug earlyprintk=serial slub_debug=QUZ" -hda /home/codetronaut/Desktop/work/Linux_and_kernel/kernel_development/linux-debug/kern-dev-wheezy/stretch.img -net user,hostfwd=tcp::10021-:22 -net nic -enable-kvm -nographic -m 2G -smp 2 -pidfile vm.pid 2>&1 | sudo tee vm.log
fi
