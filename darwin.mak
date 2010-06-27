include inc/linux_inc.mak

all : DerelictAL_ALL DerelictFMODEX_ALL DerelictFT_ALL DerelictGL_ALL DerelictIL_ALL DerelictODE_ALL DerelictOgg_ALL DerelictPA_ALL DerelictSDL_ALL DerelictSFML_ALL DerelictUtil_ALL

# Targets for all libs in each package
DerelictAL_ALL :
	$(DMAKE) -C DerelictAL all PLATFORM=darwin
	
DerelictFMODEX_ALL :
	$(DMAKE) -C DerelictFMOD all PLATFORM=darwin	

DerelictFT_ALL :
	$(DMAKE) -C DerelictFT all PLATFORM=darwin
		
DerelictGL_ALL :
	$(DMAKE) -C DerelictGL all PLATFORM=darwin
	
DerelictIL_ALL :
	$(DMAKE) -C DerelictIL all PLATFORM=darwin
	
DerelictODE_ALL :
	$(DMAKE) -C DerelictODE all PLATFORM=darwin
	
DerelictOgg_ALL :
	$(DMAKE) -C DerelictOgg all PLATFORM=darwin
	
DerelictPA_ALL:
	$(DMAKE) -C DerelictPA all PLATFORM=darwin

DerelictSDL_ALL :
	$(DMAKE) -C DerelictSDL all PLATFORM=darwin

DerelictSFML_ALL :
	$(DMAKE) -C DerelictSFML all PLATFORM=darwin
	
DerelictUtil_ALL :
	$(DMAKE) -C DerelictUtil all PLATFORM=darwin
	
# There's only one DerelictAL target
DerelictAL : DerelictAL_ALL

# There's only one DerelictFMODEX target
DerelictFMODEX : DerelictFMODEX_ALL

# There's only one DerelictFT target
DerelictFT : DerelictFT_ALL
	
# Individual DerelictGL targets
DerelictGL :
	$(DMAKE) -C DerelictGL DerelictGL PLATFORM=darwin
	
DerelictGLU :
	$(DMAKE) -C DerelictGL DerelictGLU PLATFORM=darwin
	
# Individual DerelictIL targets
DerelictIL :
	$(DMAKE) -C DerelictIL DerelictIL PLATFORM=darwin
	
DerelictILU :
	$(DMAKE) -C DerelictIL DerelictILU PLATFORM=darwin
	
DerelictILUT :
	$(DMAKE) -C DerelictIL DerelictILUT PLATFORM=darwin
	
# There's only one target for DerelictODE
DerelictODE : DerelictODE_ALL
	
# Individual DerelictOgg targets
DerelictOgg :
	$(DMAKE) -C DerelictOgg DerelictOgg PLATFORM=darwin
	
# There's only one target for DerelictPA
DerelictPA : DerelictPA_ALL	
	
DerelictVorbis :
	$(DMAKE) -C DerelictOgg DerelictVorbis PLATFORM=darwin
	
DerelictVorbisEnc :
	$(DMAKE) -C DerelictOgg DerelictVorbisEnc PLATFORM=darwin
	
DerelictVorbisFile :
	$(DMAKE) -C DerelictOgg DerelictVorbisFile PLATFORM=darwin	
	
# Individual DerelictSDL targets
DerelictSDL :
	$(DMAKE) -C DerelictSDL DerelictSDL PLATFORM=darwin
	
DerelictSDLImage :
	$(DMAKE) -C DerelictSDL DerelictSDLImage PLATFORM=darwin

DerelictSDLMixer :
	$(DMAKE) -C DerelictSDL DerelictSDLMixer PLATFORM=darwin

DerelictSDLNet :
	$(DMAKE) -C DerelictSDL DerelictSDLNet PLATFORM=darwin
	
DerelictSDLttf :
	$(DMAKE) -C DerelictSDL DerelictSDLttf PLATFORM=darwin
	
# Individual DerelictSFML targets
DerelictSFMLWindow :
	$(DMAKE) -C DerelictSFML DerelictSFMLWindow PLATFORM=darwin
	
DerelictSFMLSystem :
	$(DMAKE) -C DerelictSFML DerelictSFMLSystem PLATFORM=darwin
	
DerelictSFMLGraphics :
	$(DMAKE) -C DerelictSFML DerelictSFMLGraphics PLATFORM=darwin
	
DerelictSFMLAudio :
	$(DMAKE) -C DerelictSFML DerelictSFMLAudio PLATFORM=darwin
	
DerelictSFMLNetwork :
	$(DMAKE) -C DerelictSFML DerelictSFMLNetwork PLATFORM=darwin
	
# There's only one DerelictUtil target
DerelictUtil : DerelictUtil_All
	
cleanall : cleanlib cleandi

clean : cleanlib

cleanlib:
	cd DerelictUtil && $(RM) $(LIB_DEST)/*.a
	
cleandi:
	cd DerelictUtil  && $(RMR) $(IMPORT_DEST)/derelict
	