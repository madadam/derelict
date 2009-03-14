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
module derelict.openal.alfuncs;

private
{
    import derelict.openal.altypes;
    import derelict.util.compat;
}

extern(C)
{
	void function(ALenum) alEnable;
	void function(ALenum) alDisable;
	ALboolean function(ALenum) alIsEnabled;
	
	CCPTR function(ALenum) alGetString;
	void function(ALenum, ALboolean*) alGetBooleanv;
	void function(ALenum, ALint*) alGetIntegerv;
	void function(ALenum, ALfloat*) alGetFloatv;
	void function(ALenum, ALdouble*) alGetDoublev;
	ALboolean function(ALenum) alGetBoolean;
	ALint function(ALenum) alGetInteger;
	ALfloat function(ALenum) alGetFloat;
	ALdouble function(ALenum) alGetDouble;
	ALenum function() alGetError;
	
	ALboolean function(in char*) alIsExtensionPresent;
	ALboolean function(in char*) alGetProcAddress;
	ALenum function(in char*) alGetEnumValue;
	
	void function(ALenum, ALfloat) alListenerf;
	void function(ALenum, ALfloat, ALfloat, ALfloat) alListener3f;
	void function(ALenum, in ALfloat*) alListenerfv;
	void function(ALenum, ALint) alListeneri;
	void function(ALenum, ALint, ALint, ALint) alListener3i;
	void function(ALenum, in ALint*) alListeneriv;
	
	void function(ALenum, ALfloat*) alGetListenerf;
	void function(ALenum, ALfloat*, ALfloat*, ALfloat*) alGetListener3f;
	void function(ALenum, ALfloat*) alGetListenerfv;
	void function(ALenum, ALint*) alGetListeneri;
	void function(ALenum, ALint*, ALint*, ALint*) alGetListener3i;
	void function(ALenum, ALint*) alGetListeneriv;
	
	void function(ALsizei, ALuint*) alGenSources;
	void function(ALsizei, in ALuint*) alDeleteSources;
	ALboolean function(ALuint) alIsSource;
	
	void function(ALuint, ALenum, ALfloat) alSourcef;
	void function(ALuint, ALenum, ALfloat, ALfloat, ALfloat) alSource3f;
	void function(ALuint, ALenum, in ALfloat*) alSourcefv;
	void function(ALuint, ALenum, ALint) alSourcei;
	void function(ALuint, ALenum, ALint, ALint, ALint) alSource3i;
	void function(ALuint, ALenum, in ALint*) alSourceiv;
	
	
	void function(ALuint, ALenum, ALfloat*) alGetSourcef;
	void function(ALuint, ALenum, ALfloat*, ALfloat*, ALfloat*) alGetSource3f;
	void function(ALuint, ALenum, ALfloat*) alGetSourcefv;
	void function(ALuint, ALenum, ALint*) alGetSourcei;
	void function(ALuint, ALenum, ALint*, ALint*, ALint*) alGetSource3i;
	void function(ALuint, ALenum, ALint*) alGetSourceiv;
	
	void function(ALsizei, in ALuint*) alSourcePlayv;
	void function(ALsizei, in ALuint*) alSourceStopv;
	void function(ALsizei, in ALuint*) alSourceRewindv;
	void function(ALsizei, in ALuint*) alSourcePausev;
	void function(ALuint) alSourcePlay;
	void function(ALuint) alSourcePause;
	void function(ALuint) alSourceRewind;
	void function(ALuint) alSourceStop;
	
	void function(ALuint, ALsizei, ALuint*) alSourceQueueBuffers;
	void function(ALuint, ALsizei, ALuint*) alSourceUnqueueBuffers;
	
	void function(ALsizei, ALuint*) alGenBuffers;
	void function(ALsizei, in ALuint*) alDeleteBuffers;
	ALboolean function(ALuint) alIsBuffer;
	void function(ALuint, ALenum, in ALvoid*, ALsizei, ALsizei) alBufferData;
	
	void function(ALuint, ALenum, ALfloat) alBufferf;
	void function(ALuint, ALenum, ALfloat, ALfloat, ALfloat) alBuffer3f;
	void function(ALuint, ALenum, in ALfloat*) alBufferfv;
	void function(ALuint, ALenum, ALint) alBufferi;
	void function(ALuint, ALenum, ALint, ALint, ALint) alBuffer3i;
	void function(ALuint, ALenum, in ALint*) alBufferiv;
	
	void function(ALuint, ALenum, ALfloat*) alGetBufferf;
	void function(ALuint, ALenum, ALfloat*, ALfloat*, ALfloat*) alGetBuffer3f;
	void function(ALuint, ALenum, ALfloat*) alGetBufferfv;
	void function(ALuint, ALenum, ALint*) alGetBufferi;
	void function(ALuint, ALenum, ALint*, ALint*, ALint*) alGetBuffer3i;
	void function(ALuint, ALenum, ALint*) alGetBufferiv;
	
	void function(ALfloat) alDopplerFactor;
	void function(ALfloat) alDopplerVelocity;
	void function(ALfloat) alSpeedOfSound;
	void function(ALenum) alDistanceModel;
	
	ALCcontext* function(ALCdevice*, in ALCint*) alcCreateContext;
	ALCboolean function(ALCcontext*) alcMakeContextCurrent;
	void function(ALCcontext*) alcProcessContext;
	void function(ALCcontext*) alcSuspendContext;
	void function(ALCcontext*) alcDestroyContext;
	ALCcontext* function() alcGetCurrentContext;
	ALCdevice* function(ALCcontext*) alcGetContextsDevice;
	ALCdevice* function(in char*) alcOpenDevice;
	ALCboolean function(ALCdevice*) alcCloseDevice;
	ALCenum function(ALCdevice*) alcGetError;
	ALCboolean function(ALCdevice*, in char*) alcIsExtensionPresent;
	void* function(ALCdevice*, in char*) alcGetProcAddress;
	ALCenum function(ALCdevice*, in char*) alcGetEnumValue;
	CCPTR function(ALCdevice*, ALCenum) alcGetString;
	void function(ALCdevice*, ALCenum, ALCsizei, ALCint*) alcGetIntegerv;
	ALCdevice* function(in char*, ALCuint, ALCenum, ALCsizei) alcCaptureOpenDevice;
	ALCboolean function(ALCdevice*) alcCaptureCloseDevice;
	void function(ALCdevice*) alcCaptureStart;
	void function(ALCdevice*) alcCaptureStop;
	void function(ALCdevice*, ALCvoid*, ALCsizei) alcCaptureSamples;
}