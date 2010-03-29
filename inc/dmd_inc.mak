VERSIONS= \
	-version=DerelictGL_ARB \
	-version=DerelictGL_EXT \
	-version=DerelictGL_NV \
	-version=DerelictGL_ATI

DC=dmd
OF=-of
DFLAGS=$(VERSIONS) -release -O -inline -lib -I../DerelictUtil 

# Change this if you want the .di files output to a different location.
IMPORT_DEST=../import


HD_AL=-Hd$(IMPORT_DEST)/derelict/openal
HD_FT=-Hd$(IMPORT_DEST)/derelict/freetype
HD_GL=-Hd$(IMPORT_DEST)/derelict/opengl
HD_IL=-Hd$(IMPORT_DEST)/derelict/devil
HD_OGG=-Hd$(IMPORT_DEST)/derelict/ogg
HD_SDL=-Hd$(IMPORT_DEST)/derelict/sdl
HD_SFML=-Hd$(IMPORT_DEST)/derelict/sfml
HD_UTIL=-Hd$(IMPORT_DEST)/derelict/util
