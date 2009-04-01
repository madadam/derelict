CP=copy /y
RM=del /f /q
MD=mkdir

DFLAGS=-release -O -inline -I..\DerelictUtil

DC=dmd
LC=lib


LIB_DEST=..\lib

.DEFAULT: .d .obj

.d.obj:
	$(DC) -c $(DFLAGS) $< -of$@

all : DerelictGL DerelictGLU
DerelictGL : DerelictGL.lib
DerelictGLU : DerelictGLU.lib

GL_OBJS= \
    derelict\opengl\extfuncs.obj \
    derelict\opengl\extloader.obj \
    derelict\opengl\exttypes.obj \
    derelict\opengl\gl.obj \
    derelict\opengl\glext.obj \
    derelict\opengl\glfuncs.obj \
    derelict\opengl\gltypes.obj \
    derelict\opengl\wgl.obj

DerelictGL.lib : $(GL_OBJS)
	$(LC) -c -n $@ $(GL_OBJS)
	$(RM) $(GL_OBJS)
	$(CP) $@ $(LIB_DEST)
	$(RM) $@
	
GLU_OBJS= \
    derelict\opengl\glu.obj \
    derelict\opengl\glufuncs.obj \
    derelict\opengl\glutypes.obj

DerelictGLU.lib : $(GLU_OBJS)
	$(LC) -c -n $@ $(GLU_OBJS)
	$(RM) $(GLU_OBJS)
	$(CP) $@ $(LIB_DEST)
	$(RM) $@
	

clean:
	$(RM) $(GL_OBJS)
	$(RM) $(GLU_OBJS)