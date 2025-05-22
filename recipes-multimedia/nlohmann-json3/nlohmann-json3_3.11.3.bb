SUMMARY = "C++ JSON parser"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://LICENSE.MIT;md5=f969127d7b7ed0a8a63c2bbeae002588"

SRC_URI = "git://salsa.debian.org/debian/nlohmann-json3.git;protocol=https;branch=master"

SRCREV = "d0e4f895bf02f484a09deb0c1073336630850797"

S = "${WORKDIR}/git"

FILES:${PN}:append = " \
    ${datadir}/bash-completion/completions/pinctrl \
"

inherit cmake

OECMAKE_ARGS:append = "-DJSON_MultipleHeaders=ON"
