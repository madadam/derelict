include ..\inc\win32_inc.mak
include ..\inc\compiler_inc.mak

all : DerelictOgg DerelictVorbis DerelictVorbisEnc

OGG_SRC= \
	derelict\ogg\ogg.d \
    derelict\ogg\oggfuncs.d \
    derelict\ogg\oggtypes.d
    
V_SRC= \
	derelict\ogg\vorbis.d \
	derelict\ogg\vorbisfuncs.d \
	derelict\ogg\vorbistypes.d
	
VE_SRC= \
	derelict\ogg\vorbisenc.d \
	derelict\ogg\vorbisencfuncs.d \
	derelict\ogg\vorbisenctypes.d 
    
DerelictOgg.lib :
	$(DC) $(DFLAGS) $(OGG_SRC) $(HD_OGG) $(OF)$@
	$(CP) $@ $(LIB_DEST)
	$(RM) $@
	
DerelictVorbis.lib :
	$(DC) $(DFLAGS) $(V_SRC) $(HD_OGG) $(OF)$@
	$(CP) $@ $(LIB_DEST)
	$(RM) $@
	
DerelictVorbisEnc.lib :
	$(DC) $(DFLAGS) $(VE_SRC) $(HD_OGG) $(OF)$@
	$(CP) $@ $(LIB_DEST)
	$(RM) $@

DerelictOgg : DerelictOgg.lib
DerelictVorbis : DerelictVorbis.lib
DerelictVorbisEnc : DerelictVorbisEnc.lib
