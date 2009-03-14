/*
 * Copyright (c) 2004-2009 Derelict Developers
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are
 * met:
 *
 * * Redistributions of source code must retain the above copyright
 *   notice, this list of conditions and the following disclaimer.
 *
 * * Redistributions in binary form must reproduce the above copyright
 *   notice, this list of conditions and the following disclaimer in the
 *   documentation and/or other materials provided with the distribution.
 *
 * * Neither the names 'Derelict', 'DerelictSDL', nor the names of its contributors
 *   may be used to endorse or promote products derived from this software
 *   without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED
 * TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
 * PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR
 * CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
 * EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
 * PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
 * PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
 * LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
 * NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
 * SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */
module derelict.sdl.sdlfuncs;

private
{
	import derelict.sdl.sdltypes;
    import derelict.util.compat;

    version(Tango)
    {
        import tango.stdc.stdio;
    }
    else
    {
        import std.c.stdio;
    }
}

extern(C)
{
    // SDL.h
    int function(Uint32) SDL_Init;
    int function(Uint32) SDL_InitSubSystem;
    int function(Uint32) SDL_QuitSubSystem;
    int function(Uint32) SDL_WasInit;
    void function() SDL_Quit;

    // SDL_active.h
    Uint8 function() SDL_GetAppState;

    // SDL_audio.h
    int function(in char*) SDL_AudioInit;
    void function() SDL_AudioQuit;
    char* function(char*,int) SDL_AudioDriverName;
    int function(SDL_AudioSpec*,SDL_AudioSpec*) SDL_OpenAudio;
    SDL_audiostatus function() SDL_GetAudioStatus;
    void function(int) SDL_PauseAudio;
    SDL_AudioSpec* function(SDL_RWops*,int,SDL_AudioSpec*,Uint8**,Uint32*) SDL_LoadWAV_RW;
    void function(Uint8*) SDL_FreeWAV;
    int function(SDL_AudioCVT*,Uint16,Uint8,int,Uint16,Uint8,int) SDL_BuildAudioCVT;
    int function(SDL_AudioCVT*) SDL_ConvertAudio;
    void function(Uint8*,in Uint8*,Uint32,int) SDL_MixAudio;
    void function() SDL_LockAudio;
    void function() SDL_UnlockAudio;
    void function() SDL_CloseAudio;

    SDL_AudioSpec* SDL_LoadWAV(in char* file, SDL_AudioSpec* spec, Uint8** buf, Uint32* len)
    {
        return SDL_LoadWAV_RW(SDL_RWFromFile(file, "rb"), 1, spec, buf, len);
    }

    // SDL_cdrom.h
    int function() SDL_CDNumDrives;
    CCPTR function(int) SDL_CDName;
    SDL_CD* function(int) SDL_CDOpen;
    CDstatus function(SDL_CD*) SDL_CDStatus;
    int function(SDL_CD*,int,int,int,int) SDL_CDPlayTracks;
    int function(SDL_CD*,int,int) SDL_CDPlay;
    int function(SDL_CD*) SDL_CDPause;
    int function(SDL_CD*) SDL_CDResume;
    int function(SDL_CD*) SDL_CDStop;
    int function(SDL_CD*) SDL_CDEject;
    int function(SDL_CD*) SDL_CDClose;

    // SDL_cpuinfo.h
    SDL_bool function() SDL_HasRDTSC;
    SDL_bool function() SDL_HasMMX;
    SDL_bool function() SDL_HasMMXExt;
    SDL_bool function() SDL_Has3DNow;
    SDL_bool function() SDL_Has3DNowExt;
    SDL_bool function() SDL_HasSSE;
    SDL_bool function() SDL_HasSSE2;
    SDL_bool function() SDL_HasAltiVec;

    // SDL_error.h
    void function(in char*,...) SDL_SetError;
    char* function() SDL_GetError;
    void function() SDL_ClearError;

    // SDL_events.h
    void function() SDL_PumpEvents;
    int function(SDL_Event*,int,SDL_eventaction,Uint32) SDL_PeepEvents;
    int function(SDL_Event*) SDL_PollEvent;
    int function(SDL_Event*) SDL_WaitEvent;
    int function(SDL_Event*) SDL_PushEvent;
    void function(SDL_EventFilter) SDL_SetEventFilter;
    SDL_EventFilter function() SDL_GetEventFilter;
    Uint8 function(Uint8,int) SDL_EventState;


    int SDL_QuitRequested()
    {
        SDL_PumpEvents();
        return SDL_PeepEvents(null, 0, SDL_PEEKEVENT, SDL_QUITMASK);
    }

    // SDL_joystick.h
    int function() SDL_NumJoysticks;
    CCPTR function(int) SDL_JoystickName;
    SDL_Joystick* function(int) SDL_JoystickOpen;
    int function(int) SDL_JoystickOpened;
    int function(SDL_Joystick*) SDL_JoystickIndex;
    int function(SDL_Joystick*) SDL_JoystickNumAxes;
    int function(SDL_Joystick*) SDL_JoystickNumBalls;
    int function(SDL_Joystick*) SDL_JoystickNumHats;
    int function(SDL_Joystick*) SDL_JoystickNumButtons;
    void function() SDL_JoystickUpdate;
    int function(int) SDL_JoystickEventState;
    Sint16 function(SDL_Joystick*,int) SDL_JoystickGetAxis;
    Uint8 function(SDL_Joystick*,int) SDL_JoystickGetHat;
    int function(SDL_Joystick*,int,int*,int*) SDL_JoystickGetBall;
    Uint8 function(SDL_Joystick*,int) SDL_JoystickGetButton;
    void function(SDL_Joystick*) SDL_JoystickClose;

    // SDL_keyboard.h
    int function(int) SDL_EnableUNICODE;
    int function(int,int) SDL_EnableKeyRepeat;
    void function(int*,int*) SDL_GetKeyRepeat;
    Uint8* function(int*) SDL_GetKeyState;
    SDLMod function() SDL_GetModState;
    void function(SDLMod) SDL_SetModState;
    char* function(SDLKey key) SDL_GetKeyName;

    // SDL_loadso.h
    void* function(in char*) SDL_LoadObject;
    void* function(in void*,char*) SDL_LoadFunction;
    void function(void*) SDL_UnloadObject;

    // SDL_mouse.h
    Uint8 function(int*,int*) SDL_GetMouseState;
    Uint8 function(int*,int*) SDL_GetRelativeMouseState;
    void function(Uint16,Uint16) SDL_WarpMouse;
    SDL_Cursor* function(Uint8*,Uint8*,int,int,int,int) SDL_CreateCursor;
    void function(SDL_Cursor*) SDL_SetCursor;
    SDL_Cursor* function() SDL_GetCursor;
    void function(SDL_Cursor*) SDL_FreeCursor;
    int function(int) SDL_ShowCursor;

    // SDL_mutex.h
    SDL_mutex* function() SDL_CreateMutex;
    int function(SDL_mutex*) SDL_mutexP;
    int function(SDL_mutex*) SDL_mutexV;
    void function(SDL_mutex*) SDL_DestroyMutex;
    SDL_sem* function(Uint32) SDL_CreateSemaphore;
    void function(SDL_sem*) SDL_DestroySemaphore;
    int function(SDL_sem*) SDL_SemWait;
    int function(SDL_sem*) SDL_SemTryWait;
    int function(SDL_sem*,Uint32) SDL_SemWaitTimeout;
    int function(SDL_sem*) SDL_SemPost;
    Uint32 function(SDL_sem*) SDL_SemValue;
    SDL_cond* function() SDL_CreateCond;
    void function(SDL_cond*) SDL_DestroyCond;
    int function(SDL_cond*) SDL_CondSignal;
    int function(SDL_cond*) SDL_CondBroadcast;
    int function(SDL_cond*,SDL_mutex*) SDL_CondWait;
    int function(SDL_cond*,SDL_mutex*,Uint32) SDL_CondWaitTimeout;

    int SDL_LockMutex(SDL_mutex *mutex)
    {
        return SDL_mutexP(mutex);
    }

    int SDL_UnlockMutex(SDL_mutex *mutex)
    {
        return SDL_mutexV(mutex);
    }

    // SDL_rwops.h
    SDL_RWops* function(in char*,in char*) SDL_RWFromFile;
    SDL_RWops* function(FILE*,int) SDL_RWFromFP;
    SDL_RWops* function(void*,int) SDL_RWFromMem;
    SDL_RWops* function(in void*,int) SDL_RWFromConstMem;
    SDL_RWops* function() SDL_AllocRW;
    void function(SDL_RWops*) SDL_FreeRW;
    Uint16 function(SDL_RWops*) SDL_ReadLE16;
    Uint16 function(SDL_RWops*) SDL_ReadBE16;
    Uint32 function(SDL_RWops*) SDL_ReadLE32;
    Uint32 function(SDL_RWops*) SDL_ReadBE32;
    Uint64 function(SDL_RWops*) SDL_ReadLE64;
    Uint64 function(SDL_RWops*) SDL_ReadBE64;
    Uint16 function(SDL_RWops*,Uint16) SDL_WriteLE16;
    Uint16 function(SDL_RWops*,Uint16) SDL_WriteBE16;
    Uint32 function(SDL_RWops*,Uint32) SDL_WriteLE32;
    Uint32 function(SDL_RWops*,Uint32) SDL_WriteBE32;
    Uint64 function(SDL_RWops*,Uint64) SDL_WriteLE64;
    Uint64 function(SDL_RWops*,Uint64) SDL_WriteBE64;

    // SDL_version.h
    private
    {
	    version(D_Version2) mixin("alias const(SDL_version*) CSDLVERPTR;" );
	    else alias SDL_version* CSDLVERPTR;
    }
    CSDLVERPTR function() SDL_Linked_Version;

    // SDL_syswm.h
    int function(SDL_SysWMinfo*) SDL_GetWMInfo;

    // SDL_thread.h
    SDL_Thread* function(int (*fm)(void*), void*) SDL_CreateThread;
    Uint32 function() SDL_ThreadID;
    Uint32 function(SDL_Thread*) SDL_GetThreadID;
    void function(SDL_Thread*,int*) SDL_WaitThread;
    void function(SDL_Thread*) SDL_KillThread;

    // SDL_timer.h
    Uint32 function() SDL_GetTicks;
    void function(Uint32) SDL_Delay;
    int function(Uint32,SDL_TimerCallback) SDL_SetTimer;
    SDL_TimerID function(Uint32,SDL_NewTimerCallback,void*) SDL_AddTimer;
    SDL_bool function(SDL_TimerID) SDL_RemoveTimer;

    // SDL_video.h
    int function(in char*,Uint32) SDL_VideoInit;
    void function() SDL_VideoQuit;
    char* function(char*,int) SDL_VideoDriverName;
    SDL_Surface* function() SDL_GetVideoSurface;
    
    version(D_Version2) mixin("alias const(SDL_VideoInfo*) SDLVIPTR;");
    else alias SDL_VideoInfo* SDLVIPTR;
    SDLVIPTR function() SDL_GetVideoInfo;
    
    
    int function(int,int,int,Uint32) SDL_VideoModeOK;
    SDL_Rect** function(SDL_PixelFormat*,Uint32) SDL_ListModes;
    SDL_Surface* function(int,int,int,Uint32) SDL_SetVideoMode;
    void function(SDL_Surface*,int,SDL_Rect*) SDL_UpdateRects;
    void function(SDL_Surface*,Sint32,Sint32,Uint32,Uint32) SDL_UpdateRect;
    int function(SDL_Surface*) SDL_Flip;
    int function(float,float,float) SDL_SetGamma;
    int function(in Uint16*,in Uint16*,in Uint16*) SDL_SetGammaRamp;
    int function(Uint16*,Uint16*,Uint16*) SDL_GetGammaRamp;
    int function(SDL_Surface*,SDL_Color*,int,int) SDL_SetColors;
    int function(SDL_Surface*,int,SDL_Color*,int,int) SDL_SetPalette;
    Uint32 function(in SDL_PixelFormat*,in Uint8,in Uint8,in Uint8) SDL_MapRGB;
    Uint32 function(in SDL_PixelFormat*, in Uint8,in Uint8,in Uint8,in Uint8) SDL_MapRGBA;
    void function(Uint32,SDL_PixelFormat*,Uint8*,Uint8*,Uint8*) SDL_GetRGB;
    void function(Uint32,SDL_PixelFormat*,Uint8*,Uint8*,Uint8*,Uint8*) SDL_GetRGBA;
    SDL_Surface* function(Uint32,int,int,int,Uint32,Uint32,Uint32,Uint32) SDL_CreateRGBSurface;
    SDL_Surface* function(void*,int,int,int,int,Uint32,Uint32,Uint32,Uint32) SDL_CreateRGBSurfaceFrom;
    void function(SDL_Surface*) SDL_FreeSurface;
    int function(SDL_Surface*) SDL_LockSurface;
    void function(SDL_Surface*) SDL_UnlockSurface;
    SDL_Surface* function(SDL_RWops*,int) SDL_LoadBMP_RW;
    int function(SDL_Surface*,SDL_RWops*,int) SDL_SaveBMP_RW;
    int function(SDL_Surface*,Uint32,Uint32) SDL_SetColorKey;
    int function(SDL_Surface*,Uint32,Uint8) SDL_SetAlpha;
    SDL_bool function(SDL_Surface*,in SDL_Rect*) SDL_SetClipRect;
    void function(SDL_Surface*,SDL_Rect*) SDL_GetClipRect;
    SDL_Surface* function(SDL_Surface*,SDL_PixelFormat*,Uint32) SDL_ConvertSurface;
    int function(SDL_Surface*,SDL_Rect*,SDL_Surface*,SDL_Rect*) SDL_UpperBlit;
    int function(SDL_Surface*,SDL_Rect*,SDL_Surface*,SDL_Rect*) SDL_LowerBlit;
    int function(SDL_Surface*,SDL_Rect*,Uint32) SDL_FillRect;
    SDL_Surface* function(SDL_Surface*) SDL_DisplayFormat;
    SDL_Surface* function(SDL_Surface*) SDL_DisplayFormatAlpha;
    SDL_Overlay* function(int,int,Uint32,SDL_Surface*) SDL_CreateYUVOverlay;
    int function(SDL_Overlay*) SDL_LockYUVOverlay;
    void function(SDL_Overlay*) SDL_UnlockYUVOverlay;
    int function(SDL_Overlay*,SDL_Rect*) SDL_DisplayYUVOverlay;
    void function(SDL_Overlay*) SDL_FreeYUVOverlay;
    int function(in char*) SDL_GL_LoadLibrary;
    void* function(in char*) SDL_GL_GetProcAddress;
    int function(SDL_GLattr,int) SDL_GL_SetAttribute;
    int function(SDL_GLattr,int*) SDL_GL_GetAttribute;
    void function() SDL_GL_SwapBuffers;
    void function(int,SDL_Rect*) SDL_GL_UpdateRects;
    void function() SDL_GL_Lock;
    void function() SDL_GL_Unlock;
    void function(in char*,in char*) SDL_WM_SetCaption;
    void function(char**,char**) SDL_WM_GetCaption;
    void function(SDL_Surface*,Uint8*) SDL_WM_SetIcon;
    int function() SDL_WM_IconifyWindow;
    int function(SDL_Surface*) SDL_WM_ToggleFullScreen;
    SDL_GrabMode function(SDL_GrabMode) SDL_WM_GrabInput;

    alias SDL_CreateRGBSurface SDL_AllocSurface;
    alias SDL_UpperBlit SDL_BlitSurface;

    SDL_Surface* SDL_LoadBMP(in char* file)
    {
        return SDL_LoadBMP_RW(SDL_RWFromFile(file, "rb"), 1);
    }

    int SDL_SaveBMP(SDL_Surface* surface, in char* file)
    {
        return SDL_SaveBMP_RW(surface, SDL_RWFromFile(file,"wb"), 1);
    }
}