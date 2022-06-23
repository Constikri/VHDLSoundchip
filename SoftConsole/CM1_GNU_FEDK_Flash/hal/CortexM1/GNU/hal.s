#-------------------------------------------------------------------------------
# (c) Copyright 2007 Actel Corporation.  All rights reserved.
# 
# Interrupt disabling/restoration for critical section protection.
#
# SVN $Revision: 542 $
# SVN $Date: 2008-09-17 14:53:19 +0100 (Wed, 17 Sep 2008) $
#
	.text
	.code 16
	.syntax unified
	
	.type HAL_disable_interrupts, function
	.type HAL_restore_interrupts, function
	
	.global HAL_disable_interrupts
	.global HAL_restore_interrupts

#-------------------------------------------------------------------------------
# 
#
HAL_disable_interrupts:
	mrs r0, PRIMASK
    cpsid I
    bx lr

#-------------------------------------------------------------------------------
#
#
HAL_restore_interrupts:
	msr PRIMASK, r0
	bx lr

.end
