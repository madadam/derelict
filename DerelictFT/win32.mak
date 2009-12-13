CP=copy /y
RM=del /f /q
DFLAGS=-release -O -inline -lib -I..\DerelictUtil
DC=dmd
LIB_DEST=..\lib

all : DerelictFT

FT_SRC= \
    derelict\freetype\ft.d \
    derelict\freetype\ftfuncs.d \
    derelict\freetype\fttypes.d

DerelictFT.lib :
	$(DC) $(DFLAGS) $(FT_SRC) -of$@
	$(CP) $@ $(LIB_DEST)
	$(RM) $@

DerelictFT : DerelictFT.lib
	