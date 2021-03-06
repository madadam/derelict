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
module derelict.devil.ilufuncs;


private
{
    import derelict.util.compat;
    import derelict.devil.iltypes;
    import derelict.devil.ilutypes;
}

extern(System)
{
    mixin(gsharedString!() ~
    "
    ILboolean function() iluAlienify;
    ILboolean function(ILuint) iluBlurAvg;
    ILboolean function(ILuint) iluBlurGaussian;
    ILboolean function() iluBuildMipmaps;
    ILuint function() iluColoursUsed;
    ILboolean function(ILuint) iluCompareImage;
    ILboolean function(ILfloat) iluContrast;
    ILboolean function(ILuint, ILuint, ILuint, ILuint, ILuint, ILuint) iluCrop;
    ILvoid function(ILuint) iluDeleteImage;
    ILboolean function() iluEdgeDetectE;
    ILboolean function() iluEdgeDetectP;
    ILboolean function() iluEdgeDetectS;
    ILboolean function() iluEmboss;
    ILboolean function(ILuint, ILuint, ILuint) iluEnlargeCanvas;
    ILboolean function(ILfloat, ILfloat, ILfloat) iluEnlargeImage;
    ILboolean function() iluEqualize;
    ILconst_string function(ILenum) iluErrorString;
    ILboolean function(ILint*, ILint, ILint) iluConvolution;
    ILboolean function() iluFlipImage;
    ILboolean function(ILfloat) iluGammaCorrect;
    ILuint function() iluGenImage;
    ILvoid function(ILinfo*) iluGetImageInfo;
    ILint function(ILenum) iluGetInteger;
    ILvoid function(ILenum, ILint*) iluGetIntegerv;
    ILstring function(ILenum) iluGetString;
    ILvoid function(ILenum, ILenum) iluImageParameter;
    ILvoid function() iluInit;
    ILboolean function() iluInvertAlpha;
    ILuint function(ILconst_string) iluLoadImage;
    ILboolean function() iluMirror;
    ILboolean function() iluNegative;
    ILboolean function(ILclampf) iluNoisify;
    ILboolean function(ILuint) iluPixelize;
    ILvoid function(ILpointf*, ILuint) iluRegionfv;
    ILvoid function(ILpointi*, ILuint) iluRegioniv;
    ILboolean function(ILubyte, ILubyte, ILubyte, ILfloat) iluReplaceColour;
    ILboolean function(ILfloat) iluRotate;
    ILboolean function(ILfloat, ILfloat, ILfloat, ILfloat) iluRotate3D;
    ILboolean function(ILfloat) iluSaturate1f;
    ILboolean function(ILfloat, ILfloat, ILfloat, ILfloat) iluSaturate4f;
    ILboolean function(ILuint, ILuint, ILuint) iluScale;
    ILboolean function(ILfloat, ILfloat, ILfloat) iluScaleColours;
    ILboolean function(ILenum) iluSetLanguage;
    ILboolean function(ILfloat, ILuint) iluSharpen;
    ILboolean function() iluSwapColours;
    ILboolean function(ILfloat) iluWave;
    ");

    alias iluColoursUsed    iluColorsUsed;
    alias iluSwapColours    iluSwapColors;
    alias iluReplaceColour  iluReplaceColor;
    alias iluScaleColours  iluScaleColors;
}