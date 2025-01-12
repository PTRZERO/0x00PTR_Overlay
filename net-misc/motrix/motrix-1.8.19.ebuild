# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit unpacker desktop

DESCRIPTION="A full-featured download manager."
HOMEPAGE="https://motrix.app/"
SRC_URI="https://github.com/agalwood/Motrix/releases/download/v1.8.19/Motrix_${PV}_amd64.deb"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="gui-libs/gtk x11-libs/libnotify dev-libs/nss x11-libs/libXtst x11-misc/xdg-utils app-crypt/libsecret dev-libs/libayatana-appindicator"
BDEPEND=""

S=${WORKDIR}

src_unpack() {
	unpack_deb "Motrix_${PV}_amd64.deb"
}

src_install() {
	dodir /opt/Motrix
	cp -r opt/Motrix/. "${D}/opt/Motrix" || die
	domenu usr/share/applications/motrix.desktop
	insinto /usr/share
	doins -r usr/share/icons
}

