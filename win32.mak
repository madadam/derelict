
DMAKE=make
RM=del /f /q
LIB_DIR=lib

all : DerelictAL DerelictGL DerelictIL DerelictSDL DerelictUtil

DerelictAL :
	cd DerelictAL
	$(DMAKE) -fwin32.mak
	cd ..
	
DerelictGL :
	cd DerelictGL
	$(DMAKE) -fwin32.mak
	cd ..
	
DerelictIL :
	cd DerelictIL
	$(DMAKE) -fwin32.mak
	cd ..
	
DerelictSDL :
	cd DerelictSDL
	$(DMAKE) -fwin32.mak
	cd ..

DerelictUtil :
	cd DerelictUtil
	$(DMAKE) -fwin32.mak
	cd ..
	
clean :
	cd $(LIB_DIR)
	$(RM) *.lib
	cd ..