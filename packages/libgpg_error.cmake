ExternalProject_Add(libgpg_error
    DEPENDS gcc
    URL "ftp://ftp.gnupg.org/gcrypt/libgpg-error/libgpg-error-1.12.tar.bz2"
    URL_MD5 8f0eb41a344d19ac2aa9bd101dfb9ce6
    PATCH_COMMAND patch -p0 < ${CMAKE_CURRENT_SOURCE_DIR}/libgpg_error-0001-Fix-potomo-hang-on-Cygwin.patch
    CONFIGURE_COMMAND ${EXEC} <SOURCE_DIR>/configure
        --host=${TARGET_ARCH}
        --prefix=${MINGW_INSTALL_PREFIX}
        --disable-shared
        --disable-nls
        --disable-languages
    BUILD_COMMAND ${MAKE}
    INSTALL_COMMAND ${MAKE} install
        COMMAND ${CMAKE_COMMAND} -E create_symlink ${MINGW_INSTALL_PREFIX}/bin/gpg-error-config ${CMAKE_INSTALL_PREFIX}/bin/gpg-error-config
    LOG_DOWNLOAD 1 LOG_UPDATE 1 LOG_CONFIGURE 1 LOG_BUILD 1 LOG_INSTALL 1
)
