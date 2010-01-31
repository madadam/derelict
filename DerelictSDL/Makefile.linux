CP=cp -f
RM=rm -rf
DFLAGS=-release -O -inline -lib -I../DerelictUtil
DC=dmd
LIB_DEST=../lib

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
	$(DC) $(DFLAGS) $(SDL_SRC) -of$@
	$(CP) $@ $(LIB_DEST)
	$(RM) $@

libDerelictSDLImage.a :
	$(DC) $(DFLAGS) $(IMG_SRC) -of$@
	$(CP) $@ $(LIB_DEST)
	$(RM) $@

libDerelictSDLMixer.a :
	$(DC) $(DFLAGS) $(MIX_SRC) -of$@
	$(CP) $@ $(LIB_DEST)
	$(RM) $@

libDerelictSDLNet.a :
	$(DC) $(DFLAGS) $(NET_SRC) -of$@
	$(CP) $@ $(LIB_DEST)
	$(RM) $@

libDerelictSDLttf.a :
	$(DC) $(DFLAGS) $(TTF_SRC) -of$@
	$(CP) $@ $(LIB_DEST)
	$(RM) $@

DerelictSDL : libDerelictSDL.a
DerelictSDLImage : libDerelictSDLImage.a
DerelictSDLMixer : libDerelictSDLMixer.a
DerelictSDLNet : libDerelictSDLNet.a
DerelictSDLttf : libDerelictSDLttf.a
