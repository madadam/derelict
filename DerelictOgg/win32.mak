include ..\inc\win32_inc.mak
include ..\inc\compiler_inc.mak

all : DerelictOgg DerelictVorbisCodec

OGG_SRC= \
	derelict\ogg\ogg.d \
    derelict\ogg\oggfuncs.d \
    derelict\ogg\oggtypes.d
    
VC_SRC= \
	derelict\ogg\vorbiscodec.d \
	derelict\ogg\vcfuncs.d \
	derelict\ogg\vctypes.d
    
DerelictOgg.lib :
	$(DC) $(DFLAGS) $(OGG_SRC) $(HD_OGG) $(OF)$@
	$(CP) $@ $(LIB_DEST)
	$(RM) $@
	
DerelictVorbisCodec.lib :
	$(DC) $(DFLAGS) $(OGG_SRC) $(HD_OGG) $(OF)$@
	$(CP) $@ $(LIB_DEST)
	$(RM) $@

DerelictOgg : DerelictOgg.lib
DerelictVorbisCodec : DerelictVorbisCodec.lib
