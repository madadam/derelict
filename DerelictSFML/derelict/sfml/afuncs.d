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
module derelict.sfml.afuncs;

private
{
    import derelict.util.compat;
    import derelict.sfml.config;
    import derelict.sfml.atypes;
}

version(D_Version2)
{
    mixin("alias const(sfInt16*) SFI16PTR;");
}
else
{
    alias sfInt16* SFI16PTR;
}

extern(C)
{
    mixin(gsharedString() ~
    "
    // Listener.h
    void function(float) sfListener_SetGlobalVolume;
    float function() sfListener_GetGlobalVolume;
    void function(float, float, float) sfListener_SetPosition;
    void function(float*, float*, float*) sfListener_GetPosition;
    void function(float, float, float) sfListener_SetTarget;
    void function(float*, float*, float*) sfListener_GetTarget;

    // Music.h
    sfMusic* function(CCPTR) sfMusic_CreateFromFile;
    sfMusic* function(in ubyte*, size_t) sfMusic_CreateFromMemory;
    void function(sfMusic*) sfMusic_Destroy;
    void function(sfMusic*, sfBool) sfMusic_SetLoop;
    sfBool function(sfMusic*) sfMusic_GetLoop;
    float function(sfMusic*) sfMusic_GetDuration;
    void function(sfMusic*) sfMusic_Play;
    void function(sfMusic*) sfMusic_Pause;
    void function(sfMusic*) sfMusic_Stop;
    uint function(sfMusic*) sfMusic_GetChannelsCount;
    uint function(sfMusic*) sfMusic_GetSampleRate;
    sfSoundStatus function(sfMusic*) sfMusic_GetStatus;
    float function(sfMusic*) sfMusic_GetPlayingOffset;
    void function(sfMusic*, float) sfMusic_SetPitch;
    void function(sfMusic*, float) sfMusic_SetVolume;
    void function(sfMusic*, float, float, float) sfMusic_SetPosition;
    void function(sfMusic*, sfBool) sfMusic_SetRelativeToListener;
    void function(sfMusic*, float) sfMusic_SetMinDistance;
    void function(sfMusic*, float) sfMusic_SetAttenuation;
    float function(sfMusic*) sfMusic_GetPitch;
    float function(sfMusic*) sfMusic_GetVolume;
    void function(sfMusic*, float*, float*, float*) sfMusic_GetPosition;
    sfBool function(sfMusic*) sfMusic_IsRelativeToListener;
    float function(sfMusic*) sfMusic_GetMinDistance;
    float function(sfMusic*) sfMusic_GetAttenuation;

    // Sound.h
    sfSound* function() sfSound_Create;
    void function(sfSound*) sfSound_Destroy;
    void function(sfSound*) sfSound_Play;
    void function(sfSound*) sfSound_Pause;
    void function(sfSound*) sfSound_Stop;
    void function(sfSound*, sfSoundBuffer*) sfSound_SetBuffer;
    sfSoundBuffer* function(sfSound*) sfSound_GetBuffer;
    void function(sfSound*, sfBool) sfSound_SetLoop;
    sfBool function(sfSound*) sfSound_GetLoop;
    sfSoundStatus function(sfSound*) sfSound_GetStatus;
    void function(sfSound*, float) sfSound_SetPitch;
    void function(sfSound*, float) sfSound_SetVolume;
    void function(sfSound*, float, float, float) sfSound_SetPosition;
    void function(sfSound*, sfBool) sfSound_SetRelativeToListener;
    void function(sfSound*, float) sfSound_SetMinDistance;
    void function(sfSound*, float) sfSound_SetAttenuation;
    void function(sfSound*, float) sfSound_SetPlayingOffset;
    float function(sfSound*) sfSound_GetPitch;
    float function(sfSound*) sfSound_GetVolume;
    void function(sfSound*, float*, float*, float*) sfSound_GetPosition;
    sfBool function(sfSound*) sfSound_IsRelativeToListener;
    float function(sfSound*) sfSound_GetMinDistance;
    float function(sfSound*) sfSound_GetAttenuation;
    float function(sfSound*) sfSound_GetPlayingOffset;

    // SoundBuffer.h
    sfSoundBuffer* function(CCPTR) sfSoundBuffer_CreateFromFile;
    sfSoundBuffer* function(in ubyte*, size_t) sfSoundBuffer_CreateFromMemory;
    sfSoundBuffer* function(in sfInt16, size_t, uint, uint) sfSoundBuffer_CreateFromSamples;
    void function(sfSoundBuffer*) sfSoundBuffer_Destroy;
    sfBool function(sfSoundBuffer*, CCPTR) sfSoundBuffer_SaveToFile;
    SFI16PTR function(sfSoundBuffer*) sfSoundBuffer_GetSamples;
    size_t function(sfSoundBuffer*) sfSoundBuffer_GetSamplesCount;
    uint function(sfSoundBuffer*) sfSoundBuffer_GetSampleRate;
    uint function(sfSoundBuffer*) sfSoundBuffer_GetChannelsCount;
    float function(sfSoundBuffer*) sfSoundBuffer_GetDuration;

    // SoundBufferRecorder.h
    sfSoundBufferRecorder* function() sfSoundBufferRecorder_Create;
    void function(sfSoundBufferRecorder*) sfSoundBufferRecorder_Destroy;
    void function(sfSoundBufferRecorder*, uint) sfSoundBufferRecorder_Start;
    void function(sfSoundBufferRecorder*) sfSoundBufferRecorder_Stop;
    uint function(sfSoundBufferRecorder*) sfSoundBufferRecorder_GetSampleRate;
    sfSoundBuffer* function(sfSoundBufferRecorder*) sfSoundBufferRecorder_GetBuffer;

    // SoundRecorder.h
    sfSoundRecorder* function(sfSoundRecorderStartCallback, sfSoundRecorderProcessCallback, sfSoundRecorderStopCallback) sfSoundRecorder_Create;
    void function(sfSoundRecorder*) sfSoundRecorder_Destroy;
    void function(sfSoundRecorder*, uint) sfSoundRecorder_Start;
    void function(sfSoundRecorder*) sfSoundRecorder_Stop;
    uint function(sfSoundRecorder*) sfSoundRecorder_GetSampleRate;
    sfBool function(sfSoundRecorder*) sfSoundRecorder_CanCapture;

    // SoundStream.h
    sfSoundStream* function(sfSoundStreamStartCallback, sfSoundStreamGetDataCallback, uint, uint, void*) sfSoundStream_Create;
    void function(sfSoundStream*) sfSoundStream_Destroy;
    void function(sfSoundStream*) sfSoundStream_Play;
    void function(sfSoundStream*) sfSoundStream_Pause;
    void function(sfSoundStream*) sfSoundStream_Stop;
    sfSoundStatus function(sfSoundStream*) sfSoundStream_GetStatus;
    uint function(sfSoundStream*) sfSoundStream_GetChannelsCount;
    uint function(sfSoundStream*) sfSoundStream_GetSampleRate;
    void function(sfSoundStream*, float) sfSoundStream_SetPitch;
    void function(sfSoundStream*, float) sfSoundStream_SetVolume;
    void function(sfSoundStream*, float, float, float) sfSoundStream_SetPosition;
    void function(sfSoundStream*, sfBool) sfSoundStream_SetRelativeToListener;
    void function(sfSoundStream*, float) sfSoundStream_SetMinDistance;
    void function(sfSoundStream*, float) sfSoundStream_SetAttenuation;
    void function(sfSoundStream*, sfBool) sfSoundStream_SetLoop;
    float function(sfSoundStream*) sfSoundStream_GetPitch;
    float function(sfSoundStream*) sfSoundStream_GetVolume;
    void function(sfSoundStream*, float*, float*, float*) sfSoundStream_GetPosition;
    sfBool function(sfSoundStream*) sfSoundStream_IsRelativeToListener;
    float function(sfSoundStream*) sfSoundStream_GetMinDistance;
    float function(sfSoundStream*) sfSoundStream_GetAttenuation;
    sfBool function(sfSoundStream*) sfSoundStream_GetLoop;
    float function(sfSoundStream*) sfSoundStream_GetPlayingOffset;
    ");
}