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
    SDL_IMAGE_PATCHLEVEL        = 8,
}

void SDL_IMAGE_VERSION(SDL_version* X)
{
    X.major     = SDL_IMAGE_MAJOR_VERSION;
    X.minor     = SDL_IMAGE_MINOR_VERSION;
    X.patch     = SDL_IMAGE_PATCHLEVEL;
}

enum
{
    IMG_INIT_JPG    = 0x00000001,
    IMG_INIT_PNG    = 0x00000002,
    IMG_INIT_TIF    = 0x00000004,
}



extern(C)
{
    version(D_Version2)
    {
        mixin("__gshared:");
    }

    int function(int) IMG_Init;
    int function() IMG_Quit;
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
    int function(SDL_RWops*) IMG_isICO;
    int function(SDL_RWops*) IMG_isCUR;
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
    SDL_Surface* function(SDL_RWops*) IMG_LoadICO_RW;
    SDL_Surface* function(SDL_RWops*) IMG_LoadCUR_RW;
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
        bindFunc(cast(void**)&IMG_Init, "IMG_Init");
        bindFunc(cast(void**)&IMG_Quit, "IMG_Quit");
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
        bindFunc(cast(void**)&IMG_isICO, "IMG_isICO");
        bindFunc(cast(void**)&IMG_isCUR, "IMG_isCUR");
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
        bindFunc(cast(void**)&IMG_LoadICO_RW, "IMG_LoadICO_RW");
        bindFunc(cast(void**)&IMG_LoadCUR_RW, "IMG_LoadCUR_RW");
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