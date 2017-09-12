#!/system/bin/sh
if [ -f /system/etc/recovery-transform.sh ]; then
  exec sh /system/etc/recovery-transform.sh 10004480 099acbd57e31f8c4f0c6b180ed0c93c22f322eb8 7593984 ad0193d772f09cc63f332153ebf661cc199bc30b
fi

if ! applypatch -c EMMC:/dev/block/platform/msm_sdcc.1/by-name/recovery:10004480:099acbd57e31f8c4f0c6b180ed0c93c22f322eb8; then
  applypatch -b /system/etc/recovery-resource.dat EMMC:/dev/block/platform/msm_sdcc.1/by-name/boot:7593984:ad0193d772f09cc63f332153ebf661cc199bc30b EMMC:/dev/block/platform/msm_sdcc.1/by-name/recovery 099acbd57e31f8c4f0c6b180ed0c93c22f322eb8 10004480 ad0193d772f09cc63f332153ebf661cc199bc30b:/system/recovery-from-boot.p && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
