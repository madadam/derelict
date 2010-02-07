include ..\inc\win32_inc.mak

all : DerelictIL DerelictILU DerelictILUT

IL_SRC= \
	derelict\devil\il.d \
    derelict\devil\ilfuncs.d \
    derelict\devil\iltypes.d
    
ILU_SRC= \
	derelict\devil\ilu.d \
    derelict\devil\ilufuncs.d \
    derelict\devil\ilutypes.d
    
ILUT_SRC= \
	derelict\devil\ilut.d \
    derelict\devil\ilutfuncs.d \
    derelict\devil\iluttypes.d
    
DerelictIL.lib :
	$(DC) $(DFLAGS) $(IL_SRC) $(HD_IL) $(OF)$@
	$(CP) $@ $(LIB_DEST)
	$(RM) $@

DerelictILU.lib :
	$(DC) $(DFLAGS) $(ILU_SRC) $(HD_IL) $(OF)$@
	$(CP) $@ $(LIB_DEST)
	$(RM) $@

DerelictILUT.lib :
	$(DC) $(DFLAGS) $(ILUT_SRC) $(HD_IL) $(OF)$@
	$(CP) $@ $(LIB_DEST)
	$(RM) $@

DerelictIL : DerelictIL.lib
DerelictILU : DerelictILU.lib
DerelictILUT : DerelictILUT.lib
