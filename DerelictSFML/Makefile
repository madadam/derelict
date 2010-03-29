include ../inc/$(PLATFORM)_inc.mak
include ../inc/compiler_inc.mak

all : DerelictSFMLWindow DerelictSFMLSystem DerelictSFMLGraphics DerelictSFMLAudio DerelictSFMLNetwork

SYS_SRC= \
	derelict/sfml/config.d \
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
	$(DC) $(DFLAGS) $(ALL_SRC) $(HD_SFML) $(OF)$@
	$(CP) $@ $(LIB_DEST)
	$(RM) $@
	
$(LIB_EXT)DerelictSFMLWindow.$(LIB_EXT) :
	$(DC) $(DFLAGS) $(WIN_SRC) $(HD_SFML) $(OF)$@
	$(CP) $@ $(LIB_DEST)
	$(RM) $@
	
$(LIB_EXT)DerelictSFMLSystem.$(LIB_EXT) :
	$(DC) $(DFLAGS) $(SYS_SRC) $(HD_SFML) $(OF)$@
	$(CP) $@ $(LIB_DEST)
	$(RM) $@
	
$(LIB_EXT)DerelictSFMLGraphics.$(LIB_EXT) :
	$(DC) $(DFLAGS) $(GFX_SRC) $(HD_SFML) $(OF)$@
	$(CP) $@ $(LIB_DEST)
	$(RM) $@
	
$(LIB_EXT)DerelictSFMLAudio.$(LIB_EXT) :
	$(DC) $(DFLAGS) $(AUDIO_SRC) $(HD_SFML) $(OF)$@
	$(CP) $@ $(LIB_DEST)
	$(RM) $@
	
$(LIB_EXT)DerelictSFMLNetwork.$(LIB_EXT) :
	$(DC) $(DFLAGS) $(NET_SRC) $(HD_SFML) $(OF)$@
	$(CP) $@ $(LIB_DEST)
	$(RM) $@
	
DerelictSFMLWindow : $(LIB_EXT)DerelictSFMLWindow.$(LIB_EXT)
DerelictSFMLSystem : $(LIB_EXT)DerelictSFMLSystem.$(LIB_EXT)
DerelictSFMLGraphics : $(LIB_EXT)DerelictSFMLGraphics.$(LIB_EXT)
DerelictSFMLAudio : $(LIB_EXT)DerelictSFMLAudio.$(LIB_EXT)
DerelictSFMLNetwork : $(LIB_EXT)DerelictSFMLNetwork.$(LIB_EXT)
