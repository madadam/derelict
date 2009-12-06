CP=copy /y
RM=del /f /q
DFLAGS=-release -O -inline -lib -I..\DerelictUtil
DC=dmd
LIB_DEST=..\lib

all : DerelictUtil


ALL_SRC= \
    derelict\util\compat.d \
    derelict\util\exception.d \
    derelict\util\loader.d \
    derelict\util\sharedlib.d \
    derelict\util\wintypes.d

DerelictUtil.lib :
	$(DC) $(DFLAGS) -lib $(ALL_SRC) -of$@
	$(CP) $@ $(LIB_DEST)
	$(RM) $@
	
DerelictUtil : DerelictUtil.lib
