
DMAKE=make
RM=del /f /q
LIB_DIR=lib

all : DerelictAL DerelictGL DerelictIL_ALL DerelictSDL DerelictSFML DerelictUtil

# One lib for each package (default)
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

DerelictSDL :
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
	
# Individual DerelictIL libs
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
	
clean :
	cd $(LIB_DIR)
	$(RM) *.lib
	cd ..