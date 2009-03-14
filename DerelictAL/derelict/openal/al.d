/*
 * Copyright (c) 2004-2008 Derelict Developers
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
 * * Neither the names 'Derelict', 'DerelictAL', nor the names of its contributors
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
module derelict.openal.al;

public
{
    import derelict.openal.altypes;
    import derelict.openal.alfuncs;
}

private
{
	import derelict.util.loader;
}

class DerelictALLoader : SharedLibLoader
{
public:
	this()
	{
		super(
			"OpenAl32.dll",
	        "libal.so, libAL.so, libopenal.so, libopenal.so.1, libopenal.so.0",
	        ""
	    );
	}
	
protected:
	override void loadSymbols()
	{
	    bindFunc(cast(void**)&alEnable, "alEnable");
	    bindFunc(cast(void**)&alDisable, "alDisable");
	    bindFunc(cast(void**)&alIsEnabled, "alIsEnabled");

	    bindFunc(cast(void**)&alGetString, "alGetString");
	    bindFunc(cast(void**)&alGetBooleanv, "alGetBooleanv");
	    bindFunc(cast(void**)&alGetIntegerv, "alGetIntegerv");
	    bindFunc(cast(void**)&alGetFloatv, "alGetFloatv");
	    bindFunc(cast(void**)&alGetDoublev, "alGetDoublev");
	    bindFunc(cast(void**)&alGetInteger, "alGetInteger");
	    bindFunc(cast(void**)&alGetFloat, "alGetFloat");
	    bindFunc(cast(void**)&alGetDouble, "alGetDouble");
	    bindFunc(cast(void**)&alGetError, "alGetError");
	
	    bindFunc(cast(void**)&alIsExtensionPresent, "alIsExtensionPresent");
	    bindFunc(cast(void**)&alGetProcAddress, "alGetProcAddress");
	    bindFunc(cast(void**)&alGetEnumValue, "alGetEnumValue");
	
	    bindFunc(cast(void**)&alListenerf, "alListenerf");
	    bindFunc(cast(void**)&alListener3f, "alListener3f");
	    bindFunc(cast(void**)&alListenerfv, "alListenerfv");
	    bindFunc(cast(void**)&alListeneri, "alListeneri");
	    bindFunc(cast(void**)&alListener3i, "alListener3i");
	    bindFunc(cast(void**)&alListeneriv, "alListeneriv");
	
	    bindFunc(cast(void**)&alGetListenerf, "alGetListenerf");
	    bindFunc(cast(void**)&alGetListener3f, "alGetListener3f");
	    bindFunc(cast(void**)&alGetListenerfv, "alGetListenerfv");
	    bindFunc(cast(void**)&alGetListeneri, "alGetListeneri");
	    bindFunc(cast(void**)&alGetListener3i, "alGetListener3i");
	    bindFunc(cast(void**)&alGetListeneriv, "alGetListeneriv");
	
	    bindFunc(cast(void**)&alGenSources, "alGenSources");
	    bindFunc(cast(void**)&alDeleteSources, "alDeleteSources");
	    bindFunc(cast(void**)&alIsSource, "alIsSource");
	
	    bindFunc(cast(void**)&alSourcef, "alSourcef");
	    bindFunc(cast(void**)&alSource3f, "alSource3f");
	    bindFunc(cast(void**)&alSourcefv, "alSourcefv");
	    bindFunc(cast(void**)&alSourcei, "alSourcei");
	    bindFunc(cast(void**)&alSource3i, "alSource3i");
	    bindFunc(cast(void**)&alSourceiv, "alSourceiv");
	
	    bindFunc(cast(void**)&alGetSourcef, "alGetSourcef");
	    bindFunc(cast(void**)&alGetSource3f, "alGetSource3f");
	    bindFunc(cast(void**)&alGetSourcefv, "alGetSourcefv");
	    bindFunc(cast(void**)&alGetSourcei, "alGetSourcei");
	    bindFunc(cast(void**)&alGetSourceiv, "alGetSourceiv");
	
	    bindFunc(cast(void**)&alSourcePlayv, "alSourcePlayv");
	    bindFunc(cast(void**)&alSourceStopv, "alSourceStopv");
	    bindFunc(cast(void**)&alSourceRewindv, "alSourceRewindv");
	    bindFunc(cast(void**)&alSourcePausev, "alSourcePausev");
	    bindFunc(cast(void**)&alSourcePlay, "alSourcePlay");
	    bindFunc(cast(void**)&alSourcePause, "alSourcePause");
	    bindFunc(cast(void**)&alSourceRewind, "alSourceRewind");
	    bindFunc(cast(void**)&alSourceStop, "alSourceStop");
	
	    bindFunc(cast(void**)&alSourceQueueBuffers, "alSourceQueueBuffers");
	    bindFunc(cast(void**)&alSourceUnqueueBuffers, "alSourceUnqueueBuffers");
	
	    bindFunc(cast(void**)&alGenBuffers, "alGenBuffers");
	    bindFunc(cast(void**)&alDeleteBuffers, "alDeleteBuffers");
	    bindFunc(cast(void**)&alIsBuffer, "alIsBuffer");
	    bindFunc(cast(void**)&alBufferData, "alBufferData");
	
	    bindFunc(cast(void**)&alBufferf, "alBufferf");
	    bindFunc(cast(void**)&alBuffer3f, "alBuffer3f");
	    bindFunc(cast(void**)&alBufferfv, "alBufferfv");
	    bindFunc(cast(void**)&alBufferi, "alBufferi");
	    bindFunc(cast(void**)&alBuffer3i, "alBuffer3i");
	    bindFunc(cast(void**)&alBufferiv, "alBufferiv");
	
	    bindFunc(cast(void**)&alGetBufferf, "alGetBufferf");
	    bindFunc(cast(void**)&alGetBuffer3f, "alGetBuffer3f");
	    bindFunc(cast(void**)&alGetBufferfv, "alGetBufferfv");
	    bindFunc(cast(void**)&alGetBufferi, "alGetBufferi");
	    bindFunc(cast(void**)&alGetBuffer3i, "alGetBuffer3i");
	    bindFunc(cast(void**)&alGetBufferiv, "alGetBufferiv");
	
	    bindFunc(cast(void**)&alDopplerFactor, "alDopplerFactor");
	    bindFunc(cast(void**)&alDopplerVelocity, "alDopplerVelocity");
	    bindFunc(cast(void**)&alSpeedOfSound, "alSpeedOfSound");
	    bindFunc(cast(void**)&alDistanceModel, "alDistanceModel");
	    
	    bindFunc(cast(void**)&alcCreateContext, "alcCreateContext");
	    bindFunc(cast(void**)&alcMakeContextCurrent, "alcMakeContextCurrent");
	    bindFunc(cast(void**)&alcProcessContext, "alcProcessContext");
	    bindFunc(cast(void**)&alcGetCurrentContext, "alcGetCurrentContext");
	    bindFunc(cast(void**)&alcGetContextsDevice, "alcGetContextsDevice");
	    bindFunc(cast(void**)&alcSuspendContext, "alcSuspendContext");
	    bindFunc(cast(void**)&alcDestroyContext, "alcDestroyContext");
	    bindFunc(cast(void**)&alcOpenDevice, "alcOpenDevice");
	    bindFunc(cast(void**)&alcCloseDevice, "alcCloseDevice");
	    bindFunc(cast(void**)&alcGetError, "alcGetError");
	    bindFunc(cast(void**)&alcIsExtensionPresent, "alcIsExtensionPresent");
	    bindFunc(cast(void**)&alcGetProcAddress, "alcGetProcAddress");
	    bindFunc(cast(void**)&alcGetEnumValue, "alcGetEnumValue");
	    bindFunc(cast(void**)&alcGetString, "alcGetString");
	    bindFunc(cast(void**)&alcGetIntegerv, "alcGetIntegerv");
	    bindFunc(cast(void**)&alcCaptureOpenDevice, "alcCaptureOpenDevice");
	    bindFunc(cast(void**)&alcCaptureCloseDevice, "alcCaptureCloseDevice");
	    bindFunc(cast(void**)&alcCaptureStart, "alcCaptureStart");
	    bindFunc(cast(void**)&alcCaptureStop, "alcCaptureStop");
	    bindFunc(cast(void**)&alcCaptureSamples, "alcCaptureSamples");
	}
}

DerelictALLoader DerelictAL;

static this()
{
	DerelictAL = new DerelictALLoader();
}

static ~this()
{
	DerelictAL.unload();
}