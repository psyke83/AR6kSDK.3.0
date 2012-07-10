/*
 * Copyright (c) 2006 Atheros Communications Inc.
 * All rights reserved.
 *
 * This file contains the definitions for wmiconfig utility
 *
 * $Id: //depot/sw/releases/olca3.0-Callisto/host/tools/tcmd/athtestcmd.h#1 $
 */

#ifndef _TCMD_H_
#define _TCMD_H_

#ifdef __cplusplus
extern "C" {
#endif

enum {
    TESTMODE_CONT_TX = 801,     /* something that doesn't collide with ascii */
    TESTMODE_CONT_RX,
    TESTMODE_PM,
    TESTMODE_SETLPREAMBLE,
};

#ifdef __cplusplus
}
#endif

#endif /* _TCMD_H_ */
