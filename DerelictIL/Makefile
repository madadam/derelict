include ../inc/$(PLATFORM)_inc.mak
include ../inc/compiler_inc.mak

all : DerelictIL DerelictILU DerelictILUT

IL_SRC= \
	derelict/devil/il.d \
    derelict/devil/ilfuncs.d \
    derelict/devil/iltypes.d
    
ILU_SRC= \
	derelict/devil/ilu.d \
    derelict/devil/ilufuncs.d \
    derelict/devil/ilutypes.d
    
ILUT_SRC= \
	derelict/devil/ilut.d \
    derelict/devil/ilutfuncs.d \
    derelict/devil/iluttypes.d
    
$(LIB_PRE)DerelictIL.$(LIB_EXT) :
	$(DC) $(DFLAGS) $(IL_SRC) $(HD_IL) $(OF)$@
	$(CP) $@ $(LIB_DEST)
	$(RM) $@

$(LIB_PRE)DerelictILU.$(LIB_EXT) :
	$(DC) $(DFLAGS) $(ILU_SRC) $(HD_IL) $(OF)$@
	$(CP) $@ $(LIB_DEST)
	$(RM) $@

$(LIB_PRE)DerelictILUT.$(LIB_EXT) :
	$(DC) $(DFLAGS) $(ILUT_SRC) $(HD_IL) $(OF)$@
	$(CP) $@ $(LIB_DEST)
	$(RM) $@

DerelictIL : $(LIB_PRE)DerelictIL.$(LIB_EXT)
DerelictILU : $(LIB_PRE)DerelictILU.$(LIB_EXT)
DerelictILUT : $(LIB_PRE)DerelictILUT.$(LIB_EXT)
