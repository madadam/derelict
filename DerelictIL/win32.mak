PACKAGE_NAME = DerelictIL

LIB_TARGET=$(PACKAGE_NAME).lib

CP=copy /y
RM=del /f /q
DFLAGS=-release -O -inline -I..\DerelictUtil
DC=dmd
LIB_DEST=..\lib

all : $(PACKAGE_NAME)
$(PACKAGE_NAME) : $(LIB_TARGET)

ALL_SRC= \
	derelict\devil\il.d \
    derelict\devil\ilfuncs.d \
    derelict\devil\iltypes.d

$(LIB_TARGET) :
	$(DC) $(DFLAGS) -lib $(ALL_SRC) -of$@
	$(CP) $@ $(LIB_DEST)
	$(RM) $@