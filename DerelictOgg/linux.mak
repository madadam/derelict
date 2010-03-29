include ..\inc\linux_inc.mak
include ..\inc\compiler_inc.mak

all : DerelictOgg

OGG_SRC= \
	derelict/ogg/ogg.d \
    derelict/ogg/oggfuncs.d \
    derelict/ogg/oggtypes.d
    
DerelictOgg.a :
	$(DC) $(DFLAGS) $(OGG_SRC) $(HD_OGG) $(OF)$@
	$(CP) $@ $(LIB_DEST)
	$(RM) $@

DerelictOgg : DerelictOgg.a
