PACKAGE_NAME = DerelictAL

LIB_TARGET=$(PACKAGE_NAME).lib

CP=copy /y
RM=del /f /q
DFLAGS=-release -O -inline -I..\DerelictUtil
DC=dmd
LIB_DEST=..\lib

all : $(PACKAGE_NAME)
$(PACKAGE_NAME) : $(LIB_TARGET)

ALL_SRC= \
    derelict\openal\al.d \
    derelict\openal\alfuncs.d \
    derelict\openal\altypes.d

$(LIB_TARGET) :
	$(DC) $(DFLAGS) -lib $(ALL_SRC) -of$@
	$(CP) $@ $(LIB_DEST)
	$(RM) $@
