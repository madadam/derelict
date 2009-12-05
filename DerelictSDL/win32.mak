PACKAGE_NAME = DerelictSDL

LIB_TARGET=$(PACKAGE_NAME).lib

CP=copy /y
RM=del /f /q
DFLAGS=-release -O -inline -I..\DerelictUtil
DC=dmd
LIB_DEST=..\lib

all : $(PACKAGE_NAME)
$(PACKAGE_NAME) : $(LIB_TARGET)

ALL_SRC= \
	derelict\sdl\image.d \
	derelict\sdl\mixer.d \
	derelict\sdl\net.d \
    derelict\sdl\sdl.d \
    derelict\sdl\sdlfuncs.d \
    derelict\sdl\sdltypes.d \
    derelict\sdl\ttf.d

$(LIB_TARGET) :
	$(DC) $(DFLAGS) -lib $(ALL_SRC) -of$@
	$(CP) $@ $(LIB_DEST)
	$(RM) $@
