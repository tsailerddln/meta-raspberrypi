FILESEXTRAPATHS:prepend := "${THISDIR}/mesa:"

PV = "24.2.8"

SRC_URI = " \
	https://archive.mesa3d.org/mesa-${PV}.tar.xz \
	file://path_max.patch \
	file://src_glx_dri_common.h.patch \
	file://0001-dri-check-attached-outputs-and-resolution-to-decide-.patch \
	file://0001-dri-Add-RP1-kmsro-devices-to-the-magic-table.patch \
"

SRC_URI[sha256sum] = "999d0a854f43864fc098266aaf25600ce7961318a1e2e358bff94a7f53580e30"

DEPENDS += " python3-pyyaml-native"

GALLIUMDRIVERS_LLVM:append = ",llvmpipe"
unset GALLIUMDRIVERS
GALLIUMDRIVERS:rpi = "vc4,v3d"
GALLIUMDRIVERS:class-native = "swrast,llvmpipe"

PACKAGES += " libgallium"

FILES:libgallium += " ${libdir}/libgallium-${PV}.so"

INSANE_SKIP:${PN}-megadriver += " dev-so"
