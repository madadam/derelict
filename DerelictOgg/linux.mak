include ..\inc\linux_inc.mak
include ..\inc\compiler_inc.mak

all : DerelictOgg DerelictVorbis

OGG_SRC= \
	derelict/ogg/ogg.d \
    derelict/ogg/oggfuncs.d \
    derelict/ogg/oggtypes.d
    
V_SRC= \
	derelict/ogg/vorbis.d \
	derelict/ogg/vorbisfuncs.d \
	derelict/ogg/vorbistypes.d   
    
DerelictOgg.a :
	$(DC) $(DFLAGS) $(OGG_SRC) $(HD_OGG) $(OF)$@
	$(CP) $@ $(LIB_DEST)
	$(RM) $@
	
DerelictVorbis.a :
	$(DC) $(DFLAGS) $(V_SRC) $(HD_OGG) $(OF)$@
	$(CP) $@ $(LIB_DEST)
	$(RM) $@

DerelictOgg : DerelictOgg.a
DerelictVorbis : DerelictVorbis.a
