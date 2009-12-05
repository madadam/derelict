PACKAGE_NAME = DerelictIL_ALL

LIB_TARGET=$(PACKAGE_NAME).lib
CP=copy /y
RM=del /f /q
DFLAGS=-release -O -inline -I..\DerelictUtil
DC=dmd
LIB_DEST=..\lib

all : $(PACKAGE_NAME)
$(PACKAGE_NAME) : $(LIB_TARGET)

IL_SRC= \
	derelict\devil\il.d \
    derelict\devil\ilfuncs.d \
    derelict\devil\iltypes.d
    
ILU_SRC= \
	derelict\devil\ilu.d \
    derelict\devil\ilufuncs.d \
    derelict\devil\ilutypes.d
    
ILUT_SRC= \
	derelict\devil\ilut.d \
    derelict\devil\ilutfuncs.d \
    derelict\devil\iluttypes.d
    
ALL_SRC= $(IL_SRC) $(ILU_SRC) $(ILUT_SRC)

$(LIB_TARGET) :
	$(DC) $(DFLAGS) -lib $(ALL_SRC) -of$@
	$(CP) $@ $(LIB_DEST)
	$(RM) $@

DerelictIL.lib :
	$(DC) $(DFLAGS) -lib $(IL_SRC) -of$@
	$(CP) $@ $(LIB_DEST)
	$(RM) $@

DerelictILU.lib :
	$(DC) $(DFLAGS) -lib $(ILU_SRC) -of$@
	$(CP) $@ $(LIB_DEST)
	$(RM) $@

DerelictILUT.lib :
	$(DC) $(DFLAGS) -lib $(ILUT_SRC) -of$@
	$(CP) $@ $(LIB_DEST)
	$(RM) $@
	
DerelictIL : DerelictIL.lib
DerelictILU : DerelictILU.lib
DerelictILUT : DerelictILUT.lib
