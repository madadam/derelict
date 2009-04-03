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
 * * Neither the names 'Derelict', 'DerelictSDLImage', nor the names of its contributors
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
module derelict.sdl.image;

private
{
    import derelict.sdl.sdl;
    import derelict.util.loader;
    import derelict.util.exception;
}

alias SDL_SetError IMG_SetError;
alias SDL_GetError IMG_GetError;

enum : Uint8
{
    SDL_IMAGE_MAJOR_VERSION     = 1,
    SDL_IMAGE_MINOR_VERSION     = 2,
    SDL_IMAGE_PATCHLEVEL        = 7,
}

void SDL_IMAGE_VERSION(SDL_version* X)
{
    X.major     = SDL_IMAGE_MAJOR_VERSION;
    X.minor     = SDL_IMAGE_MINOR_VERSION;
    X.patch     = SDL_IMAGE_PATCHLEVEL;
}

extern(C)
{
    CSDLVERPTR function() IMG_Linked_Version;
    SDL_Surface* function(SDL_RWops*, int, char*) IMG_LoadTyped_RW;
    SDL_Surface* function(in char*) IMG_Load;
    SDL_Surface* function(SDL_RWops*, int) IMG_Load_RW;
    int function(int) IMG_InvertAlpha;
    int function(SDL_RWops*) IMG_isBMP;
    int function(SDL_RWops*) IMG_isGIF;
    int function(SDL_RWops*) IMG_isJPG;
    int function(SDL_RWops*) IMG_isLBM;
    int function(SDL_RWops*) IMG_isPCX;
    int function(SDL_RWops*) IMG_isPNG;
    int function(SDL_RWops*) IMG_isPNM;
    int function(SDL_RWops*) IMG_isTIF;
    int function(SDL_RWops*) IMG_isXCF;
    int function(SDL_RWops*) IMG_isXPM;
    int function(SDL_RWops*) IMG_isXV;
    SDL_Surface* function(SDL_RWops*) IMG_LoadBMP_RW;
    SDL_Surface* function(SDL_RWops*) IMG_LoadGIF_RW;
    SDL_Surface* function(SDL_RWops*) IMG_LoadJPG_RW;
    SDL_Surface* function(SDL_RWops*) IMG_LoadLBM_RW;
    SDL_Surface* function(SDL_RWops*) IMG_LoadPCX_RW;
    SDL_Surface* function(SDL_RWops*) IMG_LoadPNG_RW;
    SDL_Surface* function(SDL_RWops*) IMG_LoadPNM_RW;
    SDL_Surface* function(SDL_RWops*) IMG_LoadTGA_RW;
    SDL_Surface* function(SDL_RWops*) IMG_LoadTIF_RW;
    SDL_Surface* function(SDL_RWops*) IMG_LoadXCF_RW;
    SDL_Surface* function(SDL_RWops*) IMG_LoadXPM_RW;
    SDL_Surface* function(SDL_RWops*) IMG_LoadXV_RW;
    SDL_Surface* function(char**) IMG_ReadXPMFromArray;
}

class DerelictSDLImageLoader : SharedLibLoader
{
public:
    this()
    {
        super(
            "SDL_image.dll",
            "libSDL_image.so, libSDL_image-1.2.so, libSDL_image-1.2.so.0",
            "../Frameworks/SDL_image.framework/SDL_image, /Library/Frameworks/SDL_image.framework/SDL_image, /System/Library/Frameworks/SDL_image.framework/SDL_image"
        );
    }

protected:
    override void loadSymbols()
    {
        if(!DerelictSDL.isLoaded)
        {
            throw new SharedLibLoadException("DerelictSDL must be loaded before attempting to load DerelictSDLImage!");
        }
        bindFunc(cast(void**)&IMG_Linked_Version, "IMG_Linked_Version");
        bindFunc(cast(void**)&IMG_LoadTyped_RW, "IMG_LoadTyped_RW");
        bindFunc(cast(void**)&IMG_Load, "IMG_Load");
        bindFunc(cast(void**)&IMG_Load_RW, "IMG_Load_RW");
        bindFunc(cast(void**)&IMG_InvertAlpha, "IMG_InvertAlpha");
        bindFunc(cast(void**)&IMG_isBMP, "IMG_isBMP");
        bindFunc(cast(void**)&IMG_isGIF, "IMG_isGIF");
        bindFunc(cast(void**)&IMG_isJPG, "IMG_isJPG");
        bindFunc(cast(void**)&IMG_isLBM, "IMG_isLBM");
        bindFunc(cast(void**)&IMG_isPCX, "IMG_isPCX");
        bindFunc(cast(void**)&IMG_isPNG, "IMG_isPNG");
        bindFunc(cast(void**)&IMG_isPNM, "IMG_isPNM");
        bindFunc(cast(void**)&IMG_isTIF, "IMG_isTIF");
        bindFunc(cast(void**)&IMG_isXCF, "IMG_isXCF");
        bindFunc(cast(void**)&IMG_isXPM, "IMG_isXPM");
        bindFunc(cast(void**)&IMG_isXV, "IMG_isXV");
        bindFunc(cast(void**)&IMG_LoadBMP_RW, "IMG_LoadBMP_RW");
        bindFunc(cast(void**)&IMG_LoadGIF_RW, "IMG_LoadGIF_RW");
        bindFunc(cast(void**)&IMG_LoadJPG_RW, "IMG_LoadJPG_RW");
        bindFunc(cast(void**)&IMG_LoadLBM_RW, "IMG_LoadLBM_RW");
        bindFunc(cast(void**)&IMG_LoadPCX_RW, "IMG_LoadPCX_RW");
        bindFunc(cast(void**)&IMG_LoadPNG_RW, "IMG_LoadPNG_RW");
        bindFunc(cast(void**)&IMG_LoadPNM_RW, "IMG_LoadPNM_RW");
        bindFunc(cast(void**)&IMG_LoadTGA_RW, "IMG_LoadTGA_RW");
        bindFunc(cast(void**)&IMG_LoadTIF_RW, "IMG_LoadTIF_RW");
        bindFunc(cast(void**)&IMG_LoadXCF_RW, "IMG_LoadXCF_RW");
        bindFunc(cast(void**)&IMG_LoadXPM_RW, "IMG_LoadXPM_RW");
        bindFunc(cast(void**)&IMG_LoadXV_RW, "IMG_LoadXV_RW");
        bindFunc(cast(void**)&IMG_ReadXPMFromArray, "IMG_ReadXPMFromArray");
    }
}

DerelictSDLImageLoader DerelictSDLImage;

static this()
{
    DerelictSDLImage = new DerelictSDLImageLoader();
}

static ~this()
{
    DerelictSDLImage.unload();
}