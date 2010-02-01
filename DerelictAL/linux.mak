include ../inc/linux_inc.mak

all : DerelictAL

AL_SRC= \
    derelict/openal/al.d \
    derelict/openal/alfuncs.d \
    derelict/openal/altypes.d

libDerelictAL.a :
	$(DC) $(DFLAGS) $(AL_SRC) -of$@
	$(CP) $@ $(LIB_DEST)
	$(RM) $@

DerelictAL : libDerelictAL.a
	
