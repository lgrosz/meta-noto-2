SUMMARY = "Noto Sans Adlam"
LICENSE = "OFL-1.1"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/OFL-1.1;md5=fac3a519e5e9eb96316656e0ca4f2b90"

inherit allarch fontcache

inherit noto-unhinted

PACKAGECONFIG ??= "opentype truetype bold regular variable slim"
PACKAGECONFIG[bold] = ","
PACKAGECONFIG[regular] = ","
PACKAGECONFIG[variable] = ","
PACKAGECONFIG[slim-variable] = ","
PACKAGECONFIG[opentype] = ","
PACKAGECONFIG[truetype] = ","

S = "${WORKDIR}/NotoSansAdlam"

SRC_URI = "https://github.com/notofonts/adlam/releases/download/NotoSansAdlam-v3.001/NotoSansAdlam-v3.001.zip"
SRC_URI[md5sum] = "ea1ea9fcc18d293a112b1b6f1f0e1680"
SRC_URI[sha256sum] = "4e71371849af43e0ec2d7433f554d8a57f74025ca74d0ebb656276baf04403f8"

