# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="A Minecraft Launcher which is multi-functional, cross-platform and popular"
HOMEPAGE="https://hmcl.huangyuhui.net/"
SRC_URI="https://github.com/HMCL-dev/HMCL/releases/download/release-${PV}/HMCL-${PV}.jar"

LICENSE="Mojang GPL-3+"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="virtual/jdk:1.8 virtual/jdk:11 virtual/jdk:17 virtual/jdk:21"
RDEPEND="${DEPEND}"
BDEPEND=""

inherit desktop

S=${DISTDIR}

src_unpack() {
	true
}
src_install() {
	exeinto /opt/HMCL
	insinto /opt/HMCL
	dodir /opt/HMCL
	newexe "HMCL-${PV}.jar" "HMCL.jar"
	doins ${FILESDIR}/icon.ico
	make_desktop_entry "java -jar /opt/HMCL/HMCL.jar" "Hello Minecraft! Launcher" "/opt/HMCL/icon.ico" Game "Keywords=Game;Action;HMCL;hmcl;Minecraft;Launcher;mc"
}

