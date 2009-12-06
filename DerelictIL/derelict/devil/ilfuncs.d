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
    ILboolean function(ILconst_string) ilApplyPal;
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
    ILboolean function(ILenum, ILconst_string) ilLoad;
    ILboolean function(ILenum, ILHANDLE) ilLoadF;
    ILboolean function(ILconst_string) ilLoadImage;
    ILboolean function(ILenum, in ILvoid*, ILuint) ilLoadL;
    ILboolean function(ILconst_string) ilLoadPal;
    ILvoid function(ILdouble) ilModAlpha;
    ILboolean function(ILenum) ilOriginFunc;
    ILboolean function(ILuint, ILint, ILint, ILint) ilOverlayImage;
    ILvoid function() ilPopAttrib;
    ILvoid function(ILuint) ilPushAttrib;
    ILvoid function(ILenum) ilRegisterFormat;
    ILboolean function(ILconst_string, IL_LOADPROC) ilRegisterLoad;
    ILboolean function(ILuint) ilRegisterMipNum;
    ILboolean function(ILuint) ilRegisterNumImages;
    ILvoid function(ILenum) ilRegisterOrigin;
    ILvoid function(ILvoid*, ILuint, ILenum) ilRegisterPal;
    ILboolean function(ILconst_string, IL_SAVEPROC) ilRegisterSave;
    ILvoid function(ILenum) ilRegisterType;
    ILboolean function(ILconst_string) ilRemoveLoad;
    ILboolean function(ILconst_string) ilRemoveSave;
    ILvoid function() ilResetRead;
    ILvoid function() ilResetWrite;
    ILboolean function(ILenum, ILconst_string) ilSave;
    ILuint function(ILenum, ILHANDLE) ilSaveF;
    ILboolean function(ILconst_string) ilSaveImage;
    ILuint function(ILenum, ILvoid*, ILuint) ilSaveL;
    ILboolean function(ILconst_string) ilSavePal;
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
    ILenum function(ILconst_string) ilTypeFromExt;
    ILboolean function(ILenum) ilTypeFunc;
    ILboolean function(ILconst_string, ILuint, ILuint, ILuint, ILubyte) ilLoadData;
    ILboolean function(ILHANDLE, ILuint, ILuint, ILuint, ILubyte) ilLoadDataF;
    ILboolean function(ILvoid*, ILuint, ILuint, ILuint, ILuint, ILubyte) ilLoadDataL;
    ILboolean function(ILconst_string) ilSaveData;

    alias ilClearColour     ilClearColor;
    alias ilKeyColour       ilKeyColor;
}