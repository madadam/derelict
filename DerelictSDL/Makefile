include ../inc/$(PLATFORM)_inc.mak
include ../inc/compiler_inc.mak

PACKAGE_PATH=derelict/sdl

all : DerelictSDL DerelictSDLImage DerelictSDLMixer DerelictSDLNet DerelictSDLttf

SDL_SRC= \
	derelict/sdl/sdl.d \
    derelict/sdl/sdlfuncs.d \
    derelict/sdl/sdltypes.d
    
IMG_SRC= derelict/sdl/image.d

MIX_SRC= derelict/sdl/mixer.d

NET_SRC= derelict/sdl/net.d 

TTF_SRC= derelict/sdl/ttf.d

$(LIB_PRE)DerelictSDL.$(LIB_EXT) :
	$(DC) $(DFLAGS) $(SDL_SRC) $(HD)/$(PACKAGE_PATH) $(OF)$@
	$(CP) $@ $(LIB_DEST)
	$(RM) $@

$(LIB_PRE)DerelictSDLImage.$(LIB_EXT) :
	$(DC) $(DFLAGS) $(IMG_SRC) $(HD)/$(PACKAGE_PATH) $(OF)$@
	$(CP) $@ $(LIB_DEST)
	$(RM) $@

$(LIB_PRE)DerelictSDLMixer.$(LIB_EXT) :
	$(DC) $(DFLAGS) $(MIX_SRC) $(HD)/$(PACKAGE_PATH) $(OF)$@
	$(CP) $@ $(LIB_DEST)
	$(RM) $@

$(LIB_PRE)DerelictSDLNet.$(LIB_EXT) :
	$(DC) $(DFLAGS) $(NET_SRC) $(HD)/$(PACKAGE_PATH) $(OF)$@
	$(CP) $@ $(LIB_DEST)
	$(RM) $@

$(LIB_PRE)DerelictSDLttf.$(LIB_EXT) :
	$(DC) $(DFLAGS) $(TTF_SRC) $(HD)/$(PACKAGE_PATH) $(OF)$@
	$(CP) $@ $(LIB_DEST)
	$(RM) $@

DerelictSDL : $(LIB_PRE)DerelictSDL.$(LIB_EXT)
DerelictSDLImage : $(LIB_PRE)DerelictSDLImage.$(LIB_EXT)
DerelictSDLMixer : $(LIB_PRE)DerelictSDLMixer.$(LIB_EXT)
DerelictSDLNet : $(LIB_PRE)DerelictSDLNet.$(LIB_EXT)
DerelictSDLttf : $(LIB_PRE)DerelictSDLttf.$(LIB_EXT)
