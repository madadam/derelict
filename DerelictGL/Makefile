include ../inc/$(PLATFORM)_inc.mak
include ../inc/compiler_inc.mak

PACKAGE_PATH=derelict/opengl

all : DerelictGL DerelictGLU

#GL_VERSIONS=-version=DerelictGL_ALL
GL_VERSIONS=-version=DerelictGL_ARB -version=DerelictGL_EXT -version=DerelictGL_NV -version=DerelictGL_ATI -version=DerelictGL_AMD

GL_SRC= \
	derelict/opengl/cgl.d \
    derelict/opengl/extfuncs.d \
    derelict/opengl/extloader.d \
    derelict/opengl/exttypes.d \
    derelict/opengl/gl.d \
    derelict/opengl/glext.d \
    derelict/opengl/glfuncs.d \
    derelict/opengl/gltypes.d \
    derelict/opengl/glx.d \
    derelict/opengl/wgl.d \
    
GLU_SRC= \
    derelict/opengl/glu.d \
    derelict/opengl/glufuncs.d \
    derelict/opengl/glutypes.d     

$(LIB_PRE)DerelictGL.$(LIB_EXT) :
	$(DC) $(DFLAGS) $(GL_VERSIONS) $(GL_SRC) $(HD)/$(PACKAGE_PATH) $(OF)$@
	$(CP) $@ $(LIB_DEST)
	$(RM) $@

$(LIB_PRE)DerelictGLU.$(LIB_EXT) :
	$(DC) $(DFLAGS) $(GLU_SRC) $(HD)/$(PACKAGE_PATH) $(OF)$@
	$(CP) $@ $(LIB_DEST)
	$(RM) $@

DerelictGL : $(LIB_PRE)DerelictGL.$(LIB_EXT)
DerelictGLU : $(LIB_PRE)DerelictGLU.$(LIB_EXT)
