include ../inc/$(PLATFORM)_inc.mak
include ../inc/compiler_inc.mak

PACKAGE_PATH=derelict/ogg

all : DerelictOgg DerelictVorbis DerelictVorbisEnc DerelictVorbisFile

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
	
VF_SRC= \
	derelict/ogg/vorbisfile.d \
	derelict/ogg/vorbisfilefuncs.d \
	derelict/ogg/vorbisfiletypes.d 
    
$(LIB_PRE)DerelictOgg.$(LIB_EXT) :
	$(DC) $(DFLAGS) $(OGG_SRC) $(HD)/$(PACKAGE_PATH) $(OF)$@
	$(CP) $@ $(LIB_DEST)
	$(RM) $@
	
$(LIB_PRE)DerelictVorbis.$(LIB_EXT) :
	$(DC) $(DFLAGS) $(V_SRC) $(HD)/$(PACKAGE_PATH) $(OF)$@
	$(CP) $@ $(LIB_DEST)
	$(RM) $@
	
$(LIB_PRE)DerelictVorbisEnc.$(LIB_EXT) :
	$(DC) $(DFLAGS) $(VE_SRC) $(HD)/$(PACKAGE_PATH) $(OF)$@
	$(CP) $@ $(LIB_DEST)
	$(RM) $@
	
$(LIB_PRE)DerelictVorbisFile.$(LIB_EXT) :
	$(DC) $(DFLAGS) $(VE_SRC) $(HD)/$(PACKAGE_PATH) $(OF)$@
	$(CP) $@ $(LIB_DEST)
	$(RM) $@

DerelictOgg : $(LIB_PRE)DerelictOgg.$(LIB_EXT)
DerelictVorbis : $(LIB_PRE)DerelictVorbis.$(LIB_EXT)
DerelictVorbisEnc : $(LIB_PRE)DerelictVorbisEnc.$(LIB_EXT)
DerelictVorbisFile : $(LIB_PRE)DerelictVorbisFile.$(LIB_EXT)
