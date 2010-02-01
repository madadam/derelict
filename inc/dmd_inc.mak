IMPORT_DEST=../import
DC=dmd
DFLAGS=-release -O -inline -lib -I..\DerelictUtil 

HD_AL=-Hd$(IMPORT_DEST)/derelict/openal
HD_FT=-Hd$(IMPORT_DEST)/derelict/freetype
HD_GL=-Hd$(IMPORT_DEST)/derelict/opengl
HD_IL=-Hd$(IMPORT_DEST)/derelict/devil
HD_SDL=-Hd$(IMPORT_DEST)/derelict/sdl
HD_SFML=-Hd$(IMPORT_DEST)/derelict/sfml
HD_UTIL=-Hd$(IMPORT_DEST)/derelict/util
