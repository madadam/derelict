include ../inc/linux_inc.mak

all : DerelictUtil


ALL_SRC= \
    derelict/util/compat.d \
    derelict/util/exception.d \
    derelict/util/loader.d \
    derelict/util/sharedlib.d \
    derelict/util/wintypes.d

libDerelictUtil.a :
	$(DC) $(DFLAGS) -lib $(ALL_SRC) -of$@
	$(CP) $@ $(LIB_DEST)
	$(RM) $@
	
DerelictUtil : libDerelictUtil.a
