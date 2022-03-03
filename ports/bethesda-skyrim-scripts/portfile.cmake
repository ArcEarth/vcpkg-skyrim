get_filename_component(RegistrySkyrimPath "[HKEY_LOCAL_MACHINE\\SOFTWARE\\Wow6432Node\\Bethesda Softworks\\Skyrim Special Edition;Installed Path]" ABSOLUTE CACHE])
if (RegistrySkyrimPath)
    message("Found Skyrim install at ${RegistrySkyrimPath}.")
else()
    message(FATAL_ERROR "No Skyrim install was found.")
endif()
cmake_path(SET SkyrimPath ${RegistrySkyrimPath})

vcpkg_extract_source_archive(
    "${SkyrimPath}/Data/Scripts.zip"
)

file(GLOB GAME_SCRIPTS
    "${CURRENT_BUILDTREES_DIR}/src/Source/Scripts/*.psc"
)
file(GLOB GAME_FLAGS
    "${CURRENT_BUILDTREES_DIR}/src/Source/Scripts/*.flg"
)

file(INSTALL ${GAME_SCRIPTS}
   DESTINATION "${CURRENT_PACKAGES_DIR}/contrib/papyrus/skyrim"
)
file(INSTALL ${GAME_FLAGS}
   DESTINATION "${CURRENT_PACKAGES_DIR}/contrib/papyrus/skyrim"
)
