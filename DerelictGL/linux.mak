include ../inc/linux_inc.mak

all : DerelictGL DerelictGLU

GL_SRC= \
    derelict/opengl/extfuncs.d \
    derelict/opengl/extloader.d \
    derelict/opengl/exttypes.d \
    derelict/opengl/gl.d \
    derelict/opengl/glext.d \
    derelict/opengl/glfuncs.d \
    derelict/opengl/gltypes.d \
    derelict/opengl/wgl.d
    
GLU_SRC= \
    derelict/opengl/glu.d \
    derelict/opengl/glufuncs.d \
    derelict/opengl/glutypes.d
    

libDerelictGL.a :
	$(DC) $(DFLAGS) $(GL_SRC) $(HD_GL) -of$@
	$(CP) $@ $(LIB_DEST)
	$(RM) $@

libDerelictGLU.a :
	$(DC) $(DFLAGS) $(GLU_SRC) $(HD_GL) -of$@
	$(CP) $@ $(LIB_DEST)
	$(RM) $@

DerelictGL : libDerelictGL.a
DerelictGLU : libDerelictGLU.a
