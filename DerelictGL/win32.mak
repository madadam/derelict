PACKAGE_NAME = DerelictGL

LIB_TARGET=$(PACKAGE_NAME).lib

CP=copy /y
RM=del /f /q
MD=mkdir

DFLAGS=-debug -I..\DerelictUtil

DC=dmd
LC=lib


LIB_DEST=..\lib

.DEFAULT: .d .obj

.d.obj:
	$(DC) -c $(DFLAGS) $< -of$@

all : $(PACKAGE_NAME)
$(PACKAGE_NAME) : $(LIB_TARGET)

ALL_OBJS= \
    derelict\opengl\extfuncs.obj \
    derelict\opengl\extloader.obj \
    derelict\opengl\exttypes.obj \
    derelict\opengl\gl.obj \
    derelict\opengl\glext.obj \
    derelict\opengl\glfuncs.obj \
    derelict\opengl\gltypes.obj \
    derelict\opengl\glu.obj \
    derelict\opengl\glufuncs.obj \
    derelict\opengl\glutypes.obj \
    derelict\opengl\wgl.obj

$(LIB_TARGET) : $(ALL_OBJS)
	$(LC) -c -n $@ $(ALL_OBJS)
	$(RM) $(ALL_OBJS)
	$(CP) $@ $(LIB_DEST)
	$(RM) $@
	

clean:
	$(RM) $(ALL_OBJS)