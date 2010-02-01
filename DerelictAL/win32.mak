include ..\inc\win32_inc.mak

all : DerelictAL

AL_SRC= \
    derelict\openal\al.d \
    derelict\openal\alfuncs.d \
    derelict\openal\altypes.d

DerelictAL.lib :
	$(DC) $(DFLAGS) $(AL_SRC) $(HD_AL) -of$@
	$(CP) $@ $(LIB_DEST)
	$(RM) $@

DerelictAL : DerelictAL.lib
	