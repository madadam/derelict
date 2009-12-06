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
module derelict.devil.ilutfuncs;


private
{
    import derelict.devil.iltypes;
    import derelict.devil.iluttypes;
}


extern(System)
{
    ILboolean function(ILenum) ilutDisable;
    ILboolean function(ILenum) ilutEnable;
    ILboolean function(ILenum) ilutGetBoolean;
    ILvoid function(ILenum, ILboolean*) ilutGetBooleanv;
    ILint function(ILenum) ilutGetInteger;
    ILvoid function(ILenum, ILint*) ilutGetIntegerv;
    ILstring function(ILenum) ilutGetString;
    ILvoid function() ilutInit;
    ILboolean function(ILenum) ilutIsDisabled;
    ILboolean function(ILenum) ilutIsEnabled;
    ILvoid function() ilutPopAttrib;
    ILvoid function(ILuint) ilutPushAttrib;
    ILvoid function(ILenum, ILint) ilutSetInteger;
    ILboolean function(ILenum) ilutRenderer;
    uint function() ilutGLBindTexImage;
    uint function() ilutGLBindMipmaps;
    ILboolean function() ilutGLBuildMipmaps;
    uint function(ILstring FileName) ilutGLLoadImage;
    ILboolean function() ilutGLScreen;
    ILboolean function() ilutGLScreenie;
    ILboolean function(ILstring, uint) ilutGLSaveImage;
    ILboolean function(uint) ilutGLSetTex;
    ILboolean function(uint) ilutGLTexImage;
    ILboolean function(uint, ILuint, ILuint) ilutGLSubTex;

    version(Windows)
    {
        private import derelict.util.wintypes;

        HBITMAP function(HDC hDC) ilutConvertToHBitmap;
        ILvoid function(ILubyte *Data) ilutFreePaddedData;
        ILvoid function(BITMAPINFO *Info) ilutGetBmpInfo;
        HPALETTE function() ilutGetHPal;
        ILubyte* function() ilutGetPaddedData;
        ILboolean function() ilutGetWinClipboard;
        ILboolean function(HINSTANCE hInst, ILint ID,  ILstring ResourceType, ILenum Type) ilutLoadResource;
        ILboolean function(HBITMAP Bitmap) ilutSetHBitmap;
        ILboolean function(HPALETTE Pal) ilutSetHPal;
        ILboolean function() ilutSetWinClipboard;
        HBITMAP function( ILstring FileName, HDC hDC) ilutWinLoadImage;
        ILboolean function( ILstring Url) ilutWinLoadUrl;
        ILboolean function(ILuint XPos, ILuint YPos, ILuint Width, ILuint Height, HDC hDC) ilutWinPrint;
        ILboolean function( ILstring FileName, HBITMAP Bitmap) ilutWinSaveImage;
    }

    version(Linux)
    {
        private import derelict.util.xtypes;

        // TODO
    }
}