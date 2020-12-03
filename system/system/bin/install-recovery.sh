#!/system/bin/sh
if ! applypatch --check EMMC:/dev/block/bootdevice/by-name/recovery:134217728:0fcb1a11a8fd4d94eaf8f21e8fee76bce069134b; then
  applypatch  \
          --patch /system/recovery-from-boot.p \
          --source EMMC:/dev/block/bootdevice/by-name/boot:100663296:47fce77d6065887c8d2a550891cdc08fb6b7251b \
          --target EMMC:/dev/block/bootdevice/by-name/recovery:134217728:0fcb1a11a8fd4d94eaf8f21e8fee76bce069134b && \
      log -t recovery "Installing new recovery image: succeeded" || \
      log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
