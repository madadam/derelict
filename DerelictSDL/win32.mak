include ..\inc\win32_inc.mak

all : DerelictSDL DerelictSDLImage DerelictSDLMixer DerelictSDLNet DerelictSDLttf

SDL_SRC= \
	derelict\sdl\sdl.d \
    derelict\sdl\sdlfuncs.d \
    derelict\sdl\sdltypes.d
    
IMG_SRC= derelict\sdl\image.d

MIX_SRC= derelict\sdl\mixer.d

NET_SRC= derelict\sdl\net.d 

TTF_SRC= derelict\sdl\ttf.d

DerelictSDL.lib :
	$(DC) $(DFLAGS) $(SDL_SRC) $(HD_SDL) $(OF)$@
	$(CP) $@ $(LIB_DEST)
	$(RM) $@

DerelictSDLImage.lib :
	$(DC) $(DFLAGS) $(IMG_SRC) $(HD_SDL) $(OF)$@
	$(CP) $@ $(LIB_DEST)
	$(RM) $@

DerelictSDLMixer.lib :
	$(DC) $(DFLAGS) $(MIX_SRC) $(HD_SDL) $(OF)$@
	$(CP) $@ $(LIB_DEST)
	$(RM) $@

DerelictSDLNet.lib :
	$(DC) $(DFLAGS) $(NET_SRC) $(HD_SDL) $(OF)$@
	$(CP) $@ $(LIB_DEST)
	$(RM) $@

DerelictSDLttf.lib :
	$(DC) $(DFLAGS) $(TTF_SRC) $(HD_SDL) $(OF)$@
	$(CP) $@ $(LIB_DEST)
	$(RM) $@

DerelictSDL : DerelictSDL.lib
DerelictSDLImage : DerelictSDLImage.lib
DerelictSDLMixer : DerelictSDLMixer.lib
DerelictSDLNet : DerelictSDLNet.lib
DerelictSDLttf : DerelictSDLttf.lib
