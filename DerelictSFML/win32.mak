include ..\inc\win32_inc.mak
include ..\inc\compiler_inc.mak

all : DerelictSFMLWindow DerelictSFMLSystem DerelictSFMLGraphics DerelictSFMLAudio DerelictSFMLNetwork

SYS_SRC= \
	derelict\sfml\stypes.d \
	derelict\sfml\sfuncs.d \
	derelict\sfml\system.d

WIN_SRC= \
	derelict\sfml\wtypes.d \
	derelict\sfml\wfuncs.d \
	derelict\sfml\window.d
	
GFX_SRC= \
	derelict\sfml\gtypes.d \
	derelict\sfml\gfuncs.d \
	derelict\sfml\graphics.d
	
AUDIO_SRC= \
	derelict\sfml\atypes.d \
	derelict\sfml\afuncs.d \
	derelict\sfml\audio.d
	
NET_SRC= \
	derelict\sfml\ntypes.d \
	derelict\sfml\nfuncs.d \
	derelict\sfml\network.d

$(LIB_TARGET) :
	$(DC) $(DFLAGS) $(ALL_SRC) $(HD_SFML) $(OF)$@
	$(CP) $@ $(LIB_DEST)
	$(RM) $@
	
DerelictSFMLWindow.lib :
	$(DC) $(DFLAGS) $(WIN_SRC) $(HD_SFML) $(OF)$@
	$(CP) $@ $(LIB_DEST)
	$(RM) $@
	
DerelictSFMLSystem.lib :
	$(DC) $(DFLAGS) $(SYS_SRC) $(HD_SFML) $(OF)$@
	$(CP) $@ $(LIB_DEST)
	$(RM) $@
	
DerelictSFMLGraphics.lib :
	$(DC) $(DFLAGS) $(GFX_SRC) $(HD_SFML) $(OF)$@
	$(CP) $@ $(LIB_DEST)
	$(RM) $@
	
DerelictSFMLAudio.lib :
	$(DC) $(DFLAGS) $(AUDIO_SRC) $(HD_SFML) $(OF)$@
	$(CP) $@ $(LIB_DEST)
	$(RM) $@
	
DerelictSFMLNetwork.lib:
	$(DC) $(DFLAGS) $(NET_SRC) $(HD_SFML) $(OF)$@
	$(CP) $@ $(LIB_DEST)
	$(RM) $@
	
DerelictSFMLWindow : DerelictSFMLWindow.lib
DerelictSFMLSystem : DerelictSFMLSystem.lib
DerelictSFMLGraphics : DerelictSFMLGraphics.lib
DerelictSFMLAudio : DerelictSFMLAudio.lib
DerelictSFMLNetwork : DerelictSFMLNetwork.lib
