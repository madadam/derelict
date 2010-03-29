include ..\inc\$(PLATFORM)_inc.mak
include ..\inc\compiler_inc.mak

all : DerelictOgg DerelictVorbis DerelictVorbisEnc

OGG_SRC= \
	derelict/ogg/ogg.d \
    derelict/ogg/oggfuncs.d \
    derelict/ogg/oggtypes.d
    
V_SRC= \
	derelict/ogg/vorbis.d \
	derelict/ogg/vorbisfuncs.d \
	derelict/ogg/vorbistypes.d  
	
VE_SRC= \
	derelict/ogg/vorbisenc.d \
	derelict/ogg/vorbisencfuncs.d \
	derelict/ogg/vorbisenctypes.d 
    
$(LIB_PRE)DerelictOgg.$(LIB_EXT) :
	$(DC) $(DFLAGS) $(OGG_SRC) $(HD_OGG) $(OF)$@
	$(CP) $@ $(LIB_DEST)
	$(RM) $@
	
$(LIB_PRE)DerelictVorbis.$(LIB_EXT) :
	$(DC) $(DFLAGS) $(V_SRC) $(HD_OGG) $(OF)$@
	$(CP) $@ $(LIB_DEST)
	$(RM) $@
	
$(LIB_PRE)DerelictVorbisEnc.$(LIB_EXT) :
	$(DC) $(DFLAGS) $(VE_SRC) $(HD_OGG) $(OF)$@
	$(CP) $@ $(LIB_DEST)
	$(RM) $@

DerelictOgg : $(LIB_PRE)DerelictOgg.$(LIB_EXT)
DerelictVorbis : $(LIB_PRE)DerelictVorbis.$(LIB_EXT)
DerelictVorbisEnc : $(LIB_PRE)DerelictVorbisEnc.$(LIB_EXT)
