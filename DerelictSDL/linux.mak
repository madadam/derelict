include ../inc/linux_inc.mak

all : DerelictSDL DerelictSDLImage DerelictSDLMixer DerelictSDLNet DerelictSDLttf

SDL_SRC= \
	derelict/sdl/sdl.d \
    derelict/sdl/sdlfuncs.d \
    derelict/sdl/sdltypes.d
    
IMG_SRC= derelict/sdl/image.d

MIX_SRC= derelict/sdl/mixer.d

NET_SRC= derelict/sdl/net.d 

TTF_SRC= derelict/sdl/ttf.d

libDerelictSDL.a :
	$(DC) $(DFLAGS) $(SDL_SRC) $(HD_SDL) -of$@
	$(CP) $@ $(LIB_DEST)
	$(RM) $@

libDerelictSDLImage.a :
	$(DC) $(DFLAGS) $(IMG_SRC) $(HD_SDL) -of$@
	$(CP) $@ $(LIB_DEST)
	$(RM) $@

libDerelictSDLMixer.a :
	$(DC) $(DFLAGS) $(MIX_SRC) $(HD_SDL) -of$@
	$(CP) $@ $(LIB_DEST)
	$(RM) $@

libDerelictSDLNet.a :
	$(DC) $(DFLAGS) $(NET_SRC) $(HD_SDL) -of$@
	$(CP) $@ $(LIB_DEST)
	$(RM) $@

libDerelictSDLttf.a :
	$(DC) $(DFLAGS) $(TTF_SRC) $(HD_SDL) -of$@
	$(CP) $@ $(LIB_DEST)
	$(RM) $@

DerelictSDL : libDerelictSDL.a
DerelictSDLImage : libDerelictSDLImage.a
DerelictSDLMixer : libDerelictSDLMixer.a
DerelictSDLNet : libDerelictSDLNet.a
DerelictSDLttf : libDerelictSDLttf.a
