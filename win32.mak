include inc\win32_inc.mak

all : DerelictAL_ALL DerelictFT_ALL DerelictGL_ALL DerelictIL_ALL DerelictOgg_ALL DerelictSDL_ALL DerelictSFML_ALL DerelictUtil_ALL

# Targets for all libs in each package
DerelictAL_ALL :
	cd DerelictAL
	$(DMAKE) -fwin32.mak all
	cd ..

DerelictFT_ALL :
	cd DerelictFT
	$(DMAKE) -fwin32.mak all
	cd ..
		
DerelictGL_ALL :
	cd DerelictGL
	$(DMAKE) -fwin32.mak all
	cd ..
	
DerelictIL_ALL :
	cd DerelictIL
	$(DMAKE) -fwin32.mak all
	cd ..	
	
DerelictOgg_ALL:
	cd DerelictOgg
	$(DMAKE) -fwin32.mak all
	cd ..

DerelictSDL_ALL :
	cd DerelictSDL
	$(DMAKE) -fwin32.mak all
	cd ..

DerelictSFML_ALL :
	cd DerelictSFML
	$(DMAKE) -fwin32.mak all
	cd ..
	
DerelictUtil_ALL :
	cd DerelictUtil
	$(DMAKE) -fwin32.mak all
	cd ..
	
# There's only one DerelictAL target
DerelictAL : DerelictAL_ALL

# There's only one DerelictFT target
DerelictFT : DerelictFT_ALL
	
# Individual DerelictGL targets
DerelictGL :
	cd DerelictGL
	$(DMAKE) -fwin32.mak DerelictGL
	cd ..
	
DerelictGLU :
	cd DerelictGL
	$(DMAKE) -fwin32.mak DerelictGLU
	cd ..	
	
# Individual DerelictIL targets
DerelictIL :
	cd DerelictIL
	$(DMAKE) -fwin32.mak DerelictIL
	cd ..
	
DerelictILU :
	cd DerelictIL
	$(DMAKE) -fwin32.mak DerelictILU
	cd ..
	
DerelictILUT :
	cd DerelictIL
	$(DMAKE) -fwin32.mak DerelictILUT
	cd ..	
	
# Individual DerelictOgg targets
DerelictOgg :
	cd DerelictOgg
	$(DMAKE) -fwin32.mak DerelictOgg
	cd ..
	
DerelictVorbisCodec :
	cd DerelictOgg
	$(DMAKE) -fwin32.mak DerelictVorbisCodec
	cd ..
	
# Individual DerelictSDL targets
DerelictSDL :
	cd DerelictSDL
	$(DMAKE) -fwin32.mak DerelictSDL
	cd ..
	
DerelictSDLImage :
	cd DerelictSDL
	$(DMAKE) -fwin32.mak DerelictSDLImage
	cd ..

DerelictSDLMixer :
	cd DerelictSDL
	$(DMAKE) -fwin32.mak DerelictSDLMixer
	cd ..

DerelictSDLNet :
	cd DerelictSDL
	$(DMAKE) -fwin32.mak DerelictSDLNet
	cd ..
	
DerelictSDLttf :
	cd DerelictSDL
	$(DMAKE) -fwin32.mak DerelictSDLttf
	cd ..
	
# Individual DerelictSFML targets
DerelictSFMLWindow :
	cd DerelictSFML
	$(DMAKE) -fwin32.mak DerelictSFMLWindow
	cd ..
	
DerelictSFMLSystem :
	cd DerelictSFML
	$(DMAKE) -fwin32.mak DerelictSFMLSystem
	cd ..
	
DerelictSFMLGraphics :
	cd DerelictSFML
	$(DMAKE) -fwin32.mak DerelictSFMLGraphics
	cd ..
	
DerelictSFMLAudio :
	cd DerelictSFML
	$(DMAKE) -fwin32.mak DerelictSFMLAudio
	cd ..
	
DerelictSFMLNetwork :
	cd DerelictSFML
	$(DMAKE) -fwin32.mak DerelictSFMLNetwork
	cd ..
	
# There's only one DerelictUtil target
DerelictUtil : DerelictUtil_All
	
clean :
	cd DerelictUtil
	$(RM) $(LIB_DEST)\*.lib
	cd ..
	