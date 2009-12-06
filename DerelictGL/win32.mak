CP=copy /y
RM=del /f /q
DFLAGS=-release -O -inline -lib -I..\DerelictUtil
DC=dmd
LIB_DEST=..\lib

all : DerelictGL DerelictGLU

GL_SRC= \
    derelict\opengl\extfuncs.d \
    derelict\opengl\extloader.d \
    derelict\opengl\exttypes.d \
    derelict\opengl\gl.d \
    derelict\opengl\glext.d \
    derelict\opengl\glfuncs.d \
    derelict\opengl\gltypes.d \
    derelict\opengl\wgl.d
    
GLU_SRC= \
    derelict\opengl\glu.d \
    derelict\opengl\glufuncs.d \
    derelict\opengl\glutypes.d
    

DerelictGL.lib :
	$(DC) $(DFLAGS) $(GL_SRC) -of$@
	$(CP) $@ $(LIB_DEST)
	$(RM) $@

DerelictGLU.lib :
	$(DC) $(DFLAGS) $(GLU_SRC) -of$@
	$(CP) $@ $(LIB_DEST)
	$(RM) $@

DerelictGL : DerelictGL.lib
DerelictGLU : DerelictGLU.lib
