PACKAGE_NAME = DerelictGL

LIB_TARGET=$(PACKAGE_NAME).lib

CP=copy /y
RM=del /f /q
DFLAGS=-release -O -inline -I..\DerelictUtil
DC=dmd
LIB_DEST=..\lib

all : $(PACKAGE_NAME)
$(PACKAGE_NAME) : $(LIB_TARGET)

ALL_SRC= \
    derelict\opengl\extfuncs.d \
    derelict\opengl\extloader.d \
    derelict\opengl\exttypes.d \
    derelict\opengl\gl.d \
    derelict\opengl\glext.d \
    derelict\opengl\glfuncs.d \
    derelict\opengl\gltypes.d \
    derelict\opengl\glu.d \
    derelict\opengl\glufuncs.d \
    derelict\opengl\glutypes.d \
    derelict\opengl\wgl.d

$(LIB_TARGET) :
	$(DC) $(DFLAGS) -lib $(ALL_SRC) -of$@
	$(CP) $@ $(LIB_DEST)
	$(RM) $@
