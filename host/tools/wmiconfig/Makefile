#------------------------------------------------------------------------------
# <copyright file="makefile" company="Atheros">
#    Copyright (c) 2005-2008 Atheros Corporation.  All rights reserved.
# 
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 2 as
# published by the Free Software Foundation;
#
# Software distributed under the License is distributed on an "AS
# IS" basis, WITHOUT WARRANTY OF ANY KIND, either express or
# implied. See the License for the specific language governing
# rights and limitations under the License.
#
#
#------------------------------------------------------------------------------
#==============================================================================
# Author(s): ="Atheros"
#==============================================================================
CC :=$(ATH_CROSS_COMPILE_TYPE)gcc
ifeq ($(ATH_BUILD_PAL_APP),yes)
AR :=$(ATH_CROSS_COMPILE_TYPE)ar
RM :=$(ATH_CROSS_COMPILE_TYPE)rm

USERF_FLAGS=-DATH_INCLUDE_PAL
KERNEL_SRC :=$(ATH_LINUXPATH)
PAL_SRC=../pal_host_intf/pal_api.c ../pal_host_intf/pal_intf.c ../pal_host_intf/pal_util.c ../palEventRecv/hciParser.c
PAL_OBJ=pal_api.o pal_intf.o pal_util.o hciParser.o
PAL_INTF_LIB=libpal_intf.a
INCLUDE_THREAD=-lpthread
else
USERF_FLAGS=
PAL_OBJ=
PAL_INTF_LIB=
INCLUDE_THREAD=
endif
APP=wmiconfig

all:
ifeq ($(ATH_BUILD_PAL_APP),yes)
	$(CC) -Wall $(USERF_FLAGS) -c -I./ -I$(KERNEL_SRC)/include -I../../include -I../../../include -I../../wlan/include -I../../os/linux/include  $(PAL_SRC)
	$(AR) -crs $(PAL_INTF_LIB) $(PAL_OBJ)
endif
	$(CC) -Wall $(USERF_FLAGS) -DUSER_KEYS -g -I$(KERNEL_SRC)/include -I../../include -I../../../include -I../../wlan/include -I../../os/linux/include wmiconfig.c $(PAL_INTF_LIB)  -o $(APP) $(INCLUDE_THREAD)

clean:
ifeq ($(ATH_BUILD_PAL_APP),yes)
	$(RM) $(PAL_OBJ) $(PAL_INTF_LIB)
endif
	$(RM) $(APP)
