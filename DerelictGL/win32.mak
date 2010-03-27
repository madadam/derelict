include ..\inc\win32_inc.mak
include ..\inc\compiler_inc.mak

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
	$(DC) $(DFLAGS) $(GL_SRC) $(HD_GL) $(OF)$@
	$(CP) $@ $(LIB_DEST)
	$(RM) $@

DerelictGLU.lib :
	$(DC) $(DFLAGS) $(GLU_SRC) $(HD_GL) $(OF)$@
	$(CP) $@ $(LIB_DEST)
	$(RM) $@

DerelictGL : DerelictGL.lib
DerelictGLU : DerelictGLU.lib
