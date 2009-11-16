PACKAGE_NAME = DerelictSFML

LIB_TARGET=$(PACKAGE_NAME).lib

CP=copy /y
RM=del /f /q
DFLAGS=-release -O -inline -I..\DerelictUtil
DC=dmd
LIB_DEST=..\lib

all : $(PACKAGE_NAME)
$(PACKAGE_NAME) : $(LIB_TARGET)

CONFIG_SRC = derelict\sfml\config.d

SYS_SRC= \
	derelict\sfml\stypes.d \
	derelict\sfml\sfuncs.d \
	derelict\sfml\system.d

WIN_SRC= \
	derelict\sfml\wtypes.d \
	derelict\sfml\wfuncs.d \
	derelict\sfml\window.d
	
GFX_SRC= \
	derelict\sfml\gtypes.d \
	derelict\sfml\gfuncs.d \
	derelict\sfml\graphics.d

ALL_SRC= $(CONFIG_SRC) $(SYS_SRC) $(WIN_SRC) $(GFX_SRC) \
	derelict\sfml\sfml.d

$(LIB_TARGET) :
	$(DC) $(DFLAGS) -lib $(ALL_SRC) -of$@
	$(CP) $@ $(LIB_DEST)
	$(RM) $@
	
DerelictSFMLWindow.lib :
	$(DC) $(DFLAGS) -lib $(CONFIG_SRC) $(WIN_SRC) -of$@
	$(CP) $@ $(LIB_DEST)
	$(RM) $@
	
DerelictSFMLSystem.lib :
	$(DC) $(DFLAGS) -lib $(CONFIG_SRC) $(SYS_SRC) -of$@
	$(CP) $@ $(LIB_DEST)
	$(RM) $@
	
DerelictSFMLGraphics.lib :
	$(DC) $(DFLAGS) -lib $(CONFIG_SRC) $(GFX_SRC) -of$@
	$(CP) $@ $(LIB_DEST)
	$(RM) $@