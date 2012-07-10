#------------------------------------------------------------------------------
# <copyright file="makefile" company="Atheros">
#    Copyright (c) 2005-2010 Atheros Corporation.  All rights reserved.
# 
#
# Permission to use, copy, modify, and/or distribute this software for any
# purpose with or without fee is hereby granted, provided that the above
# copyright notice and this permission notice appear in all copies.
#
# THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
# WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
# MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
# ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
# WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
# ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
# OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
#
#
#------------------------------------------------------------------------------
#==============================================================================
# Author(s): ="Atheros"
#==============================================================================

ifneq ($(TARGET_SIMULATOR),true)

LOCAL_PATH:= $(call my-dir)
include $(CLEAR_VARS)

export  ATH_SRC_BASE=$(LOCAL_PATH)
export  ATH_BUILD_TYPE=ANDROID_ARM_NATIVEMMC
export  ATH_BUS_TYPE=sdio
export  ATH_OS_SUB_TYPE=linux_2_6
#ifeq ($(TARGET_PRODUCT),$(filter $(TARGET_PRODUCT),qsd8250_surf qsd8250_ffa msm7627_surf msm7627_ffa msm7625_ffa msm7625_surf msm7630_surf GT-I5500))
export  ATH_LINUXPATH=$(TARGET_OUT_INTERMEDIATES)/KERNEL_OBJ
#else
# Comment out the following variable for your platform 
# Link your kernel into android SDK directory as 'kernel' directory
# export  ATH_LINUXPATH= [Your android/kernel path ]
#endif 
export  ATH_ARCH_CPU_TYPE=arm
export  ATH_BUS_SUBTYPE=linux_sdio
export  ATH_ANDROID_ENV=yes
export  ATH_SOFTMAC_FILE_USED=yes
export  ATH_CFG80211_ENV=no
export  ATH_DEBUG_DRIVER=yes
export  ATH_HTC_RAW_INT_ENV=yes
#export  ATH_AR6K_OTA_TEST_MODE=no

ATH_HIF_TYPE:=sdio
ATH_ANDROID_SRC_BASE:= $(BOARD_WLAN_ATHEROS_SDK)
#ATH_ANDROID_SRC_BASE:= system/wlan/atheros/AR6kSDK.3.0
ATH_SRC_BASE:= ../$(ATH_ANDROID_SRC_BASE)/host

ifneq ($(PLATFORM_VERSION),$(filter $(PLATFORM_VERSION),1.5 1.6))

#ifeq ($(TARGET_PRODUCT),$(filter $(TARGET_PRODUCT),msm7627_surf msm7627_ffa GT-I5500))
ATH_ANDROID_BUILD_FLAGS=-D__LINUX_ARM_ARCH__=6 -march=armv6
#endif

ifeq ($(TARGET_PRODUCT),$(filter $(TARGET_PRODUCT),qsd8250_surf qsd8250_ffa msm7630_surf smdkc100))
ATH_ANDROID_BUILD_FLAGS=-D__LINUX_ARM_ARCH__=7 -march=armv7-a
endif

endif  # ECLAIR

ifeq ($(TARGET_PRODUCT),$(filter $(TARGET_PRODUCT),smdk6410))
ATH_ANDROID_BUILD_FLAGS += -DATH6KL_CONFIG_HIF_VIRTUAL_SCATTER 
endif 

#Uncomment the following define in order to enable OTA mode
#ATH_ANDROID_BUILD_FLAGS += -DATH6K_CONFIG_OTA_MODE

export ATH_ANDROID_BUILD_FLAGS

mod_cleanup := $(TARGET_OUT_INTERMEDIATES)/$(ATH_ANDROID_SRC_BASE)/dummy

$(mod_cleanup) :
	rm $(TARGET_OUT_INTERMEDIATES)/$(ATH_ANDROID_SRC_BASE) -rf
	mkdir -p $(TARGET_OUT)/wifi/ath6k/AR6003/hw2.0/
    
mod_file := $(TARGET_OUT)/wifi/ar6000.ko
strip_cmd := prebuilt/linux-x86/toolchain/arm-eabi-4.3.1/bin/arm-eabi-strip
$(mod_file) : $(mod_cleanup) $(TARGET_PREBUILT_KERNEL) acp
	$(MAKE) ARCH=arm CROSS_COMPILE=arm-eabi- -C $(ATH_LINUXPATH) ATH_HIF_TYPE=$(ATH_HIF_TYPE) SUBDIRS=$(ATH_SRC_BASE)/os/linux modules
	$(ACP) $(TARGET_OUT_INTERMEDIATES)/$(ATH_ANDROID_SRC_BASE)/host/os/linux/ar6000.ko $(TARGET_OUT)/wifi/
	$(strip_cmd) --strip-unneeded $(mod_file)

ALL_PREBUILT += $(mod_file)

include $(LOCAL_PATH)/tools/Android.mk

endif
