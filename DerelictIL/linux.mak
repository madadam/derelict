include ../inc/linux_inc.mak

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
    
libDerelictIL.a :
	$(DC) $(DFLAGS) $(IL_SRC) -of$@
	$(CP) $@ $(LIB_DEST)
	$(RM) $@

libDerelictILU.a :
	$(DC) $(DFLAGS) $(ILU_SRC) -of$@
	$(CP) $@ $(LIB_DEST)
	$(RM) $@

libDerelictILUT.a :
	$(DC) $(DFLAGS) $(ILUT_SRC) -of$@
	$(CP) $@ $(LIB_DEST)
	$(RM) $@

DerelictIL : libDerelictIL.a
DerelictILU : libDerelictILU.a
DerelictILUT : libDerelictILUT.a
