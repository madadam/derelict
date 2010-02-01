IMPORT_DEST=../import/derelict
DC=dmd
DFLAGS=-release -O -inline -lib -I..\DerelictUtil 

HD_AL=-Hd$(IMPORT_DEST)/openal
HD_FT=-Hd$(IMPORT_DEST)/freetype
HD_GL=-Hd$(IMPORT_DEST)/opengl
HD_IL=-Hd$(IMPORT_DEST)/devil
HD_SDL=-Hd$(IMPORT_DEST)/sdl
HD_SFML=-Hd$(IMPORT_DEST)/sfml
HD_UTIL=-Hd$(IMPORT_DEST)/util
