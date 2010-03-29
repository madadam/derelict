include ../inc/$(PLATFORM)_inc.mak
include ../inc/compiler_inc.mak

all : DerelictGL DerelictGLU

GL_SRC= \
    derelict/opengl/extfuncs.d \
    derelict/opengl/extloader.d \
    derelict/opengl/exttypes.d \
    derelict/opengl/gl.d \
    derelict/opengl/glext.d \
    derelict/opengl/glfuncs.d \
    derelict/opengl/gltypes.d \
    derelict/opengl/glx.d
    
GLU_SRC= \
    derelict/opengl/glu.d \
    derelict/opengl/glufuncs.d \
    derelict/opengl/glutypes.d
    

$(LIB_PRE)DerelictGL.$(LIB_EXT) :
	$(DC) $(DFLAGS) $(GL_SRC) $(HD_GL) $(OF)$@
	$(CP) $@ $(LIB_DEST)
	$(RM) $@

$(LIB_PRE)DerelictGLU.$(LIB_EXT) :
	$(DC) $(DFLAGS) $(GLU_SRC) $(HD_GL) $(OF)$@
	$(CP) $@ $(LIB_DEST)
	$(RM) $@

DerelictGL : $(LIB_PRE)DerelictGL.$(LIB_EXT)
DerelictGLU : $(LIB_PRE)DerelictGLU.$(LIB_EXT)
