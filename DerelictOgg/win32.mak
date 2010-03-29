include ..\inc\win32_inc.mak
include ..\inc\compiler_inc.mak

all : DerelictOgg

OGG_SRC= \
	derelict\ogg\ogg.d \
    derelict\ogg\oggfuncs.d \
    derelict\ogg\oggtypes.d
    
DerelictOgg.lib :
	$(DC) $(DFLAGS) $(OGG_SRC) $(HD_OGG) $(OF)$@
	$(CP) $@ $(LIB_DEST)
	$(RM) $@

DerelictOgg : DerelictOgg.lib
