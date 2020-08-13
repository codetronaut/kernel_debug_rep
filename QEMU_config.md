export LINUX_TRUNK=linux-master
KERNEL_OPT="root=/dev/sda type="ext4" console=ttyS0 quiet"

# Lauch kernel in Qemu
qemu-system-x86_64 \
  -kernel $LINUX_TRUNK/arch/x86/boot/bzImage \
  -initrd ./initramfs.cpio.gz -nographic \
  -append "$KERNEL_OPT" -enable-kvm -m 512M -smp 2 
```

That give us:

```
[    0.046299] Spectre V2 : Spectre mitigation: kernel not compiled with retpoline; no mitigation available!


Boot took 0.29 seconds

    ▄▄▄
   ▀█▀██  ▄  < Shrink up you kernel
 ▀▄██████▀
    ▀█████
       ▀▀▀▀▄
/bin/sh: can't access tty; job control turned off
#
