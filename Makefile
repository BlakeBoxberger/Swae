include $(THEOS)/makefiles/common.mk

TWEAK_NAME = Swae
Swae_FILES = Tweak.xm
Swae_EXTRA_FRAMEWORKS = Cephei

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"

after-uinstall::
		"killall -9 SpringBoard"

SUBPROJECTS += settings

include $(THEOS_MAKE_PATH)/aggregate.mk
