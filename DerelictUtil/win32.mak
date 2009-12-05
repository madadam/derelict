PACKAGE_NAME = DerelictUtil

LIB_TARGET=$(PACKAGE_NAME).lib

CP=copy /y
RM=del /f /q
DFLAGS=-release -O -inline -I..\DerelictUtil
DC=dmd
LIB_DEST=..\lib

all : $(PACKAGE_NAME)
$(PACKAGE_NAME) : $(LIB_TARGET)


ALL_SRC= \
    derelict\util\compat.d \
    derelict\util\exception.d \
    derelict\util\loader.d \
    derelict\util\sharedlib.d \
    derelict\util\wintypes.d

$(LIB_TARGET) :
	$(DC) $(DFLAGS) -lib $(ALL_SRC) -of$@
	$(CP) $@ $(LIB_DEST)
	$(RM) $@
	