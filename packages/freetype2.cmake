ExternalProject_Add(freetype2
    DEPENDS
        libpng
        zlib
    GIT_REPOSITORY https://gitlab.com/shinchiro/freetype2.git
    SOURCE_DIR ${SOURCE_LOCATION}
    GIT_SHALLOW 1
    GIT_SUBMODULES ""
    UPDATE_COMMAND ""
    CONFIGURE_COMMAND ${EXEC} meson <BINARY_DIR> <SOURCE_DIR>
        --prefix=${MINGW_INSTALL_PREFIX}
        --libdir=${MINGW_INSTALL_PREFIX}/lib
        --cross-file=${MESON_CROSS}
        --buildtype=release
        --default-library=static
        -Dharfbuzz=disabled
        -Dtests=disabled
        -Dbrotli=disabled
        -Dzlib=enabled
        -Dpng=enabled
    BUILD_COMMAND ${EXEC} ninja -C <BINARY_DIR>
    INSTALL_COMMAND ${EXEC} ninja -C <BINARY_DIR> install
    LOG_DOWNLOAD 1 LOG_UPDATE 1 LOG_CONFIGURE 1 LOG_BUILD 1 LOG_INSTALL 1
)

force_rebuild_git(freetype2)
force_meson_configure(freetype2)
cleanup(freetype2 install)
