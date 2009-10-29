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
 * * Neither the names 'Derelict', 'DerelictSDLMixer', nor the names of its contributors
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
module derelict.sdl.mixer;

private
{
    import derelict.sdl.sdl;
    import derelict.util.loader;
    import derelict.util.exception;
    import derelict.util.compat;
}

enum : Uint8
{
    SDL_MIXER_MAJOR_VERSION     = 1,
    SDL_MIXER_MINOR_VERSION     = 2,
    SDL_MIXER_PATCHLEVEL        = 9,
}
alias SDL_MIXER_MAJOR_VERSION MIX_MAJOR_VERSION;
alias SDL_MIXER_MINOR_VERSION MIX_MINOR_VERSION;
alias SDL_MIXER_PATCHLEVEL MIX_PATCH_LEVEL;

alias SDL_SetError Mix_SetError;
alias SDL_GetError Mix_GetError;

struct Mix_Chunk
{
   int allocated;
   Uint8* abuf;
   Uint32 alen;
   Uint8 volume;
};

enum Mix_Fading
{
   MIX_NO_FADING,
   MIX_FADING_OUT,
   MIX_FADING_IN
};

enum Mix_MusicType
{
   MUS_NONE,
   MUS_CMD,
   MUS_WAV,
   MUS_MOD,
   MUS_MID,
   MUS_OGG,
   MUS_MP3,
   MUS_MP3_MAD,
   MUS_FLAC,
};

struct _Mix_Music {}
typedef _Mix_Music Mix_Music;

enum
{
    MIX_CHANNELS              = 8,
    MIX_DEFAULT_FREQUENCY     = 22050,
    MIX_DEFAULT_CHANNELS      = 2,
    MIX_MAX_VOLUME            = 128,
    MIX_CHANNEL_POST          = -2,
}

version (LittleEndian) {
    enum { MIX_DEFAULT_FORMAT = AUDIO_S16LSB }
} else {
    enum { MIX_DEFAULT_FORMAT = AUDIO_S16MSB }
}

const char[] MIX_EFFECTSMAXSPEED    = "MIX_EFFECTSMAXSPEED";

extern(C)
{
    typedef void function(int chan, void* stream, int len, void* udata) Mix_EffectFunc_t;
    typedef void function(int chan, void* udata) Mix_EffectDone_t;
}

void SDL_MIXER_VERSION(SDL_version* X)
{
    X.major = SDL_MIXER_MAJOR_VERSION;
    X.minor = SDL_MIXER_MINOR_VERSION;
    X.patch = SDL_MIXER_PATCHLEVEL;
}
alias SDL_MIXER_VERSION MIX_VERSION;


Mix_Chunk* Mix_LoadWAV(in char[] file)
{
    return Mix_LoadWAV_RW(SDL_RWFromFile(toCString(file), toCString("rb")), 1);
}

int Mix_PlayChannel(int channel, Mix_Chunk* chunk, int loops)
{
    return Mix_PlayChannelTimed(channel, chunk, loops, -1);
}

int Mix_FadeInChannel(int channel, Mix_Chunk* chunk, int loops, int ms)
{
    return Mix_FadeInChannelTimed(channel, chunk, loops, ms, -1);
}

extern (C)
{
    CSDLVERPTR function() Mix_Linked_Version;
    int function (int, Uint16, int, int) Mix_OpenAudio;
    int function(int) Mix_AllocateChannels;
    int function(int*, Uint16*, int*) Mix_QuerySpec;
    Mix_Chunk* function(SDL_RWops*, int) Mix_LoadWAV_RW;
    Mix_Music* function(in char*) Mix_LoadMUS;
    Mix_Music* function(SDL_RWops*) Mix_LoadMUS_RW;
    Mix_Chunk* function(Uint8*) Mix_QuickLoad_WAV;
    Mix_Chunk* function(Uint8*, Uint32) Mix_QuickLoad_RAW;
    void function(Mix_Chunk*) Mix_FreeChunk;
    void function(Mix_Music*) Mix_FreeMusic;
    int function() Mix_GetNumChunkDecoders;
    CCPTR function(int) Mix_GetChunkDecoder;
    int function() Mix_GetNumMusicDecoders;
    CCPTR function() Mix_GetMusicDecoder;
    Mix_MusicType function(in Mix_Music*) Mix_GetMusicType;
    void function(void (*mix_func)(void*, Uint8*, int), void*) Mix_SetPostMix;
    void function(void (*mix_func)(void*, Uint8*, int), void*) Mix_HookMusic;
    void function(void (*music_finished)()) Mix_HookMusicFinished;
    void*  function() Mix_GetMusicHookData;
    void function(void (*channel_finished)(int channel)) Mix_ChannelFinished;
    int function(int, Mix_EffectFunc_t, Mix_EffectDone_t, void*) Mix_RegisterEffect;
    int function(int, Mix_EffectFunc_t) Mix_UnregisterEffect;
    int function(int) Mix_UnregisterAllEffects;
    int function(int, Uint8, Uint8) Mix_SetPanning;
    int function(int, Sint16, Uint8) Mix_SetPosition;
    int function(int, Uint8) Mix_SetDistance;
    // int function(int, Uint8) Mix_SetReverb;
    int function(int, int) Mix_SetReverseStereo;
    int function(int) Mix_ReserveChannels;
    int function(int, int) Mix_GroupChannel;
    int function(int, int, int) Mix_GroupChannels;
    int function(int) Mix_GroupAvailable;
    int function(int) Mix_GroupCount;
    int function(int) Mix_GroupOldest;
    int function(int) Mix_GroupNewer;
    int function(int, Mix_Chunk*, int, int) Mix_PlayChannelTimed;
    int function(Mix_Music*, int) Mix_PlayMusic;
    int function(Mix_Music*, int, int) Mix_FadeInMusic;
    int function(Mix_Music*, int, int, double) Mix_FadeInMusicPos;
    int function(int, Mix_Chunk*, int, int, int) Mix_FadeInChannelTimed;
    int function(int, int) Mix_Volume;
    int function(Mix_Chunk*, int) Mix_VolumeChunk;
    int function(int) Mix_VolumeMusic;
    int function(int) Mix_HaltChannel;
    int function(int) Mix_HaltGroup;
    int function() Mix_HaltMusic;
    int function(int, int) Mix_ExpireChannel;
    int function(int, int) Mix_FadeOutChannel;
    int function(int, int) Mix_FadeOutGroup;
    int function(int) Mix_FadeOutMusic;
    Mix_Fading function() Mix_FadingMusic;
    Mix_Fading function(int) Mix_FadingChannel;
    void function(int) Mix_Pause;
    void function(int) Mix_Resume;
    int function(int) Mix_Paused;
    void function() Mix_PauseMusic;
    void function() Mix_ResumeMusic;
    void function() Mix_RewindMusic;
    int function() Mix_PausedMusic;
    int function(double) Mix_SetMusicPosition;
    int function(int) Mix_Playing;
    int function() Mix_PlayingMusic;
    int function(in char*) Mix_SetMusicCMD;
    int function(int) Mix_SetSynchroValue;
    int function() Mix_GetSynchroValue;
    Mix_Chunk* function(int) Mix_GetChunk;
    void function() Mix_CloseAudio;
}

class DerelictSDLMixerLoader : SharedLibLoader
{
public:
    this()
    {
        super(
            "SDL_mixer.dll",
            "libSDL_mixer.so, libSDL_mixer-1.2.so, libSDL_mixer-1.2.so.0",
            "../Frameworks/SDL_mixer.framework/SDL_mixer, /Library/Frameworks/SDL_mixer.framework/SDL_mixer, /System/Library/Frameworks/SDL_mixer.framework/SDL_mixer"
        );
    }

protected:
    override void loadSymbols()
    {
        if(!DerelictSDL.isLoaded)
        {
            throw new SharedLibLoadException("DerelictSDL must be loaded before attempting to load DerelictSDLMixer!");
        }

        bindFunc(cast(void**)&Mix_Linked_Version, "Mix_Linked_Version");
        bindFunc(cast(void**)&Mix_OpenAudio, "Mix_OpenAudio");
        bindFunc(cast(void**)&Mix_AllocateChannels, "Mix_AllocateChannels");
        bindFunc(cast(void**)&Mix_QuerySpec, "Mix_QuerySpec");
        bindFunc(cast(void**)&Mix_LoadWAV_RW, "Mix_LoadWAV_RW");
        bindFunc(cast(void**)&Mix_LoadMUS, "Mix_LoadMUS");
        bindFunc(cast(void**)&Mix_LoadMUS_RW, "Mix_LoadMUS_RW");
        bindFunc(cast(void**)&Mix_QuickLoad_WAV, "Mix_QuickLoad_WAV");
        bindFunc(cast(void**)&Mix_QuickLoad_RAW, "Mix_QuickLoad_RAW");
        bindFunc(cast(void**)&Mix_FreeChunk, "Mix_FreeChunk");
        bindFunc(cast(void**)&Mix_FreeMusic, "Mix_FreeMusic");
        bindFunc(cast(void**)&Mix_GetNumChunkDecoders, "Mix_GetNumChunkDecoders");
        bindFunc(cast(void**)&Mix_GetChunkDecoder, "Mix_GetChunkDecoder");
        bindFunc(cast(void**)&Mix_GetNumMusicDecoders, "Mix_GetNumMusicDecoders");
        bindFunc(cast(void**)&Mix_GetMusicDecoder, "Mix_GetMusicDecoder");
        bindFunc(cast(void**)&Mix_GetMusicType, "Mix_GetMusicType");
        bindFunc(cast(void**)&Mix_SetPostMix, "Mix_SetPostMix");
        bindFunc(cast(void**)&Mix_HookMusic, "Mix_HookMusic");
        bindFunc(cast(void**)&Mix_HookMusicFinished, "Mix_HookMusicFinished");
        bindFunc(cast(void**)&Mix_GetMusicHookData, "Mix_GetMusicHookData");
        bindFunc(cast(void**)&Mix_ChannelFinished, "Mix_ChannelFinished");
        bindFunc(cast(void**)&Mix_RegisterEffect, "Mix_RegisterEffect");
        bindFunc(cast(void**)&Mix_UnregisterEffect, "Mix_UnregisterEffect");
        bindFunc(cast(void**)&Mix_UnregisterAllEffects, "Mix_UnregisterAllEffects");
        bindFunc(cast(void**)&Mix_SetPanning, "Mix_SetPanning");
        bindFunc(cast(void**)&Mix_SetPosition, "Mix_SetPosition");
        bindFunc(cast(void**)&Mix_SetDistance, "Mix_SetDistance");
        // bindFunc(cast(void**)&Mix_SetReverb, "Mix_SetReverb");
        bindFunc(cast(void**)&Mix_SetReverseStereo, "Mix_SetReverseStereo");
        bindFunc(cast(void**)&Mix_ReserveChannels, "Mix_ReserveChannels");
        bindFunc(cast(void**)&Mix_GroupChannel, "Mix_GroupChannel");
        bindFunc(cast(void**)&Mix_GroupChannels, "Mix_GroupChannels");
        bindFunc(cast(void**)&Mix_GroupAvailable, "Mix_GroupAvailable");
        bindFunc(cast(void**)&Mix_GroupCount, "Mix_GroupCount");
        bindFunc(cast(void**)&Mix_GroupOldest, "Mix_GroupOldest");
        bindFunc(cast(void**)&Mix_GroupNewer, "Mix_GroupNewer");
        bindFunc(cast(void**)&Mix_PlayChannelTimed, "Mix_PlayChannelTimed");
        bindFunc(cast(void**)&Mix_PlayMusic, "Mix_PlayMusic");
        bindFunc(cast(void**)&Mix_FadeInMusic, "Mix_FadeInMusic");
        bindFunc(cast(void**)&Mix_FadeInMusicPos, "Mix_FadeInMusicPos");
        bindFunc(cast(void**)&Mix_FadeInChannelTimed, "Mix_FadeInChannelTimed");
        bindFunc(cast(void**)&Mix_Volume, "Mix_Volume");
        bindFunc(cast(void**)&Mix_VolumeChunk, "Mix_VolumeChunk");
        bindFunc(cast(void**)&Mix_VolumeMusic, "Mix_VolumeMusic");
        bindFunc(cast(void**)&Mix_HaltChannel, "Mix_HaltChannel");
        bindFunc(cast(void**)&Mix_HaltGroup, "Mix_HaltGroup");
        bindFunc(cast(void**)&Mix_HaltMusic, "Mix_HaltMusic");
        bindFunc(cast(void**)&Mix_ExpireChannel, "Mix_ExpireChannel");
        bindFunc(cast(void**)&Mix_FadeOutChannel, "Mix_FadeOutChannel");
        bindFunc(cast(void**)&Mix_FadeOutGroup, "Mix_FadeOutGroup");
        bindFunc(cast(void**)&Mix_FadeOutMusic, "Mix_FadeOutMusic");
        bindFunc(cast(void**)&Mix_FadingMusic, "Mix_FadingMusic");
        bindFunc(cast(void**)&Mix_FadingChannel, "Mix_FadingChannel");
        bindFunc(cast(void**)&Mix_Pause, "Mix_Pause");
        bindFunc(cast(void**)&Mix_Resume, "Mix_Resume");
        bindFunc(cast(void**)&Mix_Paused, "Mix_Paused");
        bindFunc(cast(void**)&Mix_PauseMusic, "Mix_PauseMusic");
        bindFunc(cast(void**)&Mix_ResumeMusic, "Mix_ResumeMusic");
        bindFunc(cast(void**)&Mix_RewindMusic, "Mix_RewindMusic");
        bindFunc(cast(void**)&Mix_PausedMusic, "Mix_PausedMusic");
        bindFunc(cast(void**)&Mix_SetMusicPosition, "Mix_SetMusicPosition");
        bindFunc(cast(void**)&Mix_Playing, "Mix_Playing");
        bindFunc(cast(void**)&Mix_PlayingMusic, "Mix_PlayingMusic");
        bindFunc(cast(void**)&Mix_SetMusicCMD, "Mix_SetMusicCMD");
        bindFunc(cast(void**)&Mix_SetSynchroValue, "Mix_SetSynchroValue");
        bindFunc(cast(void**)&Mix_GetSynchroValue, "Mix_GetSynchroValue");
        bindFunc(cast(void**)&Mix_GetChunk, "Mix_GetChunk");
        bindFunc(cast(void**)&Mix_CloseAudio, "Mix_CloseAudio");
    }
}

DerelictSDLMixerLoader DerelictSDLMixer;

static this()
{
    DerelictSDLMixer = new DerelictSDLMixerLoader();
}

static ~this()
{
    DerelictSDLMixer.unload();
}