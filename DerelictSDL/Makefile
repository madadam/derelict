include ../inc/$(PLATFORM)_inc.mak
include ../inc/compiler_inc.mak

PACKAGE_PATH=derelict/sdl

all : DerelictSDL DerelictSDLImage DerelictSDLMixer DerelictSDLNet DerelictSDLttf

SDL_SRC= \
	derelict/sdl/sdl.d \
    derelict/sdl/sdlfuncs.d \
    derelict/sdl/sdltypes.d \
	derelict/sdl/macinit/CoreFoundation.d \
	derelict/sdl/macinit/DerelictSDLMacLoader.d \
	derelict/sdl/macinit/ID.d \
	derelict/sdl/macinit/MacTypes.d \
	derelict/sdl/macinit/NSApplication.d \
	derelict/sdl/macinit/NSArray.d \
	derelict/sdl/macinit/NSAutoreleasePool.d \
	derelict/sdl/macinit/NSDictionary.d \
	derelict/sdl/macinit/NSEnumerator.d \
	derelict/sdl/macinit/NSEvent.d \
	derelict/sdl/macinit/NSGeometry.d \
	derelict/sdl/macinit/NSMenu.d \
	derelict/sdl/macinit/NSMenuItem.d \
	derelict/sdl/macinit/NSNotification.d \
	derelict/sdl/macinit/NSObject.d \
	derelict/sdl/macinit/NSProcessInfo.d \
	derelict/sdl/macinit/NSString.d \
	derelict/sdl/macinit/NSZone.d \
	derelict/sdl/macinit/runtime.d \
	derelict/sdl/macinit/SDLMain.d \
	derelict/sdl/macinit/selectors.d \
	derelict/sdl/macinit/string.d
    
IMG_SRC= derelict/sdl/image.d

MIX_SRC= derelict/sdl/mixer.d

NET_SRC= derelict/sdl/net.d 

TTF_SRC= derelict/sdl/ttf.d

$(LIB_PRE)DerelictSDL.$(LIB_EXT) :
	$(DC) $(DFLAGS) $(DFLAGS_REQ) $(SDL_SRC) $(HD)/$(PACKAGE_PATH) $(OF)$@
	$(CP) $@ $(LIB_DEST)
	$(RM) $@

$(LIB_PRE)DerelictSDLImage.$(LIB_EXT) :
	$(DC) $(DFLAGS) $(DFLAGS_REQ) $(IMG_SRC) $(HD)/$(PACKAGE_PATH) $(OF)$@
	$(CP) $@ $(LIB_DEST)
	$(RM) $@

$(LIB_PRE)DerelictSDLMixer.$(LIB_EXT) :
	$(DC) $(DFLAGS) $(DFLAGS_REQ) $(MIX_SRC) $(HD)/$(PACKAGE_PATH) $(OF)$@
	$(CP) $@ $(LIB_DEST)
	$(RM) $@

$(LIB_PRE)DerelictSDLNet.$(LIB_EXT) :
	$(DC) $(DFLAGS) $(DFLAGS_REQ) $(NET_SRC) $(HD)/$(PACKAGE_PATH) $(OF)$@
	$(CP) $@ $(LIB_DEST)
	$(RM) $@

$(LIB_PRE)DerelictSDLttf.$(LIB_EXT) :
	$(DC) $(DFLAGS) $(DFLAGS_REQ) $(TTF_SRC) $(HD)/$(PACKAGE_PATH) $(OF)$@
	$(CP) $@ $(LIB_DEST)
	$(RM) $@

DerelictSDL : $(LIB_PRE)DerelictSDL.$(LIB_EXT)
DerelictSDLImage : $(LIB_PRE)DerelictSDLImage.$(LIB_EXT)
DerelictSDLMixer : $(LIB_PRE)DerelictSDLMixer.$(LIB_EXT)
DerelictSDLNet : $(LIB_PRE)DerelictSDLNet.$(LIB_EXT)
DerelictSDLttf : $(LIB_PRE)DerelictSDLttf.$(LIB_EXT)
