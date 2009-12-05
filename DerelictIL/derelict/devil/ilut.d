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
 * * Neither the names 'Derelict', 'DerelictILUT', nor the names of its contributors
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
module derelict.devil.ilut;

public
{
    import derelict.devil.iluttypes;
    import derelict.devil.ilutfuncs;
}

private
{
    import derelict.util.sharedlib;
    import derelict.util.loader;
}

class DerelictILUTLoader : SharedLibLoader
{
public:
    this()
    {
        super(
            "ilut.dll",
            "libILUT.so",
            ""
        );
    }

protected:
    override void loadSymbols()
    {
        bindFunc(cast(void**)&ilutDisable, "ilutDisable");
        bindFunc(cast(void**)&ilutEnable, "ilutEnable");
        bindFunc(cast(void**)&ilutGetBoolean, "ilutGetBoolean");
        bindFunc(cast(void**)&ilutGetBooleanv, "ilutGetBooleanv");
        bindFunc(cast(void**)&ilutGetInteger, "ilutGetInteger");
        bindFunc(cast(void**)&ilutGetIntegerv, "ilutGetIntegerv");
        bindFunc(cast(void**)&ilutGetString, "ilutGetString");
        bindFunc(cast(void**)&ilutInit, "ilutInit");
        bindFunc(cast(void**)&ilutIsDisabled, "ilutIsDisabled");
        bindFunc(cast(void**)&ilutIsEnabled, "ilutIsEnabled");
        bindFunc(cast(void**)&ilutPopAttrib, "ilutPopAttrib");
        bindFunc(cast(void**)&ilutPushAttrib, "ilutPushAttrib");
        bindFunc(cast(void**)&ilutSetInteger, "ilutSetInteger");
        bindFunc(cast(void**)&ilutRenderer, "ilutRenderer");
        bindFunc(cast(void**)&ilutGLBindTexImage, "ilutGLBindTexImage");
        bindFunc(cast(void**)&ilutGLBindMipmaps, "ilutGLBindMipmaps");
        bindFunc(cast(void**)&ilutGLBuildMipmaps, "ilutGLBuildMipmaps");
        bindFunc(cast(void**)&ilutGLLoadImage, "ilutGLLoadImage");
        bindFunc(cast(void**)&ilutGLScreen, "ilutGLScreen");
        bindFunc(cast(void**)&ilutGLScreenie, "ilutGLScreenie");
        bindFunc(cast(void**)&ilutGLSaveImage, "ilutGLSaveImage");
        bindFunc(cast(void**)&ilutGLSetTex, "ilutGLSetTex");
        bindFunc(cast(void**)&ilutGLTexImage, "ilutGLTexImage");
        bindFunc(cast(void**)&ilutGLSubTex, "ilutGLSubTex");

        version(Windows)
        {
            bindFunc(cast(void**)&ilutConvertToHBitmap, "ilutConvertToHBitmap");
            bindFunc(cast(void**)&ilutFreePaddedData, "ilutFreePaddedData");
            bindFunc(cast(void**)&ilutGetBmpInfo, "ilutGetBmpInfo");
            bindFunc(cast(void**)&ilutGetHPal, "ilutGetHPal");
            bindFunc(cast(void**)&ilutGetPaddedData, "ilutGetPaddedData");
            bindFunc(cast(void**)&ilutGetWinClipboard, "ilutGetWinClipboard");
            bindFunc(cast(void**)&ilutLoadResource, "ilutLoadResource");
            bindFunc(cast(void**)&ilutSetHBitmap, "ilutSetHBitmap");
            bindFunc(cast(void**)&ilutSetHPal, "ilutSetHPal");
            bindFunc(cast(void**)&ilutSetWinClipboard, "ilutSetWinClipboard");
            bindFunc(cast(void**)&ilutWinLoadImage, "ilutWinLoadImage");
            bindFunc(cast(void**)&ilutWinLoadUrl, "ilutWinLoadUrl");
            bindFunc(cast(void**)&ilutWinPrint, "ilutWinPrint");
            bindFunc(cast(void**)&ilutWinSaveImage, "ilutWinSaveImage");
        }

        version(linux)
        {
           // TODO
        }
    }
}

DerelictILUTLoader DerelictILUT;

static this()
{
    DerelictILUT = new DerelictILUTLoader();
}

static ~this()
{
    DerelictILUT.unload();
}