include ../inc/$(PLATFORM)_inc.mak
include ../inc/compiler_inc.mak

AL_SRC= \
    derelict/openal/al.d \
    derelict/openal/alfuncs.d \
    derelict/openal/altypes.d   

all : DerelictAL

$(LIB_PRE)DerelictAL.$(LIB_EXT) :
	$(DC) $(DFLAGS) $(AL_SRC) $(HD_AL) $(OF)$@
	$(CP) $@ $(LIB_DEST)
	$(RM) $@

DerelictAL : $(LIB_PRE)DerelictAL.$(LIB_EXT)
