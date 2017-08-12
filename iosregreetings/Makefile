THEOS_DEVICE_IP = 192.168.1.43
ARCHS = armv7 arm64
TARGET = iphone:10.3:8.0

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = iOSREGreetings
iOSREGreetings_FILES = Tweak.xm
iOSREGreetings_FRANEWIRJS = UIKit

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
