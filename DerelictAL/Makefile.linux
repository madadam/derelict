CP=cp -f
RM=rm -rf
DFLAGS=-release -O -inline -lib -I../DerelictUtil
DC=dmd
LIB_DEST=../lib

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
	
