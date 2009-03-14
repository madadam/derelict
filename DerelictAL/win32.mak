PACKAGE_NAME = DerelictAL

LIB_TARGET=$(PACKAGE_NAME).lib

CP=xcopy /y
RM=del /f
MD=mkdir

DFLAGS=-release -O -inline -w -I..\DerelictUtil

DC=dmd
LC=lib


LIB_DEST=..\lib

.DEFAULT: .d .obj

.d.obj:
	$(DC) -c $(DFLAGS) $< -of$@

all : $(PACKAGE_NAME)
$(PACKAGE_NAME) : $(LIB_TARGET)

ALL_OBJS= \
    derelict\openal\al.obj \
    derelict\openal\alfuncs.obj \
    derelict\openal\altypes.obj

$(LIB_TARGET) : $(ALL_OBJS)
	$(LC) -c -n $@ $(ALL_OBJS)
	$(RM) $(ALL_OBJS)
	$(CP) $@ $(LIB_DEST)
	$(RM) $@
	

clean:
	$(RM) $(ALL_OBJS)