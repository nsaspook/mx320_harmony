#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Include project Makefile
ifeq "${IGNORE_LOCAL}" "TRUE"
# do not include local makefile. User is passing all local related variables already
else
include Makefile
# Include makefile containing local settings
ifeq "$(wildcard nbproject/Makefile-local-default.mk)" "nbproject/Makefile-local-default.mk"
include nbproject/Makefile-local-default.mk
endif
endif

# Environment
MKDIR=mkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=default
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=elf
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/mx32_harm.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/mx32_harm.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

ifeq ($(COMPARE_BUILD), true)
COMPARISON_BUILD=-mafrlcsj
else
COMPARISON_BUILD=
endif

ifdef SUB_IMAGE_ADDRESS

else
SUB_IMAGE_ADDRESS_COMMAND=
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Source Files Quoted if spaced
SOURCEFILES_QUOTED_IF_SPACED=ChrFont0.c FillPat.c OledChar.c OledDriver.c OledGrph.c ../src/app.c ../src/main.c ../src/bioshield.c ../src/orient.c ../../../../../../root/microchip/harmony/v2_04/framework/driver/spi/src/dynamic/drv_spi.c ../../../../../../root/microchip/harmony/v2_04/framework/driver/spi/src/drv_spi_sys_queue_fifo.c ../../../../../../root/microchip/harmony/v2_04/framework/driver/usart/src/dynamic/drv_usart.c ../../../../../../root/microchip/harmony/v2_04/framework/driver/usart/src/dynamic/drv_usart_byte_model.c ../../../../../../root/microchip/harmony/v2_04/framework/system/int/src/sys_int_pic32.c ../src/system_config/default/framework/driver/i2c/src/drv_i2c_static_buffer_model.c ../src/system_config/default/framework/driver/i2c/src/drv_i2c_mapping.c ../src/system_config/default/framework/driver/spi/dynamic/drv_spi_tasks.c ../src/system_config/default/framework/driver/spi/dynamic/drv_spi_api.c ../src/system_config/default/framework/driver/spi/dynamic/drv_spi_master_rm_tasks.c ../src/system_config/default/framework/system/clk/src/sys_clk_pic32mx.c ../src/system_config/default/framework/system/devcon/src/sys_devcon.c ../src/system_config/default/framework/system/devcon/src/sys_devcon_pic32mx.c ../src/system_config/default/framework/system/ports/src/sys_ports_static.c ../src/system_config/default/system_init.c ../src/system_config/default/system_interrupt.c ../src/system_config/default/system_exceptions.c ../src/system_config/default/system_tasks.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/ChrFont0.o ${OBJECTDIR}/FillPat.o ${OBJECTDIR}/OledChar.o ${OBJECTDIR}/OledDriver.o ${OBJECTDIR}/OledGrph.o ${OBJECTDIR}/_ext/1360937237/app.o ${OBJECTDIR}/_ext/1360937237/main.o ${OBJECTDIR}/_ext/1360937237/bioshield.o ${OBJECTDIR}/_ext/1360937237/orient.o ${OBJECTDIR}/_ext/714159976/drv_spi.o ${OBJECTDIR}/_ext/597159064/drv_spi_sys_queue_fifo.o ${OBJECTDIR}/_ext/1850117809/drv_usart.o ${OBJECTDIR}/_ext/1850117809/drv_usart_byte_model.o ${OBJECTDIR}/_ext/939526350/sys_int_pic32.o ${OBJECTDIR}/_ext/12144542/drv_i2c_static_buffer_model.o ${OBJECTDIR}/_ext/12144542/drv_i2c_mapping.o ${OBJECTDIR}/_ext/977502197/drv_spi_tasks.o ${OBJECTDIR}/_ext/977502197/drv_spi_api.o ${OBJECTDIR}/_ext/977502197/drv_spi_master_rm_tasks.o ${OBJECTDIR}/_ext/639803181/sys_clk_pic32mx.o ${OBJECTDIR}/_ext/340578644/sys_devcon.o ${OBJECTDIR}/_ext/340578644/sys_devcon_pic32mx.o ${OBJECTDIR}/_ext/822048611/sys_ports_static.o ${OBJECTDIR}/_ext/1688732426/system_init.o ${OBJECTDIR}/_ext/1688732426/system_interrupt.o ${OBJECTDIR}/_ext/1688732426/system_exceptions.o ${OBJECTDIR}/_ext/1688732426/system_tasks.o
POSSIBLE_DEPFILES=${OBJECTDIR}/ChrFont0.o.d ${OBJECTDIR}/FillPat.o.d ${OBJECTDIR}/OledChar.o.d ${OBJECTDIR}/OledDriver.o.d ${OBJECTDIR}/OledGrph.o.d ${OBJECTDIR}/_ext/1360937237/app.o.d ${OBJECTDIR}/_ext/1360937237/main.o.d ${OBJECTDIR}/_ext/1360937237/bioshield.o.d ${OBJECTDIR}/_ext/1360937237/orient.o.d ${OBJECTDIR}/_ext/714159976/drv_spi.o.d ${OBJECTDIR}/_ext/597159064/drv_spi_sys_queue_fifo.o.d ${OBJECTDIR}/_ext/1850117809/drv_usart.o.d ${OBJECTDIR}/_ext/1850117809/drv_usart_byte_model.o.d ${OBJECTDIR}/_ext/939526350/sys_int_pic32.o.d ${OBJECTDIR}/_ext/12144542/drv_i2c_static_buffer_model.o.d ${OBJECTDIR}/_ext/12144542/drv_i2c_mapping.o.d ${OBJECTDIR}/_ext/977502197/drv_spi_tasks.o.d ${OBJECTDIR}/_ext/977502197/drv_spi_api.o.d ${OBJECTDIR}/_ext/977502197/drv_spi_master_rm_tasks.o.d ${OBJECTDIR}/_ext/639803181/sys_clk_pic32mx.o.d ${OBJECTDIR}/_ext/340578644/sys_devcon.o.d ${OBJECTDIR}/_ext/340578644/sys_devcon_pic32mx.o.d ${OBJECTDIR}/_ext/822048611/sys_ports_static.o.d ${OBJECTDIR}/_ext/1688732426/system_init.o.d ${OBJECTDIR}/_ext/1688732426/system_interrupt.o.d ${OBJECTDIR}/_ext/1688732426/system_exceptions.o.d ${OBJECTDIR}/_ext/1688732426/system_tasks.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/ChrFont0.o ${OBJECTDIR}/FillPat.o ${OBJECTDIR}/OledChar.o ${OBJECTDIR}/OledDriver.o ${OBJECTDIR}/OledGrph.o ${OBJECTDIR}/_ext/1360937237/app.o ${OBJECTDIR}/_ext/1360937237/main.o ${OBJECTDIR}/_ext/1360937237/bioshield.o ${OBJECTDIR}/_ext/1360937237/orient.o ${OBJECTDIR}/_ext/714159976/drv_spi.o ${OBJECTDIR}/_ext/597159064/drv_spi_sys_queue_fifo.o ${OBJECTDIR}/_ext/1850117809/drv_usart.o ${OBJECTDIR}/_ext/1850117809/drv_usart_byte_model.o ${OBJECTDIR}/_ext/939526350/sys_int_pic32.o ${OBJECTDIR}/_ext/12144542/drv_i2c_static_buffer_model.o ${OBJECTDIR}/_ext/12144542/drv_i2c_mapping.o ${OBJECTDIR}/_ext/977502197/drv_spi_tasks.o ${OBJECTDIR}/_ext/977502197/drv_spi_api.o ${OBJECTDIR}/_ext/977502197/drv_spi_master_rm_tasks.o ${OBJECTDIR}/_ext/639803181/sys_clk_pic32mx.o ${OBJECTDIR}/_ext/340578644/sys_devcon.o ${OBJECTDIR}/_ext/340578644/sys_devcon_pic32mx.o ${OBJECTDIR}/_ext/822048611/sys_ports_static.o ${OBJECTDIR}/_ext/1688732426/system_init.o ${OBJECTDIR}/_ext/1688732426/system_interrupt.o ${OBJECTDIR}/_ext/1688732426/system_exceptions.o ${OBJECTDIR}/_ext/1688732426/system_tasks.o

# Source Files
SOURCEFILES=ChrFont0.c FillPat.c OledChar.c OledDriver.c OledGrph.c ../src/app.c ../src/main.c ../src/bioshield.c ../src/orient.c ../../../../../../root/microchip/harmony/v2_04/framework/driver/spi/src/dynamic/drv_spi.c ../../../../../../root/microchip/harmony/v2_04/framework/driver/spi/src/drv_spi_sys_queue_fifo.c ../../../../../../root/microchip/harmony/v2_04/framework/driver/usart/src/dynamic/drv_usart.c ../../../../../../root/microchip/harmony/v2_04/framework/driver/usart/src/dynamic/drv_usart_byte_model.c ../../../../../../root/microchip/harmony/v2_04/framework/system/int/src/sys_int_pic32.c ../src/system_config/default/framework/driver/i2c/src/drv_i2c_static_buffer_model.c ../src/system_config/default/framework/driver/i2c/src/drv_i2c_mapping.c ../src/system_config/default/framework/driver/spi/dynamic/drv_spi_tasks.c ../src/system_config/default/framework/driver/spi/dynamic/drv_spi_api.c ../src/system_config/default/framework/driver/spi/dynamic/drv_spi_master_rm_tasks.c ../src/system_config/default/framework/system/clk/src/sys_clk_pic32mx.c ../src/system_config/default/framework/system/devcon/src/sys_devcon.c ../src/system_config/default/framework/system/devcon/src/sys_devcon_pic32mx.c ../src/system_config/default/framework/system/ports/src/sys_ports_static.c ../src/system_config/default/system_init.c ../src/system_config/default/system_interrupt.c ../src/system_config/default/system_exceptions.c ../src/system_config/default/system_tasks.c


CFLAGS=
ASFLAGS=
LDLIBSOPTIONS=

############# Tool locations ##########################################
# If you copy a project from one host to another, the path where the  #
# compiler is installed may be different.                             #
# If you open this project with MPLAB X in the new host, this         #
# makefile will be regenerated and the paths will be corrected.       #
#######################################################################
# fixDeps replaces a bunch of sed/cat/printf statements that slow down the build
FIXDEPS=fixDeps

.build-conf:  ${BUILD_SUBPROJECTS}
ifneq ($(INFORMATION_MESSAGE), )
	@echo $(INFORMATION_MESSAGE)
endif
	${MAKE}  -f nbproject/Makefile-default.mk dist/${CND_CONF}/${IMAGE_TYPE}/mx32_harm.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=32MX320F128H
MP_LINKER_FILE_OPTION=
# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assembleWithPreprocess
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/ChrFont0.o: ChrFont0.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/ChrFont0.o.d 
	@${RM} ${OBJECTDIR}/ChrFont0.o 
	@${FIXDEPS} "${OBJECTDIR}/ChrFont0.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../../../../../microchip/harmony/v2_04/framework" -I"../../../../../../microchip/harmony/v2_04/framework" -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../../root/microchip/harmony/v2_04/framework" -I"../src/system_config/default/framework" -Wall -MMD -MF "${OBJECTDIR}/ChrFont0.o.d" -o ${OBJECTDIR}/ChrFont0.o ChrFont0.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/FillPat.o: FillPat.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/FillPat.o.d 
	@${RM} ${OBJECTDIR}/FillPat.o 
	@${FIXDEPS} "${OBJECTDIR}/FillPat.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../../../../../microchip/harmony/v2_04/framework" -I"../../../../../../microchip/harmony/v2_04/framework" -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../../root/microchip/harmony/v2_04/framework" -I"../src/system_config/default/framework" -Wall -MMD -MF "${OBJECTDIR}/FillPat.o.d" -o ${OBJECTDIR}/FillPat.o FillPat.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/OledChar.o: OledChar.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/OledChar.o.d 
	@${RM} ${OBJECTDIR}/OledChar.o 
	@${FIXDEPS} "${OBJECTDIR}/OledChar.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../../../../../microchip/harmony/v2_04/framework" -I"../../../../../../microchip/harmony/v2_04/framework" -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../../root/microchip/harmony/v2_04/framework" -I"../src/system_config/default/framework" -Wall -MMD -MF "${OBJECTDIR}/OledChar.o.d" -o ${OBJECTDIR}/OledChar.o OledChar.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/OledDriver.o: OledDriver.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/OledDriver.o.d 
	@${RM} ${OBJECTDIR}/OledDriver.o 
	@${FIXDEPS} "${OBJECTDIR}/OledDriver.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../../../../../microchip/harmony/v2_04/framework" -I"../../../../../../microchip/harmony/v2_04/framework" -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../../root/microchip/harmony/v2_04/framework" -I"../src/system_config/default/framework" -Wall -MMD -MF "${OBJECTDIR}/OledDriver.o.d" -o ${OBJECTDIR}/OledDriver.o OledDriver.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/OledGrph.o: OledGrph.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/OledGrph.o.d 
	@${RM} ${OBJECTDIR}/OledGrph.o 
	@${FIXDEPS} "${OBJECTDIR}/OledGrph.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../../../../../microchip/harmony/v2_04/framework" -I"../../../../../../microchip/harmony/v2_04/framework" -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../../root/microchip/harmony/v2_04/framework" -I"../src/system_config/default/framework" -Wall -MMD -MF "${OBJECTDIR}/OledGrph.o.d" -o ${OBJECTDIR}/OledGrph.o OledGrph.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1360937237/app.o: ../src/app.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/app.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/app.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1360937237/app.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../../../../../microchip/harmony/v2_04/framework" -I"../../../../../../microchip/harmony/v2_04/framework" -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../../root/microchip/harmony/v2_04/framework" -I"../src/system_config/default/framework" -Wall -MMD -MF "${OBJECTDIR}/_ext/1360937237/app.o.d" -o ${OBJECTDIR}/_ext/1360937237/app.o ../src/app.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1360937237/main.o: ../src/main.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1360937237/main.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../../../../../microchip/harmony/v2_04/framework" -I"../../../../../../microchip/harmony/v2_04/framework" -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../../root/microchip/harmony/v2_04/framework" -I"../src/system_config/default/framework" -Wall -MMD -MF "${OBJECTDIR}/_ext/1360937237/main.o.d" -o ${OBJECTDIR}/_ext/1360937237/main.o ../src/main.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1360937237/bioshield.o: ../src/bioshield.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/bioshield.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/bioshield.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1360937237/bioshield.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../../../../../microchip/harmony/v2_04/framework" -I"../../../../../../microchip/harmony/v2_04/framework" -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../../root/microchip/harmony/v2_04/framework" -I"../src/system_config/default/framework" -Wall -MMD -MF "${OBJECTDIR}/_ext/1360937237/bioshield.o.d" -o ${OBJECTDIR}/_ext/1360937237/bioshield.o ../src/bioshield.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1360937237/orient.o: ../src/orient.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/orient.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/orient.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1360937237/orient.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../../../../../microchip/harmony/v2_04/framework" -I"../../../../../../microchip/harmony/v2_04/framework" -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../../root/microchip/harmony/v2_04/framework" -I"../src/system_config/default/framework" -Wall -MMD -MF "${OBJECTDIR}/_ext/1360937237/orient.o.d" -o ${OBJECTDIR}/_ext/1360937237/orient.o ../src/orient.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/714159976/drv_spi.o: ../../../../../../root/microchip/harmony/v2_04/framework/driver/spi/src/dynamic/drv_spi.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/714159976" 
	@${RM} ${OBJECTDIR}/_ext/714159976/drv_spi.o.d 
	@${RM} ${OBJECTDIR}/_ext/714159976/drv_spi.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/714159976/drv_spi.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../../../../../microchip/harmony/v2_04/framework" -I"../../../../../../microchip/harmony/v2_04/framework" -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../../root/microchip/harmony/v2_04/framework" -I"../src/system_config/default/framework" -Wall -MMD -MF "${OBJECTDIR}/_ext/714159976/drv_spi.o.d" -o ${OBJECTDIR}/_ext/714159976/drv_spi.o ../../../../../../root/microchip/harmony/v2_04/framework/driver/spi/src/dynamic/drv_spi.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/597159064/drv_spi_sys_queue_fifo.o: ../../../../../../root/microchip/harmony/v2_04/framework/driver/spi/src/drv_spi_sys_queue_fifo.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/597159064" 
	@${RM} ${OBJECTDIR}/_ext/597159064/drv_spi_sys_queue_fifo.o.d 
	@${RM} ${OBJECTDIR}/_ext/597159064/drv_spi_sys_queue_fifo.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/597159064/drv_spi_sys_queue_fifo.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../../../../../microchip/harmony/v2_04/framework" -I"../../../../../../microchip/harmony/v2_04/framework" -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../../root/microchip/harmony/v2_04/framework" -I"../src/system_config/default/framework" -Wall -MMD -MF "${OBJECTDIR}/_ext/597159064/drv_spi_sys_queue_fifo.o.d" -o ${OBJECTDIR}/_ext/597159064/drv_spi_sys_queue_fifo.o ../../../../../../root/microchip/harmony/v2_04/framework/driver/spi/src/drv_spi_sys_queue_fifo.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1850117809/drv_usart.o: ../../../../../../root/microchip/harmony/v2_04/framework/driver/usart/src/dynamic/drv_usart.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1850117809" 
	@${RM} ${OBJECTDIR}/_ext/1850117809/drv_usart.o.d 
	@${RM} ${OBJECTDIR}/_ext/1850117809/drv_usart.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1850117809/drv_usart.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../../../../../microchip/harmony/v2_04/framework" -I"../../../../../../microchip/harmony/v2_04/framework" -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../../root/microchip/harmony/v2_04/framework" -I"../src/system_config/default/framework" -Wall -MMD -MF "${OBJECTDIR}/_ext/1850117809/drv_usart.o.d" -o ${OBJECTDIR}/_ext/1850117809/drv_usart.o ../../../../../../root/microchip/harmony/v2_04/framework/driver/usart/src/dynamic/drv_usart.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1850117809/drv_usart_byte_model.o: ../../../../../../root/microchip/harmony/v2_04/framework/driver/usart/src/dynamic/drv_usart_byte_model.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1850117809" 
	@${RM} ${OBJECTDIR}/_ext/1850117809/drv_usart_byte_model.o.d 
	@${RM} ${OBJECTDIR}/_ext/1850117809/drv_usart_byte_model.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1850117809/drv_usart_byte_model.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../../../../../microchip/harmony/v2_04/framework" -I"../../../../../../microchip/harmony/v2_04/framework" -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../../root/microchip/harmony/v2_04/framework" -I"../src/system_config/default/framework" -Wall -MMD -MF "${OBJECTDIR}/_ext/1850117809/drv_usart_byte_model.o.d" -o ${OBJECTDIR}/_ext/1850117809/drv_usart_byte_model.o ../../../../../../root/microchip/harmony/v2_04/framework/driver/usart/src/dynamic/drv_usart_byte_model.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/939526350/sys_int_pic32.o: ../../../../../../root/microchip/harmony/v2_04/framework/system/int/src/sys_int_pic32.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/939526350" 
	@${RM} ${OBJECTDIR}/_ext/939526350/sys_int_pic32.o.d 
	@${RM} ${OBJECTDIR}/_ext/939526350/sys_int_pic32.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/939526350/sys_int_pic32.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../../../../../microchip/harmony/v2_04/framework" -I"../../../../../../microchip/harmony/v2_04/framework" -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../../root/microchip/harmony/v2_04/framework" -I"../src/system_config/default/framework" -Wall -MMD -MF "${OBJECTDIR}/_ext/939526350/sys_int_pic32.o.d" -o ${OBJECTDIR}/_ext/939526350/sys_int_pic32.o ../../../../../../root/microchip/harmony/v2_04/framework/system/int/src/sys_int_pic32.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/12144542/drv_i2c_static_buffer_model.o: ../src/system_config/default/framework/driver/i2c/src/drv_i2c_static_buffer_model.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/12144542" 
	@${RM} ${OBJECTDIR}/_ext/12144542/drv_i2c_static_buffer_model.o.d 
	@${RM} ${OBJECTDIR}/_ext/12144542/drv_i2c_static_buffer_model.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/12144542/drv_i2c_static_buffer_model.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../../../../../microchip/harmony/v2_04/framework" -I"../../../../../../microchip/harmony/v2_04/framework" -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../../root/microchip/harmony/v2_04/framework" -I"../src/system_config/default/framework" -Wall -MMD -MF "${OBJECTDIR}/_ext/12144542/drv_i2c_static_buffer_model.o.d" -o ${OBJECTDIR}/_ext/12144542/drv_i2c_static_buffer_model.o ../src/system_config/default/framework/driver/i2c/src/drv_i2c_static_buffer_model.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/12144542/drv_i2c_mapping.o: ../src/system_config/default/framework/driver/i2c/src/drv_i2c_mapping.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/12144542" 
	@${RM} ${OBJECTDIR}/_ext/12144542/drv_i2c_mapping.o.d 
	@${RM} ${OBJECTDIR}/_ext/12144542/drv_i2c_mapping.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/12144542/drv_i2c_mapping.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../../../../../microchip/harmony/v2_04/framework" -I"../../../../../../microchip/harmony/v2_04/framework" -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../../root/microchip/harmony/v2_04/framework" -I"../src/system_config/default/framework" -Wall -MMD -MF "${OBJECTDIR}/_ext/12144542/drv_i2c_mapping.o.d" -o ${OBJECTDIR}/_ext/12144542/drv_i2c_mapping.o ../src/system_config/default/framework/driver/i2c/src/drv_i2c_mapping.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/977502197/drv_spi_tasks.o: ../src/system_config/default/framework/driver/spi/dynamic/drv_spi_tasks.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/977502197" 
	@${RM} ${OBJECTDIR}/_ext/977502197/drv_spi_tasks.o.d 
	@${RM} ${OBJECTDIR}/_ext/977502197/drv_spi_tasks.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/977502197/drv_spi_tasks.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../../../../../microchip/harmony/v2_04/framework" -I"../../../../../../microchip/harmony/v2_04/framework" -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../../root/microchip/harmony/v2_04/framework" -I"../src/system_config/default/framework" -Wall -MMD -MF "${OBJECTDIR}/_ext/977502197/drv_spi_tasks.o.d" -o ${OBJECTDIR}/_ext/977502197/drv_spi_tasks.o ../src/system_config/default/framework/driver/spi/dynamic/drv_spi_tasks.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/977502197/drv_spi_api.o: ../src/system_config/default/framework/driver/spi/dynamic/drv_spi_api.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/977502197" 
	@${RM} ${OBJECTDIR}/_ext/977502197/drv_spi_api.o.d 
	@${RM} ${OBJECTDIR}/_ext/977502197/drv_spi_api.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/977502197/drv_spi_api.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../../../../../microchip/harmony/v2_04/framework" -I"../../../../../../microchip/harmony/v2_04/framework" -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../../root/microchip/harmony/v2_04/framework" -I"../src/system_config/default/framework" -Wall -MMD -MF "${OBJECTDIR}/_ext/977502197/drv_spi_api.o.d" -o ${OBJECTDIR}/_ext/977502197/drv_spi_api.o ../src/system_config/default/framework/driver/spi/dynamic/drv_spi_api.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/977502197/drv_spi_master_rm_tasks.o: ../src/system_config/default/framework/driver/spi/dynamic/drv_spi_master_rm_tasks.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/977502197" 
	@${RM} ${OBJECTDIR}/_ext/977502197/drv_spi_master_rm_tasks.o.d 
	@${RM} ${OBJECTDIR}/_ext/977502197/drv_spi_master_rm_tasks.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/977502197/drv_spi_master_rm_tasks.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../../../../../microchip/harmony/v2_04/framework" -I"../../../../../../microchip/harmony/v2_04/framework" -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../../root/microchip/harmony/v2_04/framework" -I"../src/system_config/default/framework" -Wall -MMD -MF "${OBJECTDIR}/_ext/977502197/drv_spi_master_rm_tasks.o.d" -o ${OBJECTDIR}/_ext/977502197/drv_spi_master_rm_tasks.o ../src/system_config/default/framework/driver/spi/dynamic/drv_spi_master_rm_tasks.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/639803181/sys_clk_pic32mx.o: ../src/system_config/default/framework/system/clk/src/sys_clk_pic32mx.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/639803181" 
	@${RM} ${OBJECTDIR}/_ext/639803181/sys_clk_pic32mx.o.d 
	@${RM} ${OBJECTDIR}/_ext/639803181/sys_clk_pic32mx.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/639803181/sys_clk_pic32mx.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../../../../../microchip/harmony/v2_04/framework" -I"../../../../../../microchip/harmony/v2_04/framework" -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../../root/microchip/harmony/v2_04/framework" -I"../src/system_config/default/framework" -Wall -MMD -MF "${OBJECTDIR}/_ext/639803181/sys_clk_pic32mx.o.d" -o ${OBJECTDIR}/_ext/639803181/sys_clk_pic32mx.o ../src/system_config/default/framework/system/clk/src/sys_clk_pic32mx.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/340578644/sys_devcon.o: ../src/system_config/default/framework/system/devcon/src/sys_devcon.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/340578644" 
	@${RM} ${OBJECTDIR}/_ext/340578644/sys_devcon.o.d 
	@${RM} ${OBJECTDIR}/_ext/340578644/sys_devcon.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/340578644/sys_devcon.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../../../../../microchip/harmony/v2_04/framework" -I"../../../../../../microchip/harmony/v2_04/framework" -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../../root/microchip/harmony/v2_04/framework" -I"../src/system_config/default/framework" -Wall -MMD -MF "${OBJECTDIR}/_ext/340578644/sys_devcon.o.d" -o ${OBJECTDIR}/_ext/340578644/sys_devcon.o ../src/system_config/default/framework/system/devcon/src/sys_devcon.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/340578644/sys_devcon_pic32mx.o: ../src/system_config/default/framework/system/devcon/src/sys_devcon_pic32mx.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/340578644" 
	@${RM} ${OBJECTDIR}/_ext/340578644/sys_devcon_pic32mx.o.d 
	@${RM} ${OBJECTDIR}/_ext/340578644/sys_devcon_pic32mx.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/340578644/sys_devcon_pic32mx.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../../../../../microchip/harmony/v2_04/framework" -I"../../../../../../microchip/harmony/v2_04/framework" -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../../root/microchip/harmony/v2_04/framework" -I"../src/system_config/default/framework" -Wall -MMD -MF "${OBJECTDIR}/_ext/340578644/sys_devcon_pic32mx.o.d" -o ${OBJECTDIR}/_ext/340578644/sys_devcon_pic32mx.o ../src/system_config/default/framework/system/devcon/src/sys_devcon_pic32mx.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/822048611/sys_ports_static.o: ../src/system_config/default/framework/system/ports/src/sys_ports_static.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/822048611" 
	@${RM} ${OBJECTDIR}/_ext/822048611/sys_ports_static.o.d 
	@${RM} ${OBJECTDIR}/_ext/822048611/sys_ports_static.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/822048611/sys_ports_static.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../../../../../microchip/harmony/v2_04/framework" -I"../../../../../../microchip/harmony/v2_04/framework" -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../../root/microchip/harmony/v2_04/framework" -I"../src/system_config/default/framework" -Wall -MMD -MF "${OBJECTDIR}/_ext/822048611/sys_ports_static.o.d" -o ${OBJECTDIR}/_ext/822048611/sys_ports_static.o ../src/system_config/default/framework/system/ports/src/sys_ports_static.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1688732426/system_init.o: ../src/system_config/default/system_init.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1688732426" 
	@${RM} ${OBJECTDIR}/_ext/1688732426/system_init.o.d 
	@${RM} ${OBJECTDIR}/_ext/1688732426/system_init.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1688732426/system_init.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../../../../../microchip/harmony/v2_04/framework" -I"../../../../../../microchip/harmony/v2_04/framework" -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../../root/microchip/harmony/v2_04/framework" -I"../src/system_config/default/framework" -Wall -MMD -MF "${OBJECTDIR}/_ext/1688732426/system_init.o.d" -o ${OBJECTDIR}/_ext/1688732426/system_init.o ../src/system_config/default/system_init.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1688732426/system_interrupt.o: ../src/system_config/default/system_interrupt.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1688732426" 
	@${RM} ${OBJECTDIR}/_ext/1688732426/system_interrupt.o.d 
	@${RM} ${OBJECTDIR}/_ext/1688732426/system_interrupt.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1688732426/system_interrupt.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../../../../../microchip/harmony/v2_04/framework" -I"../../../../../../microchip/harmony/v2_04/framework" -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../../root/microchip/harmony/v2_04/framework" -I"../src/system_config/default/framework" -Wall -MMD -MF "${OBJECTDIR}/_ext/1688732426/system_interrupt.o.d" -o ${OBJECTDIR}/_ext/1688732426/system_interrupt.o ../src/system_config/default/system_interrupt.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1688732426/system_exceptions.o: ../src/system_config/default/system_exceptions.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1688732426" 
	@${RM} ${OBJECTDIR}/_ext/1688732426/system_exceptions.o.d 
	@${RM} ${OBJECTDIR}/_ext/1688732426/system_exceptions.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1688732426/system_exceptions.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../../../../../microchip/harmony/v2_04/framework" -I"../../../../../../microchip/harmony/v2_04/framework" -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../../root/microchip/harmony/v2_04/framework" -I"../src/system_config/default/framework" -Wall -MMD -MF "${OBJECTDIR}/_ext/1688732426/system_exceptions.o.d" -o ${OBJECTDIR}/_ext/1688732426/system_exceptions.o ../src/system_config/default/system_exceptions.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1688732426/system_tasks.o: ../src/system_config/default/system_tasks.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1688732426" 
	@${RM} ${OBJECTDIR}/_ext/1688732426/system_tasks.o.d 
	@${RM} ${OBJECTDIR}/_ext/1688732426/system_tasks.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1688732426/system_tasks.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../../../../../microchip/harmony/v2_04/framework" -I"../../../../../../microchip/harmony/v2_04/framework" -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../../root/microchip/harmony/v2_04/framework" -I"../src/system_config/default/framework" -Wall -MMD -MF "${OBJECTDIR}/_ext/1688732426/system_tasks.o.d" -o ${OBJECTDIR}/_ext/1688732426/system_tasks.o ../src/system_config/default/system_tasks.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD) 
	
else
${OBJECTDIR}/ChrFont0.o: ChrFont0.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/ChrFont0.o.d 
	@${RM} ${OBJECTDIR}/ChrFont0.o 
	@${FIXDEPS} "${OBJECTDIR}/ChrFont0.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../../../../../microchip/harmony/v2_04/framework" -I"../../../../../../microchip/harmony/v2_04/framework" -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../../root/microchip/harmony/v2_04/framework" -I"../src/system_config/default/framework" -Wall -MMD -MF "${OBJECTDIR}/ChrFont0.o.d" -o ${OBJECTDIR}/ChrFont0.o ChrFont0.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/FillPat.o: FillPat.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/FillPat.o.d 
	@${RM} ${OBJECTDIR}/FillPat.o 
	@${FIXDEPS} "${OBJECTDIR}/FillPat.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../../../../../microchip/harmony/v2_04/framework" -I"../../../../../../microchip/harmony/v2_04/framework" -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../../root/microchip/harmony/v2_04/framework" -I"../src/system_config/default/framework" -Wall -MMD -MF "${OBJECTDIR}/FillPat.o.d" -o ${OBJECTDIR}/FillPat.o FillPat.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/OledChar.o: OledChar.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/OledChar.o.d 
	@${RM} ${OBJECTDIR}/OledChar.o 
	@${FIXDEPS} "${OBJECTDIR}/OledChar.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../../../../../microchip/harmony/v2_04/framework" -I"../../../../../../microchip/harmony/v2_04/framework" -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../../root/microchip/harmony/v2_04/framework" -I"../src/system_config/default/framework" -Wall -MMD -MF "${OBJECTDIR}/OledChar.o.d" -o ${OBJECTDIR}/OledChar.o OledChar.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/OledDriver.o: OledDriver.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/OledDriver.o.d 
	@${RM} ${OBJECTDIR}/OledDriver.o 
	@${FIXDEPS} "${OBJECTDIR}/OledDriver.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../../../../../microchip/harmony/v2_04/framework" -I"../../../../../../microchip/harmony/v2_04/framework" -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../../root/microchip/harmony/v2_04/framework" -I"../src/system_config/default/framework" -Wall -MMD -MF "${OBJECTDIR}/OledDriver.o.d" -o ${OBJECTDIR}/OledDriver.o OledDriver.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/OledGrph.o: OledGrph.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/OledGrph.o.d 
	@${RM} ${OBJECTDIR}/OledGrph.o 
	@${FIXDEPS} "${OBJECTDIR}/OledGrph.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../../../../../microchip/harmony/v2_04/framework" -I"../../../../../../microchip/harmony/v2_04/framework" -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../../root/microchip/harmony/v2_04/framework" -I"../src/system_config/default/framework" -Wall -MMD -MF "${OBJECTDIR}/OledGrph.o.d" -o ${OBJECTDIR}/OledGrph.o OledGrph.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1360937237/app.o: ../src/app.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/app.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/app.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1360937237/app.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../../../../../microchip/harmony/v2_04/framework" -I"../../../../../../microchip/harmony/v2_04/framework" -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../../root/microchip/harmony/v2_04/framework" -I"../src/system_config/default/framework" -Wall -MMD -MF "${OBJECTDIR}/_ext/1360937237/app.o.d" -o ${OBJECTDIR}/_ext/1360937237/app.o ../src/app.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1360937237/main.o: ../src/main.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1360937237/main.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../../../../../microchip/harmony/v2_04/framework" -I"../../../../../../microchip/harmony/v2_04/framework" -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../../root/microchip/harmony/v2_04/framework" -I"../src/system_config/default/framework" -Wall -MMD -MF "${OBJECTDIR}/_ext/1360937237/main.o.d" -o ${OBJECTDIR}/_ext/1360937237/main.o ../src/main.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1360937237/bioshield.o: ../src/bioshield.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/bioshield.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/bioshield.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1360937237/bioshield.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../../../../../microchip/harmony/v2_04/framework" -I"../../../../../../microchip/harmony/v2_04/framework" -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../../root/microchip/harmony/v2_04/framework" -I"../src/system_config/default/framework" -Wall -MMD -MF "${OBJECTDIR}/_ext/1360937237/bioshield.o.d" -o ${OBJECTDIR}/_ext/1360937237/bioshield.o ../src/bioshield.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1360937237/orient.o: ../src/orient.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/orient.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/orient.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1360937237/orient.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../../../../../microchip/harmony/v2_04/framework" -I"../../../../../../microchip/harmony/v2_04/framework" -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../../root/microchip/harmony/v2_04/framework" -I"../src/system_config/default/framework" -Wall -MMD -MF "${OBJECTDIR}/_ext/1360937237/orient.o.d" -o ${OBJECTDIR}/_ext/1360937237/orient.o ../src/orient.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/714159976/drv_spi.o: ../../../../../../root/microchip/harmony/v2_04/framework/driver/spi/src/dynamic/drv_spi.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/714159976" 
	@${RM} ${OBJECTDIR}/_ext/714159976/drv_spi.o.d 
	@${RM} ${OBJECTDIR}/_ext/714159976/drv_spi.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/714159976/drv_spi.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../../../../../microchip/harmony/v2_04/framework" -I"../../../../../../microchip/harmony/v2_04/framework" -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../../root/microchip/harmony/v2_04/framework" -I"../src/system_config/default/framework" -Wall -MMD -MF "${OBJECTDIR}/_ext/714159976/drv_spi.o.d" -o ${OBJECTDIR}/_ext/714159976/drv_spi.o ../../../../../../root/microchip/harmony/v2_04/framework/driver/spi/src/dynamic/drv_spi.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/597159064/drv_spi_sys_queue_fifo.o: ../../../../../../root/microchip/harmony/v2_04/framework/driver/spi/src/drv_spi_sys_queue_fifo.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/597159064" 
	@${RM} ${OBJECTDIR}/_ext/597159064/drv_spi_sys_queue_fifo.o.d 
	@${RM} ${OBJECTDIR}/_ext/597159064/drv_spi_sys_queue_fifo.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/597159064/drv_spi_sys_queue_fifo.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../../../../../microchip/harmony/v2_04/framework" -I"../../../../../../microchip/harmony/v2_04/framework" -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../../root/microchip/harmony/v2_04/framework" -I"../src/system_config/default/framework" -Wall -MMD -MF "${OBJECTDIR}/_ext/597159064/drv_spi_sys_queue_fifo.o.d" -o ${OBJECTDIR}/_ext/597159064/drv_spi_sys_queue_fifo.o ../../../../../../root/microchip/harmony/v2_04/framework/driver/spi/src/drv_spi_sys_queue_fifo.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1850117809/drv_usart.o: ../../../../../../root/microchip/harmony/v2_04/framework/driver/usart/src/dynamic/drv_usart.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1850117809" 
	@${RM} ${OBJECTDIR}/_ext/1850117809/drv_usart.o.d 
	@${RM} ${OBJECTDIR}/_ext/1850117809/drv_usart.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1850117809/drv_usart.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../../../../../microchip/harmony/v2_04/framework" -I"../../../../../../microchip/harmony/v2_04/framework" -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../../root/microchip/harmony/v2_04/framework" -I"../src/system_config/default/framework" -Wall -MMD -MF "${OBJECTDIR}/_ext/1850117809/drv_usart.o.d" -o ${OBJECTDIR}/_ext/1850117809/drv_usart.o ../../../../../../root/microchip/harmony/v2_04/framework/driver/usart/src/dynamic/drv_usart.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1850117809/drv_usart_byte_model.o: ../../../../../../root/microchip/harmony/v2_04/framework/driver/usart/src/dynamic/drv_usart_byte_model.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1850117809" 
	@${RM} ${OBJECTDIR}/_ext/1850117809/drv_usart_byte_model.o.d 
	@${RM} ${OBJECTDIR}/_ext/1850117809/drv_usart_byte_model.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1850117809/drv_usart_byte_model.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../../../../../microchip/harmony/v2_04/framework" -I"../../../../../../microchip/harmony/v2_04/framework" -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../../root/microchip/harmony/v2_04/framework" -I"../src/system_config/default/framework" -Wall -MMD -MF "${OBJECTDIR}/_ext/1850117809/drv_usart_byte_model.o.d" -o ${OBJECTDIR}/_ext/1850117809/drv_usart_byte_model.o ../../../../../../root/microchip/harmony/v2_04/framework/driver/usart/src/dynamic/drv_usart_byte_model.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/939526350/sys_int_pic32.o: ../../../../../../root/microchip/harmony/v2_04/framework/system/int/src/sys_int_pic32.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/939526350" 
	@${RM} ${OBJECTDIR}/_ext/939526350/sys_int_pic32.o.d 
	@${RM} ${OBJECTDIR}/_ext/939526350/sys_int_pic32.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/939526350/sys_int_pic32.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../../../../../microchip/harmony/v2_04/framework" -I"../../../../../../microchip/harmony/v2_04/framework" -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../../root/microchip/harmony/v2_04/framework" -I"../src/system_config/default/framework" -Wall -MMD -MF "${OBJECTDIR}/_ext/939526350/sys_int_pic32.o.d" -o ${OBJECTDIR}/_ext/939526350/sys_int_pic32.o ../../../../../../root/microchip/harmony/v2_04/framework/system/int/src/sys_int_pic32.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/12144542/drv_i2c_static_buffer_model.o: ../src/system_config/default/framework/driver/i2c/src/drv_i2c_static_buffer_model.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/12144542" 
	@${RM} ${OBJECTDIR}/_ext/12144542/drv_i2c_static_buffer_model.o.d 
	@${RM} ${OBJECTDIR}/_ext/12144542/drv_i2c_static_buffer_model.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/12144542/drv_i2c_static_buffer_model.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../../../../../microchip/harmony/v2_04/framework" -I"../../../../../../microchip/harmony/v2_04/framework" -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../../root/microchip/harmony/v2_04/framework" -I"../src/system_config/default/framework" -Wall -MMD -MF "${OBJECTDIR}/_ext/12144542/drv_i2c_static_buffer_model.o.d" -o ${OBJECTDIR}/_ext/12144542/drv_i2c_static_buffer_model.o ../src/system_config/default/framework/driver/i2c/src/drv_i2c_static_buffer_model.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/12144542/drv_i2c_mapping.o: ../src/system_config/default/framework/driver/i2c/src/drv_i2c_mapping.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/12144542" 
	@${RM} ${OBJECTDIR}/_ext/12144542/drv_i2c_mapping.o.d 
	@${RM} ${OBJECTDIR}/_ext/12144542/drv_i2c_mapping.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/12144542/drv_i2c_mapping.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../../../../../microchip/harmony/v2_04/framework" -I"../../../../../../microchip/harmony/v2_04/framework" -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../../root/microchip/harmony/v2_04/framework" -I"../src/system_config/default/framework" -Wall -MMD -MF "${OBJECTDIR}/_ext/12144542/drv_i2c_mapping.o.d" -o ${OBJECTDIR}/_ext/12144542/drv_i2c_mapping.o ../src/system_config/default/framework/driver/i2c/src/drv_i2c_mapping.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/977502197/drv_spi_tasks.o: ../src/system_config/default/framework/driver/spi/dynamic/drv_spi_tasks.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/977502197" 
	@${RM} ${OBJECTDIR}/_ext/977502197/drv_spi_tasks.o.d 
	@${RM} ${OBJECTDIR}/_ext/977502197/drv_spi_tasks.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/977502197/drv_spi_tasks.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../../../../../microchip/harmony/v2_04/framework" -I"../../../../../../microchip/harmony/v2_04/framework" -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../../root/microchip/harmony/v2_04/framework" -I"../src/system_config/default/framework" -Wall -MMD -MF "${OBJECTDIR}/_ext/977502197/drv_spi_tasks.o.d" -o ${OBJECTDIR}/_ext/977502197/drv_spi_tasks.o ../src/system_config/default/framework/driver/spi/dynamic/drv_spi_tasks.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/977502197/drv_spi_api.o: ../src/system_config/default/framework/driver/spi/dynamic/drv_spi_api.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/977502197" 
	@${RM} ${OBJECTDIR}/_ext/977502197/drv_spi_api.o.d 
	@${RM} ${OBJECTDIR}/_ext/977502197/drv_spi_api.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/977502197/drv_spi_api.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../../../../../microchip/harmony/v2_04/framework" -I"../../../../../../microchip/harmony/v2_04/framework" -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../../root/microchip/harmony/v2_04/framework" -I"../src/system_config/default/framework" -Wall -MMD -MF "${OBJECTDIR}/_ext/977502197/drv_spi_api.o.d" -o ${OBJECTDIR}/_ext/977502197/drv_spi_api.o ../src/system_config/default/framework/driver/spi/dynamic/drv_spi_api.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/977502197/drv_spi_master_rm_tasks.o: ../src/system_config/default/framework/driver/spi/dynamic/drv_spi_master_rm_tasks.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/977502197" 
	@${RM} ${OBJECTDIR}/_ext/977502197/drv_spi_master_rm_tasks.o.d 
	@${RM} ${OBJECTDIR}/_ext/977502197/drv_spi_master_rm_tasks.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/977502197/drv_spi_master_rm_tasks.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../../../../../microchip/harmony/v2_04/framework" -I"../../../../../../microchip/harmony/v2_04/framework" -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../../root/microchip/harmony/v2_04/framework" -I"../src/system_config/default/framework" -Wall -MMD -MF "${OBJECTDIR}/_ext/977502197/drv_spi_master_rm_tasks.o.d" -o ${OBJECTDIR}/_ext/977502197/drv_spi_master_rm_tasks.o ../src/system_config/default/framework/driver/spi/dynamic/drv_spi_master_rm_tasks.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/639803181/sys_clk_pic32mx.o: ../src/system_config/default/framework/system/clk/src/sys_clk_pic32mx.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/639803181" 
	@${RM} ${OBJECTDIR}/_ext/639803181/sys_clk_pic32mx.o.d 
	@${RM} ${OBJECTDIR}/_ext/639803181/sys_clk_pic32mx.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/639803181/sys_clk_pic32mx.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../../../../../microchip/harmony/v2_04/framework" -I"../../../../../../microchip/harmony/v2_04/framework" -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../../root/microchip/harmony/v2_04/framework" -I"../src/system_config/default/framework" -Wall -MMD -MF "${OBJECTDIR}/_ext/639803181/sys_clk_pic32mx.o.d" -o ${OBJECTDIR}/_ext/639803181/sys_clk_pic32mx.o ../src/system_config/default/framework/system/clk/src/sys_clk_pic32mx.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/340578644/sys_devcon.o: ../src/system_config/default/framework/system/devcon/src/sys_devcon.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/340578644" 
	@${RM} ${OBJECTDIR}/_ext/340578644/sys_devcon.o.d 
	@${RM} ${OBJECTDIR}/_ext/340578644/sys_devcon.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/340578644/sys_devcon.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../../../../../microchip/harmony/v2_04/framework" -I"../../../../../../microchip/harmony/v2_04/framework" -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../../root/microchip/harmony/v2_04/framework" -I"../src/system_config/default/framework" -Wall -MMD -MF "${OBJECTDIR}/_ext/340578644/sys_devcon.o.d" -o ${OBJECTDIR}/_ext/340578644/sys_devcon.o ../src/system_config/default/framework/system/devcon/src/sys_devcon.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/340578644/sys_devcon_pic32mx.o: ../src/system_config/default/framework/system/devcon/src/sys_devcon_pic32mx.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/340578644" 
	@${RM} ${OBJECTDIR}/_ext/340578644/sys_devcon_pic32mx.o.d 
	@${RM} ${OBJECTDIR}/_ext/340578644/sys_devcon_pic32mx.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/340578644/sys_devcon_pic32mx.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../../../../../microchip/harmony/v2_04/framework" -I"../../../../../../microchip/harmony/v2_04/framework" -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../../root/microchip/harmony/v2_04/framework" -I"../src/system_config/default/framework" -Wall -MMD -MF "${OBJECTDIR}/_ext/340578644/sys_devcon_pic32mx.o.d" -o ${OBJECTDIR}/_ext/340578644/sys_devcon_pic32mx.o ../src/system_config/default/framework/system/devcon/src/sys_devcon_pic32mx.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/822048611/sys_ports_static.o: ../src/system_config/default/framework/system/ports/src/sys_ports_static.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/822048611" 
	@${RM} ${OBJECTDIR}/_ext/822048611/sys_ports_static.o.d 
	@${RM} ${OBJECTDIR}/_ext/822048611/sys_ports_static.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/822048611/sys_ports_static.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../../../../../microchip/harmony/v2_04/framework" -I"../../../../../../microchip/harmony/v2_04/framework" -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../../root/microchip/harmony/v2_04/framework" -I"../src/system_config/default/framework" -Wall -MMD -MF "${OBJECTDIR}/_ext/822048611/sys_ports_static.o.d" -o ${OBJECTDIR}/_ext/822048611/sys_ports_static.o ../src/system_config/default/framework/system/ports/src/sys_ports_static.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1688732426/system_init.o: ../src/system_config/default/system_init.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1688732426" 
	@${RM} ${OBJECTDIR}/_ext/1688732426/system_init.o.d 
	@${RM} ${OBJECTDIR}/_ext/1688732426/system_init.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1688732426/system_init.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../../../../../microchip/harmony/v2_04/framework" -I"../../../../../../microchip/harmony/v2_04/framework" -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../../root/microchip/harmony/v2_04/framework" -I"../src/system_config/default/framework" -Wall -MMD -MF "${OBJECTDIR}/_ext/1688732426/system_init.o.d" -o ${OBJECTDIR}/_ext/1688732426/system_init.o ../src/system_config/default/system_init.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1688732426/system_interrupt.o: ../src/system_config/default/system_interrupt.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1688732426" 
	@${RM} ${OBJECTDIR}/_ext/1688732426/system_interrupt.o.d 
	@${RM} ${OBJECTDIR}/_ext/1688732426/system_interrupt.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1688732426/system_interrupt.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../../../../../microchip/harmony/v2_04/framework" -I"../../../../../../microchip/harmony/v2_04/framework" -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../../root/microchip/harmony/v2_04/framework" -I"../src/system_config/default/framework" -Wall -MMD -MF "${OBJECTDIR}/_ext/1688732426/system_interrupt.o.d" -o ${OBJECTDIR}/_ext/1688732426/system_interrupt.o ../src/system_config/default/system_interrupt.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1688732426/system_exceptions.o: ../src/system_config/default/system_exceptions.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1688732426" 
	@${RM} ${OBJECTDIR}/_ext/1688732426/system_exceptions.o.d 
	@${RM} ${OBJECTDIR}/_ext/1688732426/system_exceptions.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1688732426/system_exceptions.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../../../../../microchip/harmony/v2_04/framework" -I"../../../../../../microchip/harmony/v2_04/framework" -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../../root/microchip/harmony/v2_04/framework" -I"../src/system_config/default/framework" -Wall -MMD -MF "${OBJECTDIR}/_ext/1688732426/system_exceptions.o.d" -o ${OBJECTDIR}/_ext/1688732426/system_exceptions.o ../src/system_config/default/system_exceptions.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1688732426/system_tasks.o: ../src/system_config/default/system_tasks.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1688732426" 
	@${RM} ${OBJECTDIR}/_ext/1688732426/system_tasks.o.d 
	@${RM} ${OBJECTDIR}/_ext/1688732426/system_tasks.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1688732426/system_tasks.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../../../../../microchip/harmony/v2_04/framework" -I"../../../../../../microchip/harmony/v2_04/framework" -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../../root/microchip/harmony/v2_04/framework" -I"../src/system_config/default/framework" -Wall -MMD -MF "${OBJECTDIR}/_ext/1688732426/system_tasks.o.d" -o ${OBJECTDIR}/_ext/1688732426/system_tasks.o ../src/system_config/default/system_tasks.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD) 
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compileCPP
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
dist/${CND_CONF}/${IMAGE_TYPE}/mx32_harm.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk  ../../../../../../root/microchip/harmony/v2_04/bin/framework/peripheral/PIC32MX320F128H_peripherals.a  
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -mdebugger -D__MPLAB_DEBUGGER_ICD3=1 -mprocessor=$(MP_PROCESSOR_OPTION)  -o dist/${CND_CONF}/${IMAGE_TYPE}/mx32_harm.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}    ../../../../../../root/microchip/harmony/v2_04/bin/framework/peripheral/PIC32MX320F128H_peripherals.a      -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)   -mreserve=data@0x0:0x1FC -mreserve=boot@0x1FC02000:0x1FC02FEF -mreserve=boot@0x1FC02000:0x1FC024FF  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,-D=__DEBUG_D,--defsym=__MPLAB_DEBUGGER_ICD3=1,--defsym=_min_heap_size=0,--gc-sections,--no-code-in-dinit,--no-dinit-in-serial-mem,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml
	
else
dist/${CND_CONF}/${IMAGE_TYPE}/mx32_harm.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk  ../../../../../../root/microchip/harmony/v2_04/bin/framework/peripheral/PIC32MX320F128H_peripherals.a 
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -mprocessor=$(MP_PROCESSOR_OPTION)  -o dist/${CND_CONF}/${IMAGE_TYPE}/mx32_harm.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}    ../../../../../../root/microchip/harmony/v2_04/bin/framework/peripheral/PIC32MX320F128H_peripherals.a      -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=_min_heap_size=0,--gc-sections,--no-code-in-dinit,--no-dinit-in-serial-mem,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml
	${MP_CC_DIR}/xc32-bin2hex dist/${CND_CONF}/${IMAGE_TYPE}/mx32_harm.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} 
endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r build/default
	${RM} -r dist/default

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(shell "${PATH_TO_IDE_BIN}"mplabwildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
