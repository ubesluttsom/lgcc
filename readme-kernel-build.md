# Dockerfile.kernel

This is a container to build the Linux kernel with LGCC. Run it using
`build-kernel.sh`.

## Building the kernel

1. Configure the kernel. For example using `make nconfig`. If making an
   image for a virtualization guest, perhaps use `make virt.config`. See
   `make help` for options.
1. Merge in the LGCC configuration using
   `./scripts/kconfig/merge_config.sh .config lgcc_config`.
1. Compile the kernel using `make LLVM=1 CC=clang`.
1. Take a coffee break while you wait ...

## Building the PEP-DNA kernel module

1. `cd ../pep-dna`
1. `./configure --with-lgcc --kernbuild-dir "../linux" --install-mod-path "../linux/modules"`.
1. `make LLVM=1 CC=clang all`.
1. `make LLVM=1 CC=clang install`. This might generate some modules.{order,
   builtinn, builtinn.modinfo} errors, which can be ignored, since we are not
   _actually_ installing the module, just moving the binaries.)

Now the PEP-DNA module should be placed inside the `linux/` directory. The
rootfs image can now be built.
