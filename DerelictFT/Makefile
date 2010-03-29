include ../inc/$(PLATFORM)_inc.mak
include ../inc/compiler_inc.mak

PACKAGE_PATH=derelict/freetype

all : DerelictFT

FT_SRC= \
    derelict/freetype/ft.d \
    derelict/freetype/ftfuncs.d \
    derelict/freetype/fttypes.d

$(LIB_PRE)DerelictFT.$(LIB_EXT) :
	$(DC) $(DFLAGS) $(FT_SRC) $(HD)/$(PACKAGE_PATH) $(OF)$@
	$(CP) $@ $(LIB_DEST)
	$(RM) $@

DerelictFT : $(LIB_PRE)DerelictFT.$(LIB_EXT)	
