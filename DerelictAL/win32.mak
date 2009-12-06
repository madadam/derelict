CP=copy /y
RM=del /f /q
DFLAGS=-release -O -inline -lib -I..\DerelictUtil
DC=dmd
LIB_DEST=..\lib

all : DerelictAL

AL_SRC= \
    derelict\openal\al.d \
    derelict\openal\alfuncs.d \
    derelict\openal\altypes.d

DerelictAL.lib :
	$(DC) $(DFLAGS) $(AL_SRC) -of$@
	$(CP) $@ $(LIB_DEST)
	$(RM) $@

DerelictAL : DerelictAL.lib
	