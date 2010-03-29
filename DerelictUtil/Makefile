include ../inc/$(PLATFORM)_inc.mak
include ../inc/compiler_inc.mak

all : DerelictUtil


ALL_SRC= \
    derelict/util/compat.d \
    derelict/util/exception.d \
    derelict/util/loader.d \
    derelict/util/sharedlib.d \
    derelict/util/xtypes.d

$(LIB_PRE)DerelictUtil.$(LIB_EXT) :
	$(DC) $(DFLAGS) $(ALL_SRC) $(HD_UTIL) $(OF)$@
	$(CP) $@ $(LIB_DEST)
	$(RM) $@
	
DerelictUtil : $(LIB_PRE)DerelictUtil.$(LIB_EXT)
