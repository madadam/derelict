include ../inc/linux_inc.mak

all : DerelictSFML

SYS_SRC= \
	derelict/sfml/sfml.d \
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

ALL_SRC= $(SYS_SRC) $(WIN_SRC) $(GFX_SRC) $(AUDIO_SRC) $(NET_SRC)

DerelictSFML.a :
	$(DC) $(DFLAGS) $(ALL_SRC) $(HD_SFML) $(OF)$@
	$(CP) $@ $(LIB_DEST)
	$(RM) $@
		
DerelictSFML : libDerelictSFML.a
