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
 * * Neither the names 'Derelict', 'DerelictIL', nor the names of its contributors
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
module derelict.devil.il;

public
{
    import derelict.devil.iltypes;
    import derelict.devil.ilfuncs;
}

private {
    import derelict.util.sharedlib;
    import derelict.util.loader;
}

class DerelictILLoader : SharedLibLoader
{
public:
    this()
    {
        super(
            "devil.dll",
            "libIL.so",
            ""
        );
    }

protected:
    override void loadSymbols()
    {
        bindFunc(cast(void**)&ilActiveImage, "ilActiveImage");
        bindFunc(cast(void**)&ilActiveLayer, "ilActiveLayer");
        bindFunc(cast(void**)&ilActiveMipmap, "ilActiveMipmap");
        bindFunc(cast(void**)&ilApplyPal, "ilApplyPal");
        bindFunc(cast(void**)&ilApplyProfile, "ilApplyProfile");
        bindFunc(cast(void**)&ilBindImage, "ilBindImage");
        bindFunc(cast(void**)&ilBlit, "ilBlit");
        bindFunc(cast(void**)&ilClearColour, "ilClearColour");
        bindFunc(cast(void**)&ilClearImage, "ilClearImage");
        bindFunc(cast(void**)&ilCloneCurImage, "ilCloneCurImage");
        bindFunc(cast(void**)&ilCompressFunc, "ilCompressFunc");
        bindFunc(cast(void**)&ilConvertImage, "ilConvertImage");
        bindFunc(cast(void**)&ilConvertPal, "ilConvertPal");
        bindFunc(cast(void**)&ilCopyImage, "ilCopyImage");
        bindFunc(cast(void**)&ilCopyPixels, "ilCopyPixels");
        bindFunc(cast(void**)&ilCreateSubImage, "ilCreateSubImage");
        bindFunc(cast(void**)&ilDefaultImage, "ilDefaultImage");
        bindFunc(cast(void**)&ilDeleteImage, "ilDeleteImage");
        bindFunc(cast(void**)&ilDeleteImages, "ilDeleteImages");
        bindFunc(cast(void**)&ilDisable, "ilDisable");
        bindFunc(cast(void**)&ilEnable, "ilEnable");
        bindFunc(cast(void**)&ilFormatFunc, "ilFormatFunc");
        bindFunc(cast(void**)&ilGenImages, "ilGenImages");
        bindFunc(cast(void**)&ilGenImage, "ilGenImage");
        bindFunc(cast(void**)&ilGetAlpha, "ilGetAlpha");
        bindFunc(cast(void**)&ilGetBoolean, "ilGetBoolean");
        bindFunc(cast(void**)&ilGetBooleanv, "ilGetBooleanv");
        bindFunc(cast(void**)&ilGetData, "ilGetData");
        bindFunc(cast(void**)&ilGetDXTCData, "ilGetDXTCData");
        bindFunc(cast(void**)&ilGetError, "ilGetError");
        bindFunc(cast(void**)&ilGetInteger, "ilGetInteger");
        bindFunc(cast(void**)&ilGetIntegerv, "ilGetIntegerv");
        bindFunc(cast(void**)&ilGetLumpPos, "ilGetLumpPos");
        bindFunc(cast(void**)&ilGetPalette, "ilGetPalette");
        bindFunc(cast(void**)&ilGetString, "ilGetString");
        bindFunc(cast(void**)&ilHint, "ilHint");
        bindFunc(cast(void**)&ilInit, "ilInit");
        bindFunc(cast(void**)&ilIsDisabled, "ilIsDisabled");
        bindFunc(cast(void**)&ilIsEnabled, "ilIsEnabled");
        bindFunc(cast(void**)&ilDetermineTypeF, "ilDetermineTypeF");
        bindFunc(cast(void**)&ilIsImage, "ilIsImage");
        bindFunc(cast(void**)&ilIsValid, "ilIsValid");
        bindFunc(cast(void**)&ilIsValidF, "ilIsValidF");
        bindFunc(cast(void**)&ilIsValidL, "ilIsValidL");
        bindFunc(cast(void**)&ilKeyColour, "ilKeyColour");
        bindFunc(cast(void**)&ilLoad, "ilLoad");
        bindFunc(cast(void**)&ilLoadF, "ilLoadF");
        bindFunc(cast(void**)&ilLoadImage, "ilLoadImage");
        bindFunc(cast(void**)&ilLoadL, "ilLoadL");
        bindFunc(cast(void**)&ilLoadPal, "ilLoadPal");
        bindFunc(cast(void**)&ilModAlpha, "ilModAlpha");
        bindFunc(cast(void**)&ilOriginFunc, "ilOriginFunc");
        bindFunc(cast(void**)&ilOverlayImage, "ilOverlayImage");
        bindFunc(cast(void**)&ilPopAttrib, "ilPopAttrib");
        bindFunc(cast(void**)&ilPushAttrib, "ilPushAttrib");
        bindFunc(cast(void**)&ilRegisterFormat, "ilRegisterFormat");
        bindFunc(cast(void**)&ilRegisterLoad, "ilRegisterLoad");
        bindFunc(cast(void**)&ilRegisterMipNum, "ilRegisterMipNum");
        bindFunc(cast(void**)&ilRegisterNumImages, "ilRegisterNumImages");
        bindFunc(cast(void**)&ilRegisterOrigin, "ilRegisterOrigin");
        bindFunc(cast(void**)&ilRegisterPal, "ilRegisterPal");
        bindFunc(cast(void**)&ilRegisterSave, "ilRegisterSave");
        bindFunc(cast(void**)&ilRegisterType, "ilRegisterType");
        bindFunc(cast(void**)&ilRemoveLoad, "ilRemoveLoad");
        bindFunc(cast(void**)&ilRemoveSave, "ilRemoveSave");
        bindFunc(cast(void**)&ilResetRead, "ilResetRead");
        bindFunc(cast(void**)&ilResetWrite, "ilResetWrite");
        bindFunc(cast(void**)&ilSave, "ilSave");
        bindFunc(cast(void**)&ilSaveF, "ilSaveF");
        bindFunc(cast(void**)&ilSaveImage, "ilSaveImage");
        bindFunc(cast(void**)&ilSaveL, "ilSaveL");
        bindFunc(cast(void**)&ilSavePal, "ilSavePal");
        bindFunc(cast(void**)&ilSetAlpha, "ilSetAlpha");
        bindFunc(cast(void**)&ilSetData, "ilSetData");
        bindFunc(cast(void**)&ilSetDuration, "ilSetDuration");
        bindFunc(cast(void**)&ilSetInteger, "ilSetInteger");
        bindFunc(cast(void**)&ilSetMemory, "ilSetMemory");
        bindFunc(cast(void**)&ilSetPixels, "ilSetPixels");
        bindFunc(cast(void**)&ilSetRead, "ilSetRead");
        bindFunc(cast(void**)&ilSetString, "ilSetString");
        bindFunc(cast(void**)&ilSetWrite, "ilSetWrite");
        bindFunc(cast(void**)&ilShutDown, "ilShutDown");
        bindFunc(cast(void**)&ilTexImage, "ilTexImage");
        bindFunc(cast(void**)&ilTypeFromExt, "ilTypeFromExt");
        bindFunc(cast(void**)&ilTypeFunc, "ilTypeFunc");
        bindFunc(cast(void**)&ilLoadData, "ilLoadData");
        bindFunc(cast(void**)&ilLoadDataF, "ilLoadDataF");
        bindFunc(cast(void**)&ilLoadDataL, "ilLoadDataL");
        bindFunc(cast(void**)&ilSaveData, "ilSaveData");
    }
}

DerelictILLoader DerelictIL;

static this()
{
    DerelictIL = new DerelictILLoader();
}

static ~this()
{
    DerelictIL.unload();
}