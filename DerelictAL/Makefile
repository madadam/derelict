include ../inc/$(PLATFORM)_inc.mak
include ../inc/$(DC)_inc.mak

AL_SRC= \
    derelict/openal/al.d \
    derelict/openal/alfuncs.d \
    derelict/openal/altypes.d   
    
PACKAGE_PATH=derelict/openal
ALLIB=$(LIB_PRE)DerelictAL.$(LIB_EXT)

all : DerelictAL

$(LIB_PRE)DerelictAL.$(LIB_EXT) : $(DC)_build copylib

dmd_build:
	$(DC) $(DFLAGS) $(DFLAGS_REQ) $(AL_SRC) $(HD)/$(PACKAGE_PATH) $(OF)$(ALLIB)
	
ldc_build:
	$(DC) $(DFLAGS) $(DFLAGS_REQ) $(AL_SRC) $(HD)/$(PACKAGE_PATH)
	ar rcs $(ALLIB) $^
	ranlib $(ALLIB)
	
copylib:		
	$(CP) $(ALLIB) $(LIB_DEST)
	$(RM) $(ALLIB)
	

DerelictAL : $(ALLIB)
