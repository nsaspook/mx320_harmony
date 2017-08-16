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
OUTPUT_SUFFIX=null
DEBUGGABLE_SUFFIX=null
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/p18pyro.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=null
DEBUGGABLE_SUFFIX=null
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/p18pyro.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Source Files Quoted if spaced
SOURCEFILES_QUOTED_IF_SPACED=xlcd/putrxlcd.c xlcd/readaddr.c xlcd/putsxlcd.c xlcd/writdata.c xlcd/setddram.c xlcd/wcmdxlcd.c xlcd/readdata.c xlcd/busyxlcd.c xlcd/openxlcd.c xlcd/setcgram.c daq.c hwconf.c pyro8722.c pyro_vector.c crit.c ringbufs.c mfc.c valve.c displays.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/xlcd/putrxlcd.o ${OBJECTDIR}/xlcd/readaddr.o ${OBJECTDIR}/xlcd/putsxlcd.o ${OBJECTDIR}/xlcd/writdata.o ${OBJECTDIR}/xlcd/setddram.o ${OBJECTDIR}/xlcd/wcmdxlcd.o ${OBJECTDIR}/xlcd/readdata.o ${OBJECTDIR}/xlcd/busyxlcd.o ${OBJECTDIR}/xlcd/openxlcd.o ${OBJECTDIR}/xlcd/setcgram.o ${OBJECTDIR}/daq.o ${OBJECTDIR}/hwconf.o ${OBJECTDIR}/pyro8722.o ${OBJECTDIR}/pyro_vector.o ${OBJECTDIR}/crit.o ${OBJECTDIR}/ringbufs.o ${OBJECTDIR}/mfc.o ${OBJECTDIR}/valve.o ${OBJECTDIR}/displays.o
POSSIBLE_DEPFILES=${OBJECTDIR}/xlcd/putrxlcd.o.d ${OBJECTDIR}/xlcd/readaddr.o.d ${OBJECTDIR}/xlcd/putsxlcd.o.d ${OBJECTDIR}/xlcd/writdata.o.d ${OBJECTDIR}/xlcd/setddram.o.d ${OBJECTDIR}/xlcd/wcmdxlcd.o.d ${OBJECTDIR}/xlcd/readdata.o.d ${OBJECTDIR}/xlcd/busyxlcd.o.d ${OBJECTDIR}/xlcd/openxlcd.o.d ${OBJECTDIR}/xlcd/setcgram.o.d ${OBJECTDIR}/daq.o.d ${OBJECTDIR}/hwconf.o.d ${OBJECTDIR}/pyro8722.o.d ${OBJECTDIR}/pyro_vector.o.d ${OBJECTDIR}/crit.o.d ${OBJECTDIR}/ringbufs.o.d ${OBJECTDIR}/mfc.o.d ${OBJECTDIR}/valve.o.d ${OBJECTDIR}/displays.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/xlcd/putrxlcd.o ${OBJECTDIR}/xlcd/readaddr.o ${OBJECTDIR}/xlcd/putsxlcd.o ${OBJECTDIR}/xlcd/writdata.o ${OBJECTDIR}/xlcd/setddram.o ${OBJECTDIR}/xlcd/wcmdxlcd.o ${OBJECTDIR}/xlcd/readdata.o ${OBJECTDIR}/xlcd/busyxlcd.o ${OBJECTDIR}/xlcd/openxlcd.o ${OBJECTDIR}/xlcd/setcgram.o ${OBJECTDIR}/daq.o ${OBJECTDIR}/hwconf.o ${OBJECTDIR}/pyro8722.o ${OBJECTDIR}/pyro_vector.o ${OBJECTDIR}/crit.o ${OBJECTDIR}/ringbufs.o ${OBJECTDIR}/mfc.o ${OBJECTDIR}/valve.o ${OBJECTDIR}/displays.o

# Source Files
SOURCEFILES=xlcd/putrxlcd.c xlcd/readaddr.c xlcd/putsxlcd.c xlcd/writdata.c xlcd/setddram.c xlcd/wcmdxlcd.c xlcd/readdata.c xlcd/busyxlcd.c xlcd/openxlcd.c xlcd/setcgram.c daq.c hwconf.c pyro8722.c pyro_vector.c crit.c ringbufs.c mfc.c valve.c displays.c


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
	${MAKE}  -f nbproject/Makefile-default.mk dist/${CND_CONF}/${IMAGE_TYPE}/p18pyro.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=18F8722
MP_PROCESSOR_OPTION_LD=18f8722
MP_LINKER_DEBUG_OPTION= -u_DEBUGCODESTART=0x1fd30 -u_DEBUGCODELEN=0x2d0 -u_DEBUGDATASTART=0xef4 -u_DEBUGDATALEN=0xb
# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/xlcd/putrxlcd.o: xlcd/putrxlcd.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/xlcd" 
	@${RM} ${OBJECTDIR}/xlcd/putrxlcd.o.d 
	@${RM} ${OBJECTDIR}/xlcd/putrxlcd.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -p$(MP_PROCESSOR_OPTION) -ml --extended -I ${MP_CC_DIR}/../h  -fo ${OBJECTDIR}/xlcd/putrxlcd.o   xlcd/putrxlcd.c 
	@${DEP_GEN} -d ${OBJECTDIR}/xlcd/putrxlcd.o 
	@${FIXDEPS} "${OBJECTDIR}/xlcd/putrxlcd.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/xlcd/readaddr.o: xlcd/readaddr.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/xlcd" 
	@${RM} ${OBJECTDIR}/xlcd/readaddr.o.d 
	@${RM} ${OBJECTDIR}/xlcd/readaddr.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -p$(MP_PROCESSOR_OPTION) -ml --extended -I ${MP_CC_DIR}/../h  -fo ${OBJECTDIR}/xlcd/readaddr.o   xlcd/readaddr.c 
	@${DEP_GEN} -d ${OBJECTDIR}/xlcd/readaddr.o 
	@${FIXDEPS} "${OBJECTDIR}/xlcd/readaddr.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/xlcd/putsxlcd.o: xlcd/putsxlcd.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/xlcd" 
	@${RM} ${OBJECTDIR}/xlcd/putsxlcd.o.d 
	@${RM} ${OBJECTDIR}/xlcd/putsxlcd.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -p$(MP_PROCESSOR_OPTION) -ml --extended -I ${MP_CC_DIR}/../h  -fo ${OBJECTDIR}/xlcd/putsxlcd.o   xlcd/putsxlcd.c 
	@${DEP_GEN} -d ${OBJECTDIR}/xlcd/putsxlcd.o 
	@${FIXDEPS} "${OBJECTDIR}/xlcd/putsxlcd.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/xlcd/writdata.o: xlcd/writdata.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/xlcd" 
	@${RM} ${OBJECTDIR}/xlcd/writdata.o.d 
	@${RM} ${OBJECTDIR}/xlcd/writdata.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -p$(MP_PROCESSOR_OPTION) -ml --extended -I ${MP_CC_DIR}/../h  -fo ${OBJECTDIR}/xlcd/writdata.o   xlcd/writdata.c 
	@${DEP_GEN} -d ${OBJECTDIR}/xlcd/writdata.o 
	@${FIXDEPS} "${OBJECTDIR}/xlcd/writdata.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/xlcd/setddram.o: xlcd/setddram.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/xlcd" 
	@${RM} ${OBJECTDIR}/xlcd/setddram.o.d 
	@${RM} ${OBJECTDIR}/xlcd/setddram.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -p$(MP_PROCESSOR_OPTION) -ml --extended -I ${MP_CC_DIR}/../h  -fo ${OBJECTDIR}/xlcd/setddram.o   xlcd/setddram.c 
	@${DEP_GEN} -d ${OBJECTDIR}/xlcd/setddram.o 
	@${FIXDEPS} "${OBJECTDIR}/xlcd/setddram.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/xlcd/wcmdxlcd.o: xlcd/wcmdxlcd.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/xlcd" 
	@${RM} ${OBJECTDIR}/xlcd/wcmdxlcd.o.d 
	@${RM} ${OBJECTDIR}/xlcd/wcmdxlcd.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -p$(MP_PROCESSOR_OPTION) -ml --extended -I ${MP_CC_DIR}/../h  -fo ${OBJECTDIR}/xlcd/wcmdxlcd.o   xlcd/wcmdxlcd.c 
	@${DEP_GEN} -d ${OBJECTDIR}/xlcd/wcmdxlcd.o 
	@${FIXDEPS} "${OBJECTDIR}/xlcd/wcmdxlcd.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/xlcd/readdata.o: xlcd/readdata.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/xlcd" 
	@${RM} ${OBJECTDIR}/xlcd/readdata.o.d 
	@${RM} ${OBJECTDIR}/xlcd/readdata.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -p$(MP_PROCESSOR_OPTION) -ml --extended -I ${MP_CC_DIR}/../h  -fo ${OBJECTDIR}/xlcd/readdata.o   xlcd/readdata.c 
	@${DEP_GEN} -d ${OBJECTDIR}/xlcd/readdata.o 
	@${FIXDEPS} "${OBJECTDIR}/xlcd/readdata.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/xlcd/busyxlcd.o: xlcd/busyxlcd.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/xlcd" 
	@${RM} ${OBJECTDIR}/xlcd/busyxlcd.o.d 
	@${RM} ${OBJECTDIR}/xlcd/busyxlcd.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -p$(MP_PROCESSOR_OPTION) -ml --extended -I ${MP_CC_DIR}/../h  -fo ${OBJECTDIR}/xlcd/busyxlcd.o   xlcd/busyxlcd.c 
	@${DEP_GEN} -d ${OBJECTDIR}/xlcd/busyxlcd.o 
	@${FIXDEPS} "${OBJECTDIR}/xlcd/busyxlcd.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/xlcd/openxlcd.o: xlcd/openxlcd.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/xlcd" 
	@${RM} ${OBJECTDIR}/xlcd/openxlcd.o.d 
	@${RM} ${OBJECTDIR}/xlcd/openxlcd.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -p$(MP_PROCESSOR_OPTION) -ml --extended -I ${MP_CC_DIR}/../h  -fo ${OBJECTDIR}/xlcd/openxlcd.o   xlcd/openxlcd.c 
	@${DEP_GEN} -d ${OBJECTDIR}/xlcd/openxlcd.o 
	@${FIXDEPS} "${OBJECTDIR}/xlcd/openxlcd.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/xlcd/setcgram.o: xlcd/setcgram.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/xlcd" 
	@${RM} ${OBJECTDIR}/xlcd/setcgram.o.d 
	@${RM} ${OBJECTDIR}/xlcd/setcgram.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -p$(MP_PROCESSOR_OPTION) -ml --extended -I ${MP_CC_DIR}/../h  -fo ${OBJECTDIR}/xlcd/setcgram.o   xlcd/setcgram.c 
	@${DEP_GEN} -d ${OBJECTDIR}/xlcd/setcgram.o 
	@${FIXDEPS} "${OBJECTDIR}/xlcd/setcgram.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/daq.o: daq.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/daq.o.d 
	@${RM} ${OBJECTDIR}/daq.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -p$(MP_PROCESSOR_OPTION) -ml --extended -I ${MP_CC_DIR}/../h  -fo ${OBJECTDIR}/daq.o   daq.c 
	@${DEP_GEN} -d ${OBJECTDIR}/daq.o 
	@${FIXDEPS} "${OBJECTDIR}/daq.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/hwconf.o: hwconf.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/hwconf.o.d 
	@${RM} ${OBJECTDIR}/hwconf.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -p$(MP_PROCESSOR_OPTION) -ml --extended -I ${MP_CC_DIR}/../h  -fo ${OBJECTDIR}/hwconf.o   hwconf.c 
	@${DEP_GEN} -d ${OBJECTDIR}/hwconf.o 
	@${FIXDEPS} "${OBJECTDIR}/hwconf.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/pyro8722.o: pyro8722.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/pyro8722.o.d 
	@${RM} ${OBJECTDIR}/pyro8722.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -p$(MP_PROCESSOR_OPTION) -ml --extended -I ${MP_CC_DIR}/../h  -fo ${OBJECTDIR}/pyro8722.o   pyro8722.c 
	@${DEP_GEN} -d ${OBJECTDIR}/pyro8722.o 
	@${FIXDEPS} "${OBJECTDIR}/pyro8722.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/pyro_vector.o: pyro_vector.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/pyro_vector.o.d 
	@${RM} ${OBJECTDIR}/pyro_vector.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -p$(MP_PROCESSOR_OPTION) -ml --extended -I ${MP_CC_DIR}/../h  -fo ${OBJECTDIR}/pyro_vector.o   pyro_vector.c 
	@${DEP_GEN} -d ${OBJECTDIR}/pyro_vector.o 
	@${FIXDEPS} "${OBJECTDIR}/pyro_vector.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/crit.o: crit.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/crit.o.d 
	@${RM} ${OBJECTDIR}/crit.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -p$(MP_PROCESSOR_OPTION) -ml --extended -I ${MP_CC_DIR}/../h  -fo ${OBJECTDIR}/crit.o   crit.c 
	@${DEP_GEN} -d ${OBJECTDIR}/crit.o 
	@${FIXDEPS} "${OBJECTDIR}/crit.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/ringbufs.o: ringbufs.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/ringbufs.o.d 
	@${RM} ${OBJECTDIR}/ringbufs.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -p$(MP_PROCESSOR_OPTION) -ml --extended -I ${MP_CC_DIR}/../h  -fo ${OBJECTDIR}/ringbufs.o   ringbufs.c 
	@${DEP_GEN} -d ${OBJECTDIR}/ringbufs.o 
	@${FIXDEPS} "${OBJECTDIR}/ringbufs.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/mfc.o: mfc.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/mfc.o.d 
	@${RM} ${OBJECTDIR}/mfc.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -p$(MP_PROCESSOR_OPTION) -ml --extended -I ${MP_CC_DIR}/../h  -fo ${OBJECTDIR}/mfc.o   mfc.c 
	@${DEP_GEN} -d ${OBJECTDIR}/mfc.o 
	@${FIXDEPS} "${OBJECTDIR}/mfc.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/valve.o: valve.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/valve.o.d 
	@${RM} ${OBJECTDIR}/valve.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -p$(MP_PROCESSOR_OPTION) -ml --extended -I ${MP_CC_DIR}/../h  -fo ${OBJECTDIR}/valve.o   valve.c 
	@${DEP_GEN} -d ${OBJECTDIR}/valve.o 
	@${FIXDEPS} "${OBJECTDIR}/valve.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/displays.o: displays.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/displays.o.d 
	@${RM} ${OBJECTDIR}/displays.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -p$(MP_PROCESSOR_OPTION) -ml --extended -I ${MP_CC_DIR}/../h  -fo ${OBJECTDIR}/displays.o   displays.c 
	@${DEP_GEN} -d ${OBJECTDIR}/displays.o 
	@${FIXDEPS} "${OBJECTDIR}/displays.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
else
${OBJECTDIR}/xlcd/putrxlcd.o: xlcd/putrxlcd.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/xlcd" 
	@${RM} ${OBJECTDIR}/xlcd/putrxlcd.o.d 
	@${RM} ${OBJECTDIR}/xlcd/putrxlcd.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -p$(MP_PROCESSOR_OPTION) -ml --extended -I ${MP_CC_DIR}/../h  -fo ${OBJECTDIR}/xlcd/putrxlcd.o   xlcd/putrxlcd.c 
	@${DEP_GEN} -d ${OBJECTDIR}/xlcd/putrxlcd.o 
	@${FIXDEPS} "${OBJECTDIR}/xlcd/putrxlcd.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/xlcd/readaddr.o: xlcd/readaddr.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/xlcd" 
	@${RM} ${OBJECTDIR}/xlcd/readaddr.o.d 
	@${RM} ${OBJECTDIR}/xlcd/readaddr.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -p$(MP_PROCESSOR_OPTION) -ml --extended -I ${MP_CC_DIR}/../h  -fo ${OBJECTDIR}/xlcd/readaddr.o   xlcd/readaddr.c 
	@${DEP_GEN} -d ${OBJECTDIR}/xlcd/readaddr.o 
	@${FIXDEPS} "${OBJECTDIR}/xlcd/readaddr.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/xlcd/putsxlcd.o: xlcd/putsxlcd.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/xlcd" 
	@${RM} ${OBJECTDIR}/xlcd/putsxlcd.o.d 
	@${RM} ${OBJECTDIR}/xlcd/putsxlcd.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -p$(MP_PROCESSOR_OPTION) -ml --extended -I ${MP_CC_DIR}/../h  -fo ${OBJECTDIR}/xlcd/putsxlcd.o   xlcd/putsxlcd.c 
	@${DEP_GEN} -d ${OBJECTDIR}/xlcd/putsxlcd.o 
	@${FIXDEPS} "${OBJECTDIR}/xlcd/putsxlcd.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/xlcd/writdata.o: xlcd/writdata.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/xlcd" 
	@${RM} ${OBJECTDIR}/xlcd/writdata.o.d 
	@${RM} ${OBJECTDIR}/xlcd/writdata.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -p$(MP_PROCESSOR_OPTION) -ml --extended -I ${MP_CC_DIR}/../h  -fo ${OBJECTDIR}/xlcd/writdata.o   xlcd/writdata.c 
	@${DEP_GEN} -d ${OBJECTDIR}/xlcd/writdata.o 
	@${FIXDEPS} "${OBJECTDIR}/xlcd/writdata.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/xlcd/setddram.o: xlcd/setddram.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/xlcd" 
	@${RM} ${OBJECTDIR}/xlcd/setddram.o.d 
	@${RM} ${OBJECTDIR}/xlcd/setddram.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -p$(MP_PROCESSOR_OPTION) -ml --extended -I ${MP_CC_DIR}/../h  -fo ${OBJECTDIR}/xlcd/setddram.o   xlcd/setddram.c 
	@${DEP_GEN} -d ${OBJECTDIR}/xlcd/setddram.o 
	@${FIXDEPS} "${OBJECTDIR}/xlcd/setddram.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/xlcd/wcmdxlcd.o: xlcd/wcmdxlcd.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/xlcd" 
	@${RM} ${OBJECTDIR}/xlcd/wcmdxlcd.o.d 
	@${RM} ${OBJECTDIR}/xlcd/wcmdxlcd.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -p$(MP_PROCESSOR_OPTION) -ml --extended -I ${MP_CC_DIR}/../h  -fo ${OBJECTDIR}/xlcd/wcmdxlcd.o   xlcd/wcmdxlcd.c 
	@${DEP_GEN} -d ${OBJECTDIR}/xlcd/wcmdxlcd.o 
	@${FIXDEPS} "${OBJECTDIR}/xlcd/wcmdxlcd.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/xlcd/readdata.o: xlcd/readdata.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/xlcd" 
	@${RM} ${OBJECTDIR}/xlcd/readdata.o.d 
	@${RM} ${OBJECTDIR}/xlcd/readdata.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -p$(MP_PROCESSOR_OPTION) -ml --extended -I ${MP_CC_DIR}/../h  -fo ${OBJECTDIR}/xlcd/readdata.o   xlcd/readdata.c 
	@${DEP_GEN} -d ${OBJECTDIR}/xlcd/readdata.o 
	@${FIXDEPS} "${OBJECTDIR}/xlcd/readdata.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/xlcd/busyxlcd.o: xlcd/busyxlcd.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/xlcd" 
	@${RM} ${OBJECTDIR}/xlcd/busyxlcd.o.d 
	@${RM} ${OBJECTDIR}/xlcd/busyxlcd.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -p$(MP_PROCESSOR_OPTION) -ml --extended -I ${MP_CC_DIR}/../h  -fo ${OBJECTDIR}/xlcd/busyxlcd.o   xlcd/busyxlcd.c 
	@${DEP_GEN} -d ${OBJECTDIR}/xlcd/busyxlcd.o 
	@${FIXDEPS} "${OBJECTDIR}/xlcd/busyxlcd.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/xlcd/openxlcd.o: xlcd/openxlcd.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/xlcd" 
	@${RM} ${OBJECTDIR}/xlcd/openxlcd.o.d 
	@${RM} ${OBJECTDIR}/xlcd/openxlcd.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -p$(MP_PROCESSOR_OPTION) -ml --extended -I ${MP_CC_DIR}/../h  -fo ${OBJECTDIR}/xlcd/openxlcd.o   xlcd/openxlcd.c 
	@${DEP_GEN} -d ${OBJECTDIR}/xlcd/openxlcd.o 
	@${FIXDEPS} "${OBJECTDIR}/xlcd/openxlcd.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/xlcd/setcgram.o: xlcd/setcgram.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/xlcd" 
	@${RM} ${OBJECTDIR}/xlcd/setcgram.o.d 
	@${RM} ${OBJECTDIR}/xlcd/setcgram.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -p$(MP_PROCESSOR_OPTION) -ml --extended -I ${MP_CC_DIR}/../h  -fo ${OBJECTDIR}/xlcd/setcgram.o   xlcd/setcgram.c 
	@${DEP_GEN} -d ${OBJECTDIR}/xlcd/setcgram.o 
	@${FIXDEPS} "${OBJECTDIR}/xlcd/setcgram.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/daq.o: daq.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/daq.o.d 
	@${RM} ${OBJECTDIR}/daq.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -p$(MP_PROCESSOR_OPTION) -ml --extended -I ${MP_CC_DIR}/../h  -fo ${OBJECTDIR}/daq.o   daq.c 
	@${DEP_GEN} -d ${OBJECTDIR}/daq.o 
	@${FIXDEPS} "${OBJECTDIR}/daq.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/hwconf.o: hwconf.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/hwconf.o.d 
	@${RM} ${OBJECTDIR}/hwconf.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -p$(MP_PROCESSOR_OPTION) -ml --extended -I ${MP_CC_DIR}/../h  -fo ${OBJECTDIR}/hwconf.o   hwconf.c 
	@${DEP_GEN} -d ${OBJECTDIR}/hwconf.o 
	@${FIXDEPS} "${OBJECTDIR}/hwconf.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/pyro8722.o: pyro8722.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/pyro8722.o.d 
	@${RM} ${OBJECTDIR}/pyro8722.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -p$(MP_PROCESSOR_OPTION) -ml --extended -I ${MP_CC_DIR}/../h  -fo ${OBJECTDIR}/pyro8722.o   pyro8722.c 
	@${DEP_GEN} -d ${OBJECTDIR}/pyro8722.o 
	@${FIXDEPS} "${OBJECTDIR}/pyro8722.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/pyro_vector.o: pyro_vector.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/pyro_vector.o.d 
	@${RM} ${OBJECTDIR}/pyro_vector.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -p$(MP_PROCESSOR_OPTION) -ml --extended -I ${MP_CC_DIR}/../h  -fo ${OBJECTDIR}/pyro_vector.o   pyro_vector.c 
	@${DEP_GEN} -d ${OBJECTDIR}/pyro_vector.o 
	@${FIXDEPS} "${OBJECTDIR}/pyro_vector.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/crit.o: crit.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/crit.o.d 
	@${RM} ${OBJECTDIR}/crit.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -p$(MP_PROCESSOR_OPTION) -ml --extended -I ${MP_CC_DIR}/../h  -fo ${OBJECTDIR}/crit.o   crit.c 
	@${DEP_GEN} -d ${OBJECTDIR}/crit.o 
	@${FIXDEPS} "${OBJECTDIR}/crit.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/ringbufs.o: ringbufs.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/ringbufs.o.d 
	@${RM} ${OBJECTDIR}/ringbufs.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -p$(MP_PROCESSOR_OPTION) -ml --extended -I ${MP_CC_DIR}/../h  -fo ${OBJECTDIR}/ringbufs.o   ringbufs.c 
	@${DEP_GEN} -d ${OBJECTDIR}/ringbufs.o 
	@${FIXDEPS} "${OBJECTDIR}/ringbufs.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/mfc.o: mfc.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/mfc.o.d 
	@${RM} ${OBJECTDIR}/mfc.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -p$(MP_PROCESSOR_OPTION) -ml --extended -I ${MP_CC_DIR}/../h  -fo ${OBJECTDIR}/mfc.o   mfc.c 
	@${DEP_GEN} -d ${OBJECTDIR}/mfc.o 
	@${FIXDEPS} "${OBJECTDIR}/mfc.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/valve.o: valve.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/valve.o.d 
	@${RM} ${OBJECTDIR}/valve.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -p$(MP_PROCESSOR_OPTION) -ml --extended -I ${MP_CC_DIR}/../h  -fo ${OBJECTDIR}/valve.o   valve.c 
	@${DEP_GEN} -d ${OBJECTDIR}/valve.o 
	@${FIXDEPS} "${OBJECTDIR}/valve.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/displays.o: displays.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/displays.o.d 
	@${RM} ${OBJECTDIR}/displays.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -p$(MP_PROCESSOR_OPTION) -ml --extended -I ${MP_CC_DIR}/../h  -fo ${OBJECTDIR}/displays.o   displays.c 
	@${DEP_GEN} -d ${OBJECTDIR}/displays.o 
	@${FIXDEPS} "${OBJECTDIR}/displays.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
dist/${CND_CONF}/${IMAGE_TYPE}/p18pyro.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_LD} $(MP_EXTRA_LD_PRE)   -p$(MP_PROCESSOR_OPTION_LD)  -w -x -u_DEBUG -m"${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map" -u_EXTENDEDMODE -z__MPLAB_BUILD=1  -u_CRUNTIME -z__MPLAB_DEBUG=1 -z__MPLAB_DEBUGGER_ICD3=1 $(MP_LINKER_DEBUG_OPTION) -l ${MP_CC_DIR}/../lib  -o dist/${CND_CONF}/${IMAGE_TYPE}/p18pyro.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}   
else
dist/${CND_CONF}/${IMAGE_TYPE}/p18pyro.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_LD} $(MP_EXTRA_LD_PRE)   -p$(MP_PROCESSOR_OPTION_LD)  -w  -m"${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map" -u_EXTENDEDMODE -z__MPLAB_BUILD=1  -u_CRUNTIME -l ${MP_CC_DIR}/../lib  -o dist/${CND_CONF}/${IMAGE_TYPE}/p18pyro.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}   
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
