cmake_minimum_required(VERSION 3.5)

project(NameTag LANGUAGES CXX)

set(CMAKE_INCLUDE_CURRENT_DIR ON)

set(CMAKE_AUTOUIC ON)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

set(CMAKE_PREFIX_PATH "${QTDIR}")
find_package(Qt5 COMPONENTS Core Quick Multimedia REQUIRED)

set(CMAKE_OSX_DEPLOYMENT_TARGET "10.13" CACHE STRING "Minimum OS X deployment version" FORCE)
set(MACOSX_BUNDLE_EXECUTABLE_NAME NameTag)
set(MACOSX_BUNDLE_GUI_IDENTIFIER co.nz.mobileinnovations.nametag)

add_executable(NameTag MACOSX_BUNDLE
  main.cpp
  qml.qrc
)

configure_file(
        ${CMAKE_CURRENT_SOURCE_DIR}/assets/MacOSXBundleInfo.plist.in
        ${CMAKE_CURRENT_BINARY_DIR}/assets/MacOSXBundleInfo.plist
)

set_target_properties(NameTag PROPERTIES
        MACOSX_BUNDLE_INFO_PLIST ${CMAKE_CURRENT_BINARY_DIR}/assets/MacOSXBundleInfo.plist
)

target_compile_definitions(NameTag
  PRIVATE $<$<OR:$<CONFIG:Debug>,$<CONFIG:RelWithDebInfo>>:QT_QML_DEBUG>)
target_link_libraries(NameTag
  PRIVATE Qt5::Core Qt5::Quick Qt5::Multimedia)
