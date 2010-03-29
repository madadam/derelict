include inc/linux_inc.mak

all : DerelictAL_ALL DerelictFT_ALL DerelictGL_ALL DerelictIL_ALL DerelictOgg_ALL DerelictSDL_ALL DerelictSFML_ALL DerelictUtil_ALL

# Targets for all libs in each package
DerelictAL_ALL :
	$(DMAKE) -C DerelictAL -f linux.mak all

DerelictFT_ALL :
	$(DMAKE) -C DerelictFT -f linux.mak all
		
DerelictGL_ALL :
	$(DMAKE) -C DerelictGL -f linux.mak all
	
DerelictIL_ALL :
	$(DMAKE) -C DerelictIL -f linux.mak all
	
DerelictOgg_ALL :
	$(DMAKE) -C DerelictOgg -f linux.mak all

DerelictSDL_ALL :
	$(DMAKE) -C DerelictSDL -f linux.mak all

DerelictSFML_ALL :
	$(DMAKE) -C DerelictSFML -f linux.mak all
	
DerelictUtil_ALL :
	$(DMAKE) -C DerelictUtil -f linux.mak all
	
# There's only one DerelictAL target
DerelictAL : DerelictAL_ALL

# There's only one DerelictFT target
DerelictFT : DerelictFT_ALL
	
# Individual DerelictGL targets
DerelictGL :
	$(DMAKE) -C DerelictGL -f linux.mak DerelictGL
	
DerelictGLU :
	$(DMAKE) -C DerelictGL -f linux.mak DerelictGLU
	
# Individual DerelictIL targets
DerelictIL :
	$(DMAKE) -C DerelictIL -f linux.mak DerelictIL
	
DerelictILU :
	$(DMAKE) -C DerelictIL -f linux.mak DerelictILU
	
DerelictILUT :
	$(DMAKE) -C DerelictIL -f linux.mak DerelictILUT
	
# Individual DerelictOgg targets
DerelictOgg :
	$(DMAKE) -C DerelictOgg -f linux.mak DerelictOgg
	
# Individual DerelictSDL targets
DerelictSDL :
	$(DMAKE) -C DerelictSDL -f linux.mak DerelictSDL
	
DerelictSDLImage :
	$(DMAKE) -C DerelictSDL -f linux.mak DerelictSDLImage

DerelictSDLMixer :
	$(DMAKE) -C DerelictSDL -f linux.mak DerelictSDLMixer

DerelictSDLNet :
	$(DMAKE) -C DerelictSDL -f linux.mak DerelictSDLNet
	
DerelictSDLttf :
	$(DMAKE) -C DerelictSDL -f linux.mak DerelictSDLttf
	
# Individual DerelictSFML targets
DerelictSFMLWindow :
	$(DMAKE) -C DerelictSFML -f linux.mak DerelictSFMLWindow
	
DerelictSFMLSystem :
	$(DMAKE) -C DerelictSFML -f linux.mak DerelictSFMLSystem
	
DerelictSFMLGraphics :
	$(DMAKE) -C DerelictSFML -f linux.mak DerelictSFMLGraphics
	
DerelictSFMLAudio :
	$(DMAKE) -C DerelictSFML -f linux.mak DerelictSFMLAudio
	
DerelictSFMLNetwork :
	$(DMAKE) -C DerelictSFML -f linux.mak DerelictSFMLNetwork
	
# There's only one DerelictUtil target
DerelictUtil : DerelictUtil_All
	
clean :
	cd DerelictUtil && cd $(LIB_DEST) && $(RM) *.a