PACKAGE_NAME = DerelictIL

LIB_TARGET=$(PACKAGE_NAME).lib

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

all : $(PACKAGE_NAME)
$(PACKAGE_NAME) : $(LIB_TARGET)

ALL_OBJS= \
	derelict\devil\il.obj \
    derelict\devil\ilfuncs.obj \
    derelict\devil\iltypes.obj

$(LIB_TARGET) : $(ALL_OBJS)
	$(LC) -c -n $@ $(ALL_OBJS)
	$(RM) $(ALL_OBJS)
	$(CP) $@ $(LIB_DEST)
	$(RM) $@
	

clean:
	$(RM) $(ALL_OBJS)