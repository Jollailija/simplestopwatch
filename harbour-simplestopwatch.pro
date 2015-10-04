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

#CONFIG += sailfishapp

# Are these what I need?
DEPLOYMENT_PATH = /usr/share/$${TARGET}
qml.files = qml
qml.path = $${DEPLOYMENT_PATH}

desktop.files = $${TARGET}.desktop
desktop.path = /usr/share/applications

icon.files = $${TARGET}.png
icon.path = /usr/share/icons/hicolor/86x86/apps
#

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

translations.files = translations
translations.path = $${DEPLOYMENT_PATH}

# Is this line needed?
INSTALLS += desktop icon qml translations

TEMPLATE = subdirs
SUBDIRS = src/insomniac src
