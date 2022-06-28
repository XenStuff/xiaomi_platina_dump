#!/system/bin/sh
if ! applypatch --check EMMC:/dev/block/bootdevice/by-name/recovery:50406734:e5eb9c51ef41483e8b13fd6055de3f62c7a968bd; then
  applypatch --bonus /system/etc/recovery-resource.dat \
          --patch /system/recovery-from-boot.p \
          --source EMMC:/dev/block/bootdevice/by-name/boot:35366218:f20c0633babc5029876eb8aefdb8b307e4175926 \
          --target EMMC:/dev/block/bootdevice/by-name/recovery:50406734:e5eb9c51ef41483e8b13fd6055de3f62c7a968bd && \
      log -t recovery "Installing new recovery image: succeeded" || \
      log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
