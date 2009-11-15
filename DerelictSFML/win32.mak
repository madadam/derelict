PACKAGE_NAME = DerelictSFML

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

CONFIG_OBJ = derelict\sfml\config.obj

SYS_OBJS= \
	derelict\sfml\stypes.obj \
	derelict\sfml\sfuncs.obj \
	derelict\sfml\system.obj

WIN_OBJS= \
	derelict\sfml\wtypes.obj \
	derelict\sfml\wfuncs.obj \
	derelict\sfml\window.obj

ALL_OBJS= $(CONFIG_OBJ) $(SYS_OBJS) $(WIN_OBJS) \
	derelict\sfml\sfml.obj

$(LIB_TARGET) : $(ALL_OBJS)
	$(LC) -c -n $@ $(ALL_OBJS)
	$(RM) $(ALL_OBJS)
	$(CP) $@ $(LIB_DEST)
	$(RM) $@
	
DerelictSFMLWindow.lib : $(CONFIG_OBJ) $(WIN_OBJS)
	$(LC) -c -n $@ $(CONFIG_OBJ) $(WIN_OBJS)
	$(RM) $(CONFIG_OBJ) $(WIN_OBJS)
	$(CP) $@ $(LIB_DEST)
	$(RM) $@
	
DerelictSFMLSystem.lib : $(CONFIG_OBJ) $(SYS_OBJS)
	$(LC) -c -n $@ $(CONFIG_OBJ) $(SYS_OBJS)
	$(RM) $(CONFIG_OBJ) $(SYS_OBJS)
	$(CP) $@ $(LIB_DEST)
	$(RM) $@
	

clean:
	$(RM) $(ALL_OBJS)