VERSIONS= \
	-version=DerelictGL_ARB \
	-version=DerelictGL_EXT \
	-version=DerelictGL_NV \
	-version=DerelictGL_ATI

DC=dmd
OF=-of
DFLAGS=$(VERSIONS) -release -O -inline -lib -I../DerelictUtil 

HD=-Hd$(IMPORT_DEST)
