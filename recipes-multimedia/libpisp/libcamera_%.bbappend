FILESEXTRAPATHS:prepend := "${THISDIR}/libcamera:"

SRC_URI = " \
        git://github.com/raspberrypi/libcamera.git;protocol=https;branch=main \
        file://0001-media_device-Add-bool-return-type-to-unlock.patch \
        file://0002-libcamera-Add-missing-stdint.h-include-to-dma_buf_al.patch \
        file://0003-compile.patch \
"

SRCREV = "29156679717bec7cc4784aeba3548807f2c27fca"

LIBCAMERA_PIPELINES := "rpi/vc4,rpi/pisp"
PACKAGECONFIG[raspberrypi] = ""

DEPENDS += " libpisp libsdl2 tiff jpeg"
