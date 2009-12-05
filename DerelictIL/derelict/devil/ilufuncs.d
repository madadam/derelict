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
	ILboolean function(ILuint Iter) iluBlurAvg;
	ILboolean function(ILuint Iter) iluBlurGaussian;
	ILboolean function() iluBuildMipmaps;
	ILuint function() iluColoursUsed;
	ILboolean function(ILuint Comp) iluCompareImage;
	ILboolean function(ILfloat Contrast) iluContrast;
	ILboolean function(ILuint XOff, ILuint YOff, ILuint ZOff, ILuint Width, ILuint Height, ILuint Depth) iluCrop;
	ILvoid function(ILuint Id) iluDeleteImage;
	ILboolean function() iluEdgeDetectE;
	ILboolean function() iluEdgeDetectP;
	ILboolean function() iluEdgeDetectS;
	ILboolean function() iluEmboss;
	ILboolean function(ILuint Width, ILuint Height, ILuint Depth) iluEnlargeCanvas;
	ILboolean function(ILfloat XDim, ILfloat YDim, ILfloat ZDim) iluEnlargeImage;
	ILboolean function() iluEqualize;
	ILstring function(ILenum Error) iluErrorString;
	ILboolean function(ILint*, ILint, ILint) iluConvolution;
	ILboolean function() iluFlipImage;
	ILboolean function(ILfloat Gamma) iluGammaCorrect;
	ILuint function() iluGenImage;
	ILvoid function(ILinfo *Info) iluGetImageInfo;
	ILint function(ILenum Mode) iluGetInteger;
	ILvoid function(ILenum Mode, ILint *Param) iluGetIntegerv;
	ILstring function(ILenum StringName) iluGetString;
	ILvoid function(ILenum PName, ILenum Param) iluImageParameter;
	ILvoid function() iluInit;
	ILboolean function() iluInvertAlpha;
	ILuint function( ILstring FileName) iluLoadImage;
	ILboolean function() iluMirror;
	ILboolean function() iluNegative;
	ILboolean function(ILclampf Tolerance) iluNoisify;
	ILboolean function(ILuint PixSize) iluPixelize;
	ILvoid function(ILpointf *Points, ILuint n) iluRegionfv;
	ILvoid function(ILpointi *Points, ILuint n) iluRegioniv;
	ILboolean function(ILubyte Red, ILubyte Green, ILubyte Blue, ILfloat Tolerance) iluReplaceColour;
	ILboolean function(ILfloat Angle) iluRotate;
	ILboolean function(ILfloat x, ILfloat y, ILfloat z, ILfloat Angle) iluRotate3D;
	ILboolean function(ILfloat Saturation) iluSaturate1f;
	ILboolean function(ILfloat r, ILfloat g, ILfloat b, ILfloat Saturation) iluSaturate4f;
	ILboolean function(ILuint Width, ILuint Height, ILuint Depth) iluScale;
	ILboolean function(ILfloat r, ILfloat g, ILfloat b) iluScaleColours;
	ILboolean function(ILenum) iluSetLanguage;
	ILboolean function(ILfloat Factor, ILuint Iter) iluSharpen;
	ILboolean function() iluSwapColours;
	ILboolean function(ILfloat Angle) iluWave;
	
	alias iluColoursUsed    iluColorsUsed;
	alias iluSwapColours    iluSwapColors;
	alias iluReplaceColour  iluReplaceColor;
	alias iluScaleColours  iluScaleColors;
}