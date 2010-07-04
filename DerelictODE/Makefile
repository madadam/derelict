include ../inc/$(PLATFORM)_inc.mak
include ../inc/compiler_inc.mak

ODE_SRC= \
    derelict/ode/ode.d \
    derelict/ode/odefuncs.d \
    derelict/ode/odetypes.d   
    
PACKAGE_PATH=derelict/ode

all : DerelictODE

$(LIB_PRE)DerelictODE.$(LIB_EXT) :
	$(DC) $(DFLAGS) $(DFLAGS_REQ) $(ODE_SRC) $(HD)/$(PACKAGE_PATH) $(OF)$@
	$(CP) $@ $(LIB_DEST)
	$(RM) $@

DerelictODE : $(LIB_PRE)DerelictODE.$(LIB_EXT)
