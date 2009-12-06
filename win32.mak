DMAKE=make
RM=del /f /q
LIB_DIR=lib

all : DerelictAL DerelictGL DerelictIL_ALL DerelictSDL_ALL DerelictSFML DerelictUtil

# Targets for all libs in each package
DerelictAL :
	cd DerelictAL
	$(DMAKE) -fwin32.mak
	cd ..
	
DerelictGL :
	cd DerelictGL
	$(DMAKE) -fwin32.mak
	cd ..
	
DerelictIL_ALL :
	cd DerelictIL
	$(DMAKE) -fwin32.mak
	cd ..	

DerelictSDL_ALL :
	cd DerelictSDL
	$(DMAKE) -fwin32.mak
	cd ..

DerelictSFML :
	cd DerelictSFML
	$(DMAKE) -fwin32.mak
	cd ..
	
DerelictUtil :
	cd DerelictUtil
	$(DMAKE) -fwin32.mak
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
	
clean :
	cd $(LIB_DIR)
	$(RM) *.lib
	cd ..