include ../inc/$(PLATFORM)_inc.mak
include ../inc/compiler_inc.mak

PA_SRC= \
    derelict/portaudio/pa.d \
    derelict/portaudio/pafuncs.d \
    derelict/portaudio/patypes.d   
    
PACKAGE_PATH=derelict/portaudio

all : DerelictPA

$(LIB_PRE)DerelictPA.$(LIB_EXT) :
	$(DC) $(DFLAGS) $(DFLAGS_REQ) $(PA_SRC) $(HD)/$(PACKAGE_PATH) $(OF)$@
	$(CP) $@ $(LIB_DEST)
	$(RM) $@

DerelictPA : $(LIB_PRE)DerelictPA.$(LIB_EXT)
