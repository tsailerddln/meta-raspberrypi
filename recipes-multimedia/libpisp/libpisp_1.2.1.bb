SUMMARY = "Raspberry Pi ISP library"
SECTION = "libs"

LICENSE = "BSD-2-Clause"

LIC_FILES_CHKSUM = "\
    file://LICENSES/BSD-2-Clause.txt;md5=3417a46e992fdf62e5759fba9baef7a7 \
"

SRC_URI = " \
        git://github.com/raspberrypi/libpisp.git;protocol=https;branch=main \
"

SRCREV = "981977ff21f32c8a97d2a0ecbdff3e39d42ccce3"

S = "${WORKDIR}/git"

DEPENDS += " boost nlohmann-json3 chrpath-native"
PROVIDES += " rpi/pisp"

INSANE_SKIP:${PN} += " buildpaths"

inherit meson pkgconfig python3native

do_install:append() {
	sed -i -e "s:${STAGING_LIBDIR}/lib:-l:g" ${D}${libdir}/pkgconfig/libpisp.pc
	chrpath -d ${D}${libdir}/libpisp.so.1.2.1
}
