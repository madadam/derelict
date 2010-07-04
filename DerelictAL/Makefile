include ../inc/$(PLATFORM)_inc.mak
include ../inc/compiler_inc.mak

AL_SRC= \
    derelict/openal/al.d \
    derelict/openal/alfuncs.d \
    derelict/openal/altypes.d   
    
PACKAGE_PATH=derelict/openal

all : DerelictAL

$(LIB_PRE)DerelictAL.$(LIB_EXT) :
	$(DC) $(DFLAGS) $(DFLAGS_REQ) $(AL_SRC) $(HD)/$(PACKAGE_PATH) $(OF)$@
	$(CP) $@ $(LIB_DEST)
	$(RM) $@

DerelictAL : $(LIB_PRE)DerelictAL.$(LIB_EXT)
