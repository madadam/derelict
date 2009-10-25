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
module derelict.devil.ilfuncs;


private
{
    import derelict.devil.iltypes;
}

extern(System)
{
    ILboolean function (ILuint) ilActiveImage;
    ILboolean function(ILuint) ilActiveLayer;
    ILboolean function(ILuint) ilActiveMipmap;
    ILboolean function(in ILstring) ilApplyPal;
    ILboolean function(ILstring, ILstring) ilApplyProfile;
    ILvoid function(ILuint) ilBindImage;
    ILboolean function(ILuint, ILint, ILint, ILint, ILuint, ILuint, ILuint, ILuint, ILuint, ILuint) ilBlit;
    ILvoid function(ILclampf, ILclampf, ILclampf, ILclampf) ilClearColour;
    ILboolean function() ilClearImage;
    ILuint function() ilCloneCurImage;
    ILboolean function(ILenum) ilCompressFunc;
    ILboolean function(ILenum, ILenum) ilConvertImage;
    ILboolean function(ILenum) ilConvertPal;
    ILboolean function(ILuint) ilCopyImage;
    ILuint function(ILuint, ILuint, ILuint, ILuint, ILuint, ILuint, ILenum, ILenum, ILvoid*) ilCopyPixels;
    ILuint function(ILenum, ILuint) ilCreateSubImage;
    ILboolean function() ilDefaultImage;
    ILvoid function(ILuint) ilDeleteImage;
    ILvoid function(ILsizei, in ILuint*) ilDeleteImages;
    ILboolean function(ILenum) ilDisable;
    ILboolean function(ILenum) ilEnable;
    ILboolean function(ILenum) ilFormatFunc;
    ILvoid function(ILsizei, ILuint*) ilGenImages;
    ILuint function() ilGenImage;
    ILubyte* function(ILenum) ilGetAlpha;
    ILboolean function(ILenum) ilGetBoolean;
    ILvoid function(ILenum, ILboolean*) ilGetBooleanv;
    ILubyte* function() ilGetData;
    ILuint function(ILvoid*, ILuint, ILenum) ilGetDXTCData;
    ILenum function() ilGetError;
    ILint function(ILenum) ilGetInteger;
    ILvoid function(ILenum, ILint*) ilGetIntegerv;
    ILuint function() ilGetLumpPos;
    ILubyte* function() ilGetPalette;
    ILstring function(ILenum) ilGetString;
    ILvoid function(ILenum, ILenum) ilHint;
    ILvoid function() ilInit;
    ILboolean function(ILenum) ilIsDisabled;
    ILboolean function(ILenum) ilIsEnabled;
    ILenum function(ILHANDLE) ilDetermineTypeF;
    ILboolean function(ILuint) ilIsImage;
    ILboolean function(ILenum, ILstring) ilIsValid;
    ILboolean function(ILenum, ILHANDLE) ilIsValidF;
    ILboolean function(ILenum, ILvoid*, ILuint) ilIsValidL;
    ILvoid function(ILclampf, ILclampf, ILclampf, ILclampf) ilKeyColour;
    ILboolean function(ILenum, in ILstring) ilLoad;
    ILboolean function(ILenum, ILHANDLE) ilLoadF;
    ILboolean function(in ILstring) ilLoadImage;
    ILboolean function(ILenum, in ILvoid*, ILuint) ilLoadL;
    ILboolean function(in ILstring) ilLoadPal;
    ILvoid function(ILdouble) ilModAlpha;
    ILboolean function(ILenum) ilOriginFunc;
    ILboolean function(ILuint, ILint, ILint, ILint) ilOverlayImage;
    ILvoid function() ilPopAttrib;
    ILvoid function(ILuint) ilPushAttrib;
    ILvoid function(ILenum) ilRegisterFormat;
    ILboolean function(in ILstring, IL_LOADPROC) ilRegisterLoad;
    ILboolean function(ILuint) ilRegisterMipNum;
    ILboolean function(ILuint) ilRegisterNumImages;
    ILvoid function(ILenum) ilRegisterOrigin;
    ILvoid function(ILvoid*, ILuint, ILenum) ilRegisterPal;
    ILboolean function(in ILstring, IL_SAVEPROC) ilRegisterSave;
    ILvoid function(ILenum) ilRegisterType;
    ILboolean function(in ILstring) ilRemoveLoad;
    ILboolean function(in ILstring) ilRemoveSave;
    ILvoid function() ilResetRead;
    ILvoid function() ilResetWrite;
    ILboolean function(ILenum, in ILstring) ilSave;
    ILuint function(ILenum, ILHANDLE) ilSaveF;
    ILboolean function(in ILstring) ilSaveImage;
    ILuint function(ILenum, ILvoid*, ILuint) ilSaveL;
    ILboolean function(in ILstring) ilSavePal;
    ILboolean function(ILdouble) ilSetAlpha;
    ILboolean function(ILvoid*) ilSetData;
    ILboolean function(ILuint) ilSetDuration;
    ILvoid function(ILenum, ILint) ilSetInteger;
    ILvoid function(mAlloc, mFree) ilSetMemory;
    ILvoid function(ILint, ILint, ILint, ILuint, ILuint, ILuint, ILenum, ILenum, ILvoid*) ilSetPixels;
    ILvoid function(fOpenRProc, fCloseRProc, fEofProc, fGetcProc, fReadProc, fSeekRProc, fTellRProc) ilSetRead;
    ILvoid function(ILenum, in char*) ilSetString;
    ILvoid function(fOpenWProc, fCloseWProc, fPutcProc, fSeekWProc, fTellWProc, fWriteProc) ilSetWrite;
    ILvoid function() ilShutDown;
    ILboolean function(ILuint, ILuint, ILuint, ILubyte, ILenum, ILenum, ILvoid*) ilTexImage;
    ILenum function(in ILstring) ilTypeFromExt;
    ILboolean function(ILenum) ilTypeFunc;
    ILboolean function(in ILstring, ILuint, ILuint, ILuint, ILubyte) ilLoadData;
    ILboolean function(ILHANDLE, ILuint, ILuint, ILuint, ILubyte) ilLoadDataF;
    ILboolean function(ILvoid*, ILuint, ILuint, ILuint, ILuint, ILubyte) ilLoadDataL;
    ILboolean function(in ILstring) ilSaveData;

    alias ilClearColour     ilClearColor;
    alias ilKeyColour       ilKeyColor;
}