/*

Boost Software License - Version 1.0 - August 17th, 2003

Permission is hereby granted, free of charge, to any person or organization
obtaining a copy of the software and accompanying documentation covered by
this license (the "Software") to use, reproduce, display, distribute,
execute, and transmit the Software, and to prepare derivative works of the
Software, and to permit third-parties to whom the Software is furnished to
do so, all subject to the following:

The copyright notices in the Software and this entire statement, including
the above license grant, this restriction and the following disclaimer,
must be included in all copies of the Software, in whole or in part, and
all derivative works of the Software, unless such copies or derivative
works are solely in the form of machine-executable object code generated by
a source language processor.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE, TITLE AND NON-INFRINGEMENT. IN NO EVENT
SHALL THE COPYRIGHT HOLDERS OR ANYONE DISTRIBUTING THE SOFTWARE BE LIABLE
FOR ANY DAMAGES OR OTHER LIABILITY, WHETHER IN CONTRACT, TORT OR OTHERWISE,
ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
DEALINGS IN THE SOFTWARE.

*/
module derelict.sfml.wfuncs;

private
{
    import derelict.util.compat;
    import derelict.sfml.config;
    import derelict.sfml.wtypes;
}

extern(C)
{
    mixin(gsharedString!() ~
    "
    // Context.h
    sfContext* function() sfContext_Create;
    void function(sfContext*) sfContext_Destroy;
    void function(sfContext*, sfBool) sfContext_SetActive;

    // Input.h
    sfBool function(sfInput*, sfKeyCode) sfInput_IsKeyDown;
    sfBool function(sfInput*, sfMouseButton) sfInput_IsMouseButtonDown;
    sfBool function(sfInput*, uint, uint) sfInput_IsJoystickButtonDown;
    int function(sfInput*) sfInput_GetMouseX;
    int function(sfInput*) sfInput_GetMouseY;
    float function(sfInput*, uint, sfJoyAxis) sfInput_GetJoystickAxis;

    // VideoMode.h
    sfVideoMode function() sfVideoMode_GetDesktopMode;
    sfVideoMode function(size_t) sfVideoMode_GetMode;
    size_t function() sfVideoMode_GetModesCount;
    sfBool function(sfVideoMode) sfVideoMode_IsValid;

    // Window.h
    sfWindow* function(sfVideoMode, CCPTR, uint, sfWindowSettings) sfWindow_Create;
    sfWindow* function(sfWindowHandle, sfWindowSettings) sfWindow_CreateFromHandle;
    void function(sfWindow*) sfWindow_Destroy;
    void function(sfWindow*) sfWindow_Close;
    sfBool function(sfWindow*) sfWindow_IsOpened;
    uint function(sfWindow*) sfWindow_GetWidth;
    uint function(sfWindow*) sfWindow_GetHeight;
    sfWindowSettings function(sfWindow*) sfWindow_GetSettings;
    sfBool function(sfWindow*, sfEvent*) sfWindow_GetEvent;
    void function(sfWindow*, sfBool) sfWindow_UseVerticalSync;
    void function(sfWindow*, sfBool) sfWindow_ShowMouseCursor;
    void function(sfWindow*, uint, uint) sfWindow_SetCursorPosition;
    void function(sfWindow*, int, int) sfWindow_SetPosition;
    void function(sfWindow*, uint, uint) sfWindow_SetSize;
    void function(sfWindow*, sfBool) sfWindow_Show;
    void function(sfWindow*, sfBool) sfWindow_EnableKeyRepeat;
    void function(sfWindow*, uint, uint, sfUint8*) sfWindow_SetIcon;
    sfBool function(sfWindow*, sfBool) sfWindow_SetActive;
    void function(sfWindow*) sfWindow_Display;
    sfInput* function(sfWindow*) sfWindow_GetInput;
    void function(sfWindow*, uint) sfWindow_SetFramerateLimit;
    float function(sfWindow*) sfWindow_GetFrameTime;
    void function(sfWindow*, float) sfWindow_SetJoystickThreshold;
    ");
}

