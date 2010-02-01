include ../inc/linux_inc.mak

all : DerelictSFMLWindow DerelictSFMLSystem DerelictSFMLGraphics DerelictSFMLAudio DerelictSFMLNetwork

SYS_SRC= \
	derelict/sfml/stypes.d \
	derelict/sfml/sfuncs.d \
	derelict/sfml/system.d

WIN_SRC= \
	derelict/sfml/wtypes.d \
	derelict/sfml/wfuncs.d \
	derelict/sfml/window.d
	
GFX_SRC= \
	derelict/sfml/gtypes.d \
	derelict/sfml/gfuncs.d \
	derelict/sfml/graphics.d
	
AUDIO_SRC= \
	derelict/sfml/atypes.d \
	derelict/sfml/afuncs.d \
	derelict/sfml/audio.d
	
NET_SRC= \
	derelict/sfml/ntypes.d \
	derelict/sfml/nfuncs.d \
	derelict/sfml/network.d

$(LIB_TARGET) :
	$(DC) $(DFLAGS) -lib $(ALL_SRC) -of$@
	$(CP) $@ $(LIB_DEST)
	$(RM) $@
	
libDerelictSFMLWindow.a :
	$(DC) $(DFLAGS) $(WIN_SRC) -of$@
	$(CP) $@ $(LIB_DEST)
	$(RM) $@
	
libDerelictSFMLSystem.a :
	$(DC) $(DFLAGS) $(SYS_SRC) -of$@
	$(CP) $@ $(LIB_DEST)
	$(RM) $@
	
libDerelictSFMLGraphics.a :
	$(DC) $(DFLAGS) $(GFX_SRC) -of$@
	$(CP) $@ $(LIB_DEST)
	$(RM) $@
	
libDerelictSFMLAudio.a :
	$(DC) $(DFLAGS) $(AUDIO_SRC) -of$@
	$(CP) $@ $(LIB_DEST)
	$(RM) $@
	
libDerelictSFMLNetwork.a :
	$(DC) $(DFLAGS) $(NET_SRC) -of$@
	$(CP) $@ $(LIB_DEST)
	$(RM) $@
	
DerelictSFMLWindow : libDerelictSFMLWindow.a
DerelictSFMLSystem : libDerelictSFMLSystem.a
DerelictSFMLGraphics : libDerelictSFMLGraphics.a
DerelictSFMLAudio : libDerelictSFMLAudio.a
DerelictSFMLNetwork : libDerelictSFMLNetwork.a
