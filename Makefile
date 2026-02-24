TARGET := iphone:clang:latest:13.0
INSTALL_TARGET_PROCESSES = SpringBoard


include $(THEOS)/makefiles/common.mk

TWEAK_NAME = BHTikTok

BHTikTok_FILES = Tweak.x $(wildcard *.m JGProgressHUD/*.m)
BHTikTok_FRAMEWORKS = UIKit Foundation CoreGraphics Photos CoreServices SystemConfiguration SafariServices Security QuartzCore
BHTikTok_PRIVATE_FRAMEWORKS = Preferences
BHTikTok_EXTRA_FRAMEWORKS = Cephei CepheiPrefs CepheiUI
BHTikTok_CFLAGS = -fobjc-arc -Wno-unused-variable -Wno-unused-value -Wno-deprecated-declarations -Wno-nullability-completeness -Wno-unused-function -Wno-incompatible-pointer-types

ifeq ($(SIDELOADING),1)
BHTikTok_FILES := $(filter-out SettingsViewController.m,$(BHTikTok_FILES))
BHTikTok_PRIVATE_FRAMEWORKS :=
BHTikTok_CFLAGS += -DBH_SIDELOADING=1
endif

include $(THEOS_MAKE_PATH)/tweak.mk
