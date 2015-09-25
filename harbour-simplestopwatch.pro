# NOTICE:
#
# Application name defined in TARGET has a corresponding QML filename.
# If name defined in TARGET is changed, the following needs to be done
# to match new name:
#   - corresponding QML filename must be changed
#   - desktop icon filename must be changed
#   - desktop filename must be changed
#   - icon definition filename in desktop file must be changed
#   - translation filenames have to be changed

# The name of your application
TARGET = harbour-simplestopwatch

CONFIG += sailfishapp

SOURCES += src/harbour-simplestopwatch.cpp

OTHER_FILES += qml/harbour-simplestopwatch.qml \
    rpm/harbour-simplestopwatch.spec \
    rpm/harbour-simplestopwatch.yaml \
    translations/*.ts \
    harbour-simplestopwatch.desktop \
    rpm/harbour-simplestopwatch.changes \
    translations/harbour-simplestopwatch-fi.ts

# to disable building translations every time, comment out the
# following CONFIG line
CONFIG += sailfishapp_i18n

# German translation is enabled as an example. If you aren't
# planning to localize your app, remember to comment out the
# following TRANSLATIONS line. And also do not forget to
# modify the localized app name in the the .desktop file.

# Okay, Finnish translation is there now. Lets see if it works :)
TRANSLATIONS += translations/harbour-simplestopwatch-fi.ts
# Thanks again, eson57!
TRANSLATIONS += translations/harbour-simplestopwatch-sv.ts

TEMPLATE = subdirs
SUBDIRS = src/insomniac src/folderlistmodel src

