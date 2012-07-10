#------------------------------------------------------------------------------
# <copyright file="makefile" company="Atheros">
#    Copyright (c) 2005-2010 Atheros Corporation.  All rights reserved.
# 
# The software source and binaries included in this development package are
# licensed, not sold. You, or your company, received the package under one
# or more license agreements. The rights granted to you are specifically
# listed in these license agreement(s). All other rights remain with Atheros
# Communications, Inc., its subsidiaries, or the respective owner including
# those listed on the included copyright notices.  Distribution of any
# portion of this package must be in strict compliance with the license
# agreement(s) terms.
# </copyright>
#
#
#------------------------------------------------------------------------------
#==============================================================================
# Author(s): ="Atheros"
#==============================================================================
#
# link or copy whole olca driver into external/athwlan/olca/
#

LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)

# From autoconf-generated Makefile
abtfilt_SOURCES = abtfilt_bluez_dbus.c \
		abtfilt_core.c \
		abtfilt_main.c \
		abtfilt_utils.c \
		abtfilt_wlan.c \
		btfilter_action.c \
		btfilter_core.c 

LOCAL_SRC_FILES:= $(abtfilt_SOURCES)

LOCAL_SHARED_LIBRARIES := \
	 	libdbus \
		libbluetooth \
		libcutils

LOCAL_STATIC_LIBRARIES := hciutils
LOCAL_CFLAGS += -DSTATIC_LINK_HCILIBS

LOCAL_C_INCLUDES := \
	$(LOCAL_PATH) \
	$(LOCAL_PATH)/../../../include \
	$(LOCAL_PATH)/../../../tools/athbtfilter/bluez \
	$(LOCAL_PATH)/../../../../include \
	$(LOCAL_PATH)/../../../os/linux/include \
        $(LOCAL_PATH)/../../../btfilter \
        $(LOCAL_PATH)/../../.. \
	$(call include-path-for, dbus) \
	$(call include-path-for, bluez-libs)

ifneq ($(PLATFORM_VERSION),$(filter $(PLATFORM_VERSION),1.5 1.6))
LOCAL_C_INCLUDES += external/bluetooth/bluez/include/bluetooth
LOCAL_CFLAGS+=-DBLUEZ4_3
else
LOCAL_C_INCLUDES += external/bluez/libs/include/bluetooth
endif

LOCAL_CFLAGS+= \
	-DDBUS_COMPILATION -DABF_DEBUG


LOCAL_MODULE := abtfilt

#LOCAL_MODULE_PATH := $(TARGET_OUT_OPTIONAL_EXECUTABLES)

include $(BUILD_EXECUTABLE)
