include ../inc/$(PLATFORM)_inc.mak
include ../inc/compiler_inc.mak

AL_SRC= \
    derelict/fmod/fmodex.d \
    derelict/fmod/fmodexfuncs.d \
    derelict/fmod/fmodextypes.d   
    
PACKAGE_PATH=derelict/fmod

all : DerelictFMODEX

$(LIB_PRE)DerelictFMODEX.$(LIB_EXT) :
	$(DC) $(DFLAGS) $(AL_SRC) $(HD)/$(PACKAGE_PATH) $(OF)$@
	$(CP) $@ $(LIB_DEST)
	$(RM) $@

DerelictFMODEX : $(LIB_PRE)DerelictFMODEX.$(LIB_EXT)
