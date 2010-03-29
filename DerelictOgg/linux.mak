include ..\inc\linux_inc.mak
include ..\inc\compiler_inc.mak

all : DerelictOgg DerelictVorbisCodec

OGG_SRC= \
	derelict/ogg/ogg.d \
    derelict/ogg/oggfuncs.d \
    derelict/ogg/oggtypes.d
    
VC_SRC= \
	derelict/ogg/vorbiscodec.d \
	derelict/ogg/vcfuncs.d \
	derelict/ogg/vctypes.d   
    
DerelictOgg.a :
	$(DC) $(DFLAGS) $(OGG_SRC) $(HD_OGG) $(OF)$@
	$(CP) $@ $(LIB_DEST)
	$(RM) $@
	
DerelictVorbisCodec.a :
	$(DC) $(DFLAGS) $(OGG_SRC) $(HD_OGG) $(OF)$@
	$(CP) $@ $(LIB_DEST)
	$(RM) $@

DerelictOgg : DerelictOgg.a
DerelictVorbisCodec : DerelictVorbisCodec.a
