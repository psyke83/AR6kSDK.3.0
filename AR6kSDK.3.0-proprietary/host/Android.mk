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
# <summary>
# 	Wifi driver for AR6002
# </summary>
#
#------------------------------------------------------------------------------
#==============================================================================
# Author(s): ="Atheros"
#==============================================================================

ifneq ($(TARGET_SIMULATOR),true)

LOCAL_PATH:= $(call my-dir)
include $(CLEAR_VARS)

# HW2.0 firmware
ALL_PREBUILT += $(TARGET_OUT)/wifi/ath6k/AR6003/hw2.0/athwlan.bin.z77
$(TARGET_OUT)/wifi/ath6k/AR6003/hw2.0/athwlan.bin.z77 : $(LOCAL_PATH)/../target/AR6003/hw2.0/bin/athwlan.bin.z77 | $(ACP)
	$(transform-prebuilt-to-target)

ALL_PREBUILT += $(TARGET_OUT)/wifi/ath6k/AR6003/hw2.0/data.patch.bin
$(TARGET_OUT)/wifi/ath6k/AR6003/hw2.0/data.patch.bin : $(LOCAL_PATH)/../target/AR6003/hw2.0/bin/data.patch.hw2_0.bin | $(ACP)
	$(transform-prebuilt-to-target)

ALL_PREBUILT += $(TARGET_OUT)/wifi/ath6k/AR6003/hw2.0/otp.bin.z77
$(TARGET_OUT)/wifi/ath6k/AR6003/hw2.0/otp.bin.z77 : $(LOCAL_PATH)/../target/AR6003/hw2.0/bin/otp.bin.z77 | $(ACP)
	$(transform-prebuilt-to-target)

ALL_PREBUILT += $(TARGET_OUT)/wifi/ath6k/AR6003/hw2.0/bdata.SD31.bin
$(TARGET_OUT)/wifi/ath6k/AR6003/hw2.0/bdata.SD31.bin : $(LOCAL_PATH)/support/$(TARGET_PRODUCT)_caldata.bin | $(ACP)
	$(transform-prebuilt-to-target)

ALL_PREBUILT += $(TARGET_OUT)/wifi/ath6k/AR6003/hw2.0/athtcmd_ram.bin
$(TARGET_OUT)/wifi/ath6k/AR6003/hw2.0/athtcmd_ram.bin : $(LOCAL_PATH)/../target/AR6003/hw2.0/bin/athtcmd_ram.bin | $(ACP)
	$(transform-prebuilt-to-target)

# HW1.0 firmware. Comment them out if you don't need HW1.0
#ALL_PREBUILT += $(TARGET_OUT)/wifi/ath6k/AR6003/hw1.0/athwlan.bin.z77
#$(TARGET_OUT)/wifi/ath6k/AR6003/hw1.0/athwlan.bin.z77 : $(LOCAL_PATH)/../target/AR6003/hw1.0/bin/athwlan.bin.z77 | $(ACP)
#	$(transform-prebuilt-to-target)

#ALL_PREBUILT += $(TARGET_OUT)/wifi/ath6k/AR6003/hw1.0/data.patch.bin
#$(TARGET_OUT)/wifi/ath6k/AR6003/hw1.0/data.patch.bin : $(LOCAL_PATH)/../target/AR6003/hw1.0/bin/data.patch.hw1_0.bin | $(ACP)
#	$(transform-prebuilt-to-target)

#ALL_PREBUILT += $(TARGET_OUT)/wifi/ath6k/AR6003/hw1.0/otp.bin.z77
#$(TARGET_OUT)/wifi/ath6k/AR6003/hw1.0/otp.bin.z77 : $(LOCAL_PATH)/../target/AR6003/hw1.0/bin/otp.bin.z77 | $(ACP)
#	$(transform-prebuilt-to-target)

#ALL_PREBUILT += $(TARGET_OUT)/wifi/ath6k/AR6003/hw1.0/bdata.SD31.bin
#$(TARGET_OUT)/wifi/ath6k/AR6003/hw1.0/bdata.SD31.bin : $(LOCAL_PATH)/support/fakeBoardData_AR6003_v1_0.bin | $(ACP)
#	$(transform-prebuilt-to-target)

#ALL_PREBUILT += $(TARGET_OUT)/wifi/ath6k/AR6003/hw1.0/athtcmd_ram.bin
#$(TARGET_OUT)/wifi/ath6k/AR6003/hw1.0/athtcmd_ram.bin : $(LOCAL_PATH)/../target/AR6003/hw1.0/bin/athtcmd_ram.bin | $(ACP)
#	$(transform-prebuilt-to-target)


include $(LOCAL_PATH)/tools/Android.mk

endif
