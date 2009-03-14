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
module derelict.sdl.sdl;

public
{
    import derelict.sdl.sdltypes;
    import derelict.sdl.sdlfuncs;
}

private
{
	import derelict.util.loader;
	
	version(darwin)
		version = MacOSX;
	version(OSX)
		version = MacOSX;
}

class DerelictSDLLoader : SharedLibLoader
{
public:
	this()
	{
		super(
			"sdl.dll",
	        "libSDL.so, libSDL.so.0, libSDL-1.2.so, libSDL-1.2.so.0",
	        "../Frameworks/SDL.framework/SDL, /Library/Frameworks/SDL.framework/SDL, /System/Library/Frameworks/SDL.framework/SDL"
		);
	}
	
protected:
	override void loadSymbols()
	{
	    // active.d
	    bindFunc(cast(void**)&SDL_GetAppState, "SDL_GetAppState");
	    // audio.d
	    bindFunc(cast(void**)&SDL_AudioInit, "SDL_AudioInit");
	    bindFunc(cast(void**)&SDL_AudioQuit, "SDL_AudioQuit");
	    bindFunc(cast(void**)&SDL_AudioDriverName, "SDL_AudioDriverName");
	    bindFunc(cast(void**)&SDL_OpenAudio, "SDL_OpenAudio");
	    bindFunc(cast(void**)&SDL_GetAudioStatus, "SDL_GetAudioStatus");
	    bindFunc(cast(void**)&SDL_PauseAudio, "SDL_PauseAudio");
	    bindFunc(cast(void**)&SDL_LoadWAV_RW, "SDL_LoadWAV_RW");
	    bindFunc(cast(void**)&SDL_FreeWAV, "SDL_FreeWAV");
	    bindFunc(cast(void**)&SDL_BuildAudioCVT, "SDL_BuildAudioCVT");
	    bindFunc(cast(void**)&SDL_ConvertAudio, "SDL_ConvertAudio");
	    bindFunc(cast(void**)&SDL_MixAudio, "SDL_MixAudio");
	    bindFunc(cast(void**)&SDL_LockAudio, "SDL_LockAudio");
	    bindFunc(cast(void**)&SDL_UnlockAudio, "SDL_UnlockAudio");
	    bindFunc(cast(void**)&SDL_CloseAudio, "SDL_CloseAudio");
	    // cdrom.d
	    bindFunc(cast(void**)&SDL_CDNumDrives, "SDL_CDNumDrives");
	    bindFunc(cast(void**)&SDL_CDName, "SDL_CDName");
	    bindFunc(cast(void**)&SDL_CDOpen, "SDL_CDOpen");
	    bindFunc(cast(void**)&SDL_CDStatus, "SDL_CDStatus");
	    bindFunc(cast(void**)&SDL_CDPlayTracks, "SDL_CDPlayTracks");
	    bindFunc(cast(void**)&SDL_CDPlay, "SDL_CDPlay");
	    bindFunc(cast(void**)&SDL_CDPause, "SDL_CDPause");
	    bindFunc(cast(void**)&SDL_CDResume, "SDL_CDResume");
	    bindFunc(cast(void**)&SDL_CDStop, "SDL_CDStop");
	    bindFunc(cast(void**)&SDL_CDEject, "SDL_CDEject");
	    bindFunc(cast(void**)&SDL_CDClose, "SDL_CDClose");
	    // cpuinfo.d
	    bindFunc(cast(void**)&SDL_HasRDTSC, "SDL_HasRDTSC");
	    bindFunc(cast(void**)&SDL_HasMMX, "SDL_HasMMX");
	    bindFunc(cast(void**)&SDL_HasMMXExt, "SDL_HasMMXExt");
	    bindFunc(cast(void**)&SDL_Has3DNow, "SDL_Has3DNow");
	    bindFunc(cast(void**)&SDL_Has3DNowExt, "SDL_Has3DNowExt");
	    bindFunc(cast(void**)&SDL_HasSSE, "SDL_HasSSE");
	    bindFunc(cast(void**)&SDL_HasSSE2, "SDL_HasSSE2");
	    bindFunc(cast(void**)&SDL_HasAltiVec, "SDL_HasAltiVec");
	    // error.d
	    bindFunc(cast(void**)&SDL_SetError, "SDL_SetError");
	    bindFunc(cast(void**)&SDL_GetError, "SDL_GetError");
	    bindFunc(cast(void**)&SDL_ClearError, "SDL_ClearError");
	    // events.d
	    bindFunc(cast(void**)&SDL_PumpEvents, "SDL_PumpEvents");
	    bindFunc(cast(void**)&SDL_PeepEvents, "SDL_PeepEvents");
	    bindFunc(cast(void**)&SDL_PollEvent, "SDL_PollEvent");
	    bindFunc(cast(void**)&SDL_WaitEvent, "SDL_WaitEvent");
	    bindFunc(cast(void**)&SDL_PushEvent, "SDL_PushEvent");
	    bindFunc(cast(void**)&SDL_SetEventFilter, "SDL_SetEventFilter");
	    bindFunc(cast(void**)&SDL_GetEventFilter, "SDL_GetEventFilter");
	    bindFunc(cast(void**)&SDL_EventState, "SDL_EventState");
	    // joystick.d
	    bindFunc(cast(void**)&SDL_NumJoysticks, "SDL_NumJoysticks");
	    bindFunc(cast(void**)&SDL_JoystickName, "SDL_JoystickName");
	    bindFunc(cast(void**)&SDL_JoystickOpen, "SDL_JoystickOpen");
	    bindFunc(cast(void**)&SDL_JoystickOpened, "SDL_JoystickOpened");
	    bindFunc(cast(void**)&SDL_JoystickIndex, "SDL_JoystickIndex");
	    bindFunc(cast(void**)&SDL_JoystickNumAxes, "SDL_JoystickNumAxes");
	    bindFunc(cast(void**)&SDL_JoystickNumBalls, "SDL_JoystickNumBalls");
	    bindFunc(cast(void**)&SDL_JoystickNumHats, "SDL_JoystickNumHats");
	    bindFunc(cast(void**)&SDL_JoystickNumButtons, "SDL_JoystickNumButtons");
	    bindFunc(cast(void**)&SDL_JoystickUpdate, "SDL_JoystickUpdate");
	    bindFunc(cast(void**)&SDL_JoystickEventState, "SDL_JoystickEventState");
	    bindFunc(cast(void**)&SDL_JoystickGetAxis, "SDL_JoystickGetAxis");
	    bindFunc(cast(void**)&SDL_JoystickGetHat, "SDL_JoystickGetHat");
	    bindFunc(cast(void**)&SDL_JoystickGetBall, "SDL_JoystickGetBall");
	    bindFunc(cast(void**)&SDL_JoystickGetButton, "SDL_JoystickGetButton");
	    bindFunc(cast(void**)&SDL_JoystickClose, "SDL_JoystickClose");
	    // keyboard.d
	    bindFunc(cast(void**)&SDL_EnableUNICODE, "SDL_EnableUNICODE");
	    bindFunc(cast(void**)&SDL_EnableKeyRepeat, "SDL_EnableKeyRepeat");
	    bindFunc(cast(void**)&SDL_GetKeyRepeat, "SDL_GetKeyRepeat");
	    bindFunc(cast(void**)&SDL_GetKeyState, "SDL_GetKeyState");
	    bindFunc(cast(void**)&SDL_GetModState, "SDL_GetModState");
	    bindFunc(cast(void**)&SDL_SetModState, "SDL_SetModState");
	    bindFunc(cast(void**)&SDL_GetKeyName, "SDL_GetKeyName");
	    // loadso.d
	    bindFunc(cast(void**)&SDL_LoadObject, "SDL_LoadObject");
	    bindFunc(cast(void**)&SDL_LoadFunction, "SDL_LoadFunction");
	    bindFunc(cast(void**)&SDL_UnloadObject, "SDL_UnloadObject");
	    // mouse.d
	    bindFunc(cast(void**)&SDL_GetMouseState, "SDL_GetMouseState");
	    bindFunc(cast(void**)&SDL_GetRelativeMouseState, "SDL_GetRelativeMouseState");
	    bindFunc(cast(void**)&SDL_WarpMouse, "SDL_WarpMouse");
	    bindFunc(cast(void**)&SDL_CreateCursor, "SDL_CreateCursor");
	    bindFunc(cast(void**)&SDL_SetCursor, "SDL_SetCursor");
	    bindFunc(cast(void**)&SDL_GetCursor, "SDL_GetCursor");
	    bindFunc(cast(void**)&SDL_FreeCursor, "SDL_FreeCursor");
	    bindFunc(cast(void**)&SDL_ShowCursor, "SDL_ShowCursor");
	    // mutex.d
	    bindFunc(cast(void**)&SDL_CreateMutex, "SDL_CreateMutex");
	    bindFunc(cast(void**)&SDL_mutexP, "SDL_mutexP");
	    bindFunc(cast(void**)&SDL_mutexV, "SDL_mutexV");
	    bindFunc(cast(void**)&SDL_DestroyMutex, "SDL_DestroyMutex");
	    bindFunc(cast(void**)&SDL_CreateSemaphore, "SDL_CreateSemaphore");
	    bindFunc(cast(void**)&SDL_DestroySemaphore, "SDL_DestroySemaphore");
	    bindFunc(cast(void**)&SDL_SemWait, "SDL_SemWait");
	    bindFunc(cast(void**)&SDL_SemTryWait, "SDL_SemTryWait");
	    bindFunc(cast(void**)&SDL_SemWaitTimeout, "SDL_SemWaitTimeout");
	    bindFunc(cast(void**)&SDL_SemPost, "SDL_SemPost");
	    bindFunc(cast(void**)&SDL_SemValue, "SDL_SemValue");
	    bindFunc(cast(void**)&SDL_CreateCond, "SDL_CreateCond");
	    bindFunc(cast(void**)&SDL_DestroyCond, "SDL_DestroyCond");
	    bindFunc(cast(void**)&SDL_CondSignal, "SDL_CondSignal");
	    bindFunc(cast(void**)&SDL_CondBroadcast, "SDL_CondBroadcast");
	    bindFunc(cast(void**)&SDL_CondWait, "SDL_CondWait");
	    bindFunc(cast(void**)&SDL_CondWaitTimeout, "SDL_CondWaitTimeout");
	    // rwops.d
	    bindFunc(cast(void**)&SDL_RWFromFile, "SDL_RWFromFile");
	    bindFunc(cast(void**)&SDL_RWFromFP, "SDL_RWFromFP");
	    bindFunc(cast(void**)&SDL_RWFromMem, "SDL_RWFromMem");
	    bindFunc(cast(void**)&SDL_RWFromConstMem, "SDL_RWFromConstMem");
	    bindFunc(cast(void**)&SDL_AllocRW, "SDL_AllocRW");
	    bindFunc(cast(void**)&SDL_FreeRW, "SDL_FreeRW");
	    bindFunc(cast(void**)&SDL_ReadLE16, "SDL_ReadLE16");
	    bindFunc(cast(void**)&SDL_ReadBE16, "SDL_ReadBE16");
	    bindFunc(cast(void**)&SDL_ReadLE32, "SDL_ReadLE32");
	    bindFunc(cast(void**)&SDL_ReadBE32, "SDL_ReadBE32");
	    bindFunc(cast(void**)&SDL_ReadLE64, "SDL_ReadLE64");
	    bindFunc(cast(void**)&SDL_ReadBE64, "SDL_ReadBE64");
	    bindFunc(cast(void**)&SDL_WriteLE16, "SDL_WriteLE16");
	    bindFunc(cast(void**)&SDL_WriteBE16, "SDL_WriteBE16");
	    bindFunc(cast(void**)&SDL_WriteLE32, "SDL_WriteLE32");
	    bindFunc(cast(void**)&SDL_WriteBE32, "SDL_WriteBE32");
	    bindFunc(cast(void**)&SDL_WriteLE64, "SDL_WriteLE64");
	    bindFunc(cast(void**)&SDL_WriteBE64, "SDL_WriteBE64");
	    // sdlversion.d
	    bindFunc(cast(void**)&SDL_Linked_Version, "SDL_Linked_Version");
	    // thread.d
	    bindFunc(cast(void**)&SDL_CreateThread, "SDL_CreateThread");
	    bindFunc(cast(void**)&SDL_ThreadID, "SDL_ThreadID");
	    bindFunc(cast(void**)&SDL_GetThreadID, "SDL_GetThreadID");
	    bindFunc(cast(void**)&SDL_WaitThread, "SDL_WaitThread");
	    bindFunc(cast(void**)&SDL_KillThread, "SDL_KillThread");
	    // timer.d
	    bindFunc(cast(void**)&SDL_GetTicks, "SDL_GetTicks");
	    bindFunc(cast(void**)&SDL_Delay, "SDL_Delay");
	    bindFunc(cast(void**)&SDL_SetTimer, "SDL_SetTimer");
	    bindFunc(cast(void**)&SDL_AddTimer, "SDL_AddTimer");
	    bindFunc(cast(void**)&SDL_RemoveTimer, "SDL_RemoveTimer");
	    // video.d
	    bindFunc(cast(void**)&SDL_VideoInit, "SDL_VideoInit");
	    bindFunc(cast(void**)&SDL_VideoQuit, "SDL_VideoQuit");
	    bindFunc(cast(void**)&SDL_VideoDriverName, "SDL_VideoDriverName");
	    bindFunc(cast(void**)&SDL_GetVideoSurface, "SDL_GetVideoSurface");
	    bindFunc(cast(void**)&SDL_GetVideoInfo, "SDL_GetVideoInfo");
	    bindFunc(cast(void**)&SDL_VideoModeOK, "SDL_VideoModeOK");
	    bindFunc(cast(void**)&SDL_ListModes, "SDL_ListModes");
	    bindFunc(cast(void**)&SDL_SetVideoMode, "SDL_SetVideoMode");
	    bindFunc(cast(void**)&SDL_UpdateRects, "SDL_UpdateRects");
	    bindFunc(cast(void**)&SDL_UpdateRect, "SDL_UpdateRect");
	    bindFunc(cast(void**)&SDL_Flip, "SDL_Flip");
	    bindFunc(cast(void**)&SDL_SetGamma, "SDL_SetGamma");
	    bindFunc(cast(void**)&SDL_SetGammaRamp, "SDL_SetGammaRamp");
	    bindFunc(cast(void**)&SDL_GetGammaRamp, "SDL_GetGammaRamp");
	    bindFunc(cast(void**)&SDL_SetColors, "SDL_SetColors");
	    bindFunc(cast(void**)&SDL_SetPalette, "SDL_SetPalette");
	    bindFunc(cast(void**)&SDL_MapRGB, "SDL_MapRGB");
	    bindFunc(cast(void**)&SDL_MapRGBA, "SDL_MapRGBA");
	    bindFunc(cast(void**)&SDL_GetRGB, "SDL_GetRGB");
	    bindFunc(cast(void**)&SDL_GetRGBA, "SDL_GetRGBA");
	    bindFunc(cast(void**)&SDL_CreateRGBSurface, "SDL_CreateRGBSurface");
	    bindFunc(cast(void**)&SDL_CreateRGBSurfaceFrom, "SDL_CreateRGBSurfaceFrom");
	    bindFunc(cast(void**)&SDL_FreeSurface, "SDL_FreeSurface");
	    bindFunc(cast(void**)&SDL_LockSurface, "SDL_LockSurface");
	    bindFunc(cast(void**)&SDL_UnlockSurface, "SDL_UnlockSurface");
	    bindFunc(cast(void**)&SDL_LoadBMP_RW, "SDL_LoadBMP_RW");
	    bindFunc(cast(void**)&SDL_SaveBMP_RW, "SDL_SaveBMP_RW");
	    bindFunc(cast(void**)&SDL_SetColorKey, "SDL_SetColorKey");
	    bindFunc(cast(void**)&SDL_SetAlpha, "SDL_SetAlpha");
	    bindFunc(cast(void**)&SDL_SetClipRect, "SDL_SetClipRect");
	    bindFunc(cast(void**)&SDL_GetClipRect, "SDL_GetClipRect");
	    bindFunc(cast(void**)&SDL_ConvertSurface, "SDL_ConvertSurface");
	    bindFunc(cast(void**)&SDL_UpperBlit, "SDL_UpperBlit");
	    bindFunc(cast(void**)&SDL_LowerBlit, "SDL_LowerBlit");
	    bindFunc(cast(void**)&SDL_FillRect, "SDL_FillRect");
	    bindFunc(cast(void**)&SDL_DisplayFormat, "SDL_DisplayFormat");
	    bindFunc(cast(void**)&SDL_DisplayFormatAlpha, "SDL_DisplayFormatAlpha");
	    bindFunc(cast(void**)&SDL_CreateYUVOverlay, "SDL_CreateYUVOverlay");
	    bindFunc(cast(void**)&SDL_LockYUVOverlay, "SDL_LockYUVOverlay");
	    bindFunc(cast(void**)&SDL_UnlockYUVOverlay, "SDL_UnlockYUVOverlay");
	    bindFunc(cast(void**)&SDL_DisplayYUVOverlay, "SDL_DisplayYUVOverlay");
	    bindFunc(cast(void**)&SDL_FreeYUVOverlay, "SDL_FreeYUVOverlay");
	    bindFunc(cast(void**)&SDL_GL_LoadLibrary, "SDL_GL_LoadLibrary");
	    bindFunc(cast(void**)&SDL_GL_GetProcAddress, "SDL_GL_GetProcAddress");
	    bindFunc(cast(void**)&SDL_GL_SetAttribute, "SDL_GL_SetAttribute");
	    bindFunc(cast(void**)&SDL_GL_GetAttribute, "SDL_GL_GetAttribute");
	    bindFunc(cast(void**)&SDL_GL_SwapBuffers, "SDL_GL_SwapBuffers");
	    bindFunc(cast(void**)&SDL_GL_UpdateRects, "SDL_GL_UpdateRects");
	    bindFunc(cast(void**)&SDL_GL_Lock, "SDL_GL_Lock");
	    bindFunc(cast(void**)&SDL_GL_Unlock, "SDL_GL_Unlock");
	    bindFunc(cast(void**)&SDL_WM_SetCaption, "SDL_WM_SetCaption");
	    bindFunc(cast(void**)&SDL_WM_GetCaption, "SDL_WM_GetCaption");
	    bindFunc(cast(void**)&SDL_WM_SetIcon, "SDL_WM_SetIcon");
	    bindFunc(cast(void**)&SDL_WM_IconifyWindow, "SDL_WM_IconifyWindow");
	    bindFunc(cast(void**)&SDL_WM_ToggleFullScreen, "SDL_WM_ToggleFullScreen");
	    bindFunc(cast(void**)&SDL_WM_GrabInput, "SDL_WM_GrabInput");
	    // sdl.d
	    bindFunc(cast(void**)&SDL_Init, "SDL_Init");
	    bindFunc(cast(void**)&SDL_InitSubSystem, "SDL_InitSubSystem");
	    bindFunc(cast(void**)&SDL_QuitSubSystem, "SDL_QuitSubSystem");
	    bindFunc(cast(void**)&SDL_WasInit, "SDL_WasInit");
	    bindFunc(cast(void**)&SDL_Quit, "SDL_Quit");
	
	    // syswm.d
	    version(Windows) bindFunc(cast(void**)&SDL_GetWMInfo, "SDL_GetWMInfo");
	
	    version(MacOSX) macInit();
	}
}

DerelictSDLLoader DerelictSDL;

static this()
{
	DerelictSDL = new DerelictSDLLoader();
}

static ~this()
{
	DerelictSDL.unload();
}