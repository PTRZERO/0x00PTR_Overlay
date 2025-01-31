# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit desktop

DESCRIPTION="Open-source Android/Desktop remake of Civ V."
HOMEPAGE="https://yairm210.github.io/"
SRC_URI="https://github.com/yairm210/Unciv/releases/download/${PV}/Unciv-Linux64.zip"

LICENSE="MPL-2.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="virtual/jdk:="
RDEPEND="${DEPEND}"
BDEPEND=""

S=${WORKDIR}

src_install() {
	exeinto /opt/Unciv
	insinto /opt/Unciv
	doexe Unciv.jar
	doexe ${FILESDIR}/Unciv.sh
	doins ${FILESDIR}/icon.png
	domenu ${FILESDIR}/unciv.desktop
}

pkg_prerm() {
	rm -rf /opt/Unciv
	rm "/usr/share/applications/unciv.desktop"
}
