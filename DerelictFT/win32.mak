include ..\inc\win32_inc.mak
include ..\inc\compiler_inc.mak

all : DerelictFT

FT_SRC= \
    derelict\freetype\ft.d \
    derelict\freetype\ftfuncs.d \
    derelict\freetype\fttypes.d

DerelictFT.lib :
	$(DC) $(DFLAGS) $(FT_SRC) $(HD_FT) $(OF)$@
	$(CP) $@ $(LIB_DEST)
	$(RM) $@

DerelictFT : DerelictFT.lib
	