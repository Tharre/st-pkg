# Maintainer: Tharre <tharre3@gmail.com>

pkgname=st-custom
_pkgname=st
pkgver=0.7.r35.gddc4fdb
pkgrel=1
pkgdesc='Simple virtual terminal emulator for X'
url='http://git.suckless.org/st/'
arch=('i686' 'x86_64' 'armv7h')
license=('MIT')
depends=('libxft' 'adobe-source-code-pro-fonts' 'ttf-dejavu')
makedepends=('ncurses' 'libxext' 'git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=('st::git+https://github.com/Tharre/st-transparency.git#branch=custom_config'
        'st-terminal.desktop')
sha256sums=('SKIP'
            'ec9f8e5505f13b450ef180edf3596de4d528fe507fbd1aed7fa715221e64770f')

pkgver() {
	cd "${_pkgname}"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "${_pkgname}"
	ln -sf config.def.h config.h
}

build() {
	cd "${_pkgname}"
	make
}

package() {
	cd "${_pkgname}"
	make PREFIX=/usr DESTDIR="${pkgdir}" install
	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
	install -Dm644 README FAQ -t "${pkgdir}/usr/share/doc/${pkgname}"
	install -Dm644 "${srcdir}/st-terminal.desktop" -t "${pkgdir}/usr/share/applications"
}
