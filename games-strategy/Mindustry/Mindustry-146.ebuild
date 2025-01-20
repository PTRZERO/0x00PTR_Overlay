# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="The automation tower defense RTS "
HOMEPAGE="https://mindustrygame.github.io/"
SRC_URI="https://github.com/Anuken/Mindustry/releases/download/v${PV}/Mindustry.jar"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="virtual/jdk:="
RDEPEND="${DEPEND}"
BDEPEND=""

inherit desktop

S=${DISTDIR}

src_unpack() {
	true
}
src_install() {
	exeinto /opt/Mindustry
	insinto /opt/Mindustry
	dodir /opt/Mindustry
	doexe Mindustry.jar
	doins ${FILESDIR}/icon.png
	make_desktop_entry "java -jar /opt/Mindustry/Mindustry.jar" Mindustry "/opt/Mindustry/icon.png" Game "Keywords=Game;Strategy;RTS;Mindustry;mindustry"
}

