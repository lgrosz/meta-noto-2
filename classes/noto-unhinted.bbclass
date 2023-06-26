PACKAGES = "\
  ${PN}-unhinted \
"

python do_install() {
    bb.build.exec_func('do_install_base', d)

    if bb.utils.contains('PACKAGECONFIG', 'opentype', True, False, d):
        if bb.utils.contains('PACKAGECONFIG', 'bold', True, False, d):
            bb.build.exec_func('do_install_opentype_bold', d)
        if bb.utils.contains('PACKAGECONFIG', 'regular', True, False, d):
            bb.build.exec_func('do_install_opentype_regular', d)

    if bb.utils.contains('PACKAGECONFIG', 'truetype', True, False, d):
        if bb.utils.contains('PACKAGECONFIG', 'bold', True, False, d):
            bb.build.exec_func('do_install_truetype_bold', d)
        if bb.utils.contains('PACKAGECONFIG', 'regular', True, False, d):
            bb.build.exec_func('do_install_truetype_regular', d)
        if bb.utils.contains('PACKAGECONFIG', 'variable', True, False, d):
            if bb.utils.contains('PACKAGECONFIG', 'slim', True, False, d):
                bb.build.exec_func('do_install_truetype_slim_variable', d)
            else:
                bb.build.exec_func('do_install_truetype_variable', d)
}

do_install_base() {
    install -d ${D}${datadir}/fonts/truetype
}

do_install_opentype_bold() {
    install ${S}/unhinted/otf/*-Bold.otf ${D}${datadir}/fonts/truetype
}

do_install_opentype_regular() {
    install ${S}/unhinted/otf/*-Regular.otf ${D}${datadir}/fonts/truetype
}

do_install_truetype_bold() {
    install ${S}/unhinted/ttf/*-Bold.ttf ${D}${datadir}/fonts/truetype
}

do_install_truetype_regular() {
    install ${S}/unhinted/ttf/*-Regular.ttf ${D}${datadir}/fonts/truetype
}

do_install_truetype_variable() {
    install ${S}/unhinted/variable-ttf/*.ttf ${D}${datadir}/fonts/truetype
}

do_install_truetype_slim_variable() {
    install ${S}/unhinted/slim-variable-ttf/*.ttf ${D}${datadir}/fonts/truetype
}

FILES_${PN}-unhinted = "\
    ${datadir}/fonts/truetype/*.otf \
    ${datadir}/fonts/truetype/*.ttf \
"

