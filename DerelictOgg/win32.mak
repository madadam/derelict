include ..\inc\win32_inc.mak
include ..\inc\compiler_inc.mak

all : DerelictOgg DerelictVorbis

OGG_SRC= \
	derelict\ogg\ogg.d \
    derelict\ogg\oggfuncs.d \
    derelict\ogg\oggtypes.d
    
V_SRC= \
	derelict\ogg\vorbis.d \
	derelict\ogg\vfuncs.d \
	derelict\ogg\vtypes.d
    
DerelictOgg.lib :
	$(DC) $(DFLAGS) $(OGG_SRC) $(HD_OGG) $(OF)$@
	$(CP) $@ $(LIB_DEST)
	$(RM) $@
	
DerelictVorbis.lib :
	$(DC) $(DFLAGS) $(V_SRC) $(HD_OGG) $(OF)$@
	$(CP) $@ $(LIB_DEST)
	$(RM) $@

DerelictOgg : DerelictOgg.lib
DerelictVorbis : DerelictVorbis.lib
