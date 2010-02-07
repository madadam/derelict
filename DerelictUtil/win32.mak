include ..\inc\win32_inc.mak

all : DerelictUtil

ALL_SRC= \
    derelict\util\compat.d \
    derelict\util\exception.d \
    derelict\util\loader.d \
    derelict\util\sharedlib.d \
    derelict\util\wintypes.d

DerelictUtil.lib :
	$(DC) $(DFLAGS) $(ALL_SRC) $(HD_UTIL) $(OF)$@
	$(CP) $@ $(LIB_DEST)
	$(RM) $@
	
DerelictUtil : DerelictUtil.lib
