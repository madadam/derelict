include ../inc/linux_inc.mak

all : DerelictFT

FT_SRC= \
    derelict/freetype/ft.d \
    derelict/freetype/ftfuncs.d \
    derelict/freetype/fttypes.d

libDerelictFT.a :
	$(DC) $(DFLAGS) $(FT_SRC) $(HD_FT) -of$@
	$(CP) $@ $(LIB_DEST)
	$(RM) $@

DerelictFT : libDerelictFT.a
	
