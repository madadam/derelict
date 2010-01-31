CP=cp -f
RM=rm -rf
DFLAGS=-release -O -inline -lib -I../DerelictUtil
DC=dmd
LIB_DEST=../lib

all : DerelictFT

FT_SRC= \
    derelict/freetype/ft.d \
    derelict/freetype/ftfuncs.d \
    derelict/freetype/fttypes.d

libDerelictFT.a :
	$(DC) $(DFLAGS) $(FT_SRC) -of$@
	$(CP) $@ $(LIB_DEST)
	$(RM) $@

DerelictFT : libDerelictFT.a
	
