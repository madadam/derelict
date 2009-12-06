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
 * * Neither the names 'Derelict', 'DerelictILU', nor the names of its contributors
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
module derelict.devil.ilufuncs;


private
{
    import derelict.devil.iltypes;
    import derelict.devil.ilutypes;
}

extern(System)
{
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

    alias iluColoursUsed    iluColorsUsed;
    alias iluSwapColours    iluSwapColors;
    alias iluReplaceColour  iluReplaceColor;
    alias iluScaleColours  iluScaleColors;
}