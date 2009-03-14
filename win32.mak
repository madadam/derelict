
DMAKE=make
RM=del /f
LIB_DIR=lib

all : DerelictAL DerelictSDL DerelictUtil

DerelictAL :
	cd DerelictAL
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
	$(RM) $(LIB_DIR)\*.lib
	
