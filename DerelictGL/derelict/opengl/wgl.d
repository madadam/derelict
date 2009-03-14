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
 * * Neither the names 'Derelict', 'DerelictGL', nor the names of its contributors
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
module derelict.opengl.wgl;

private
{
	import derelict.util.wintypes;
	import derelict.util.compat;
}

version(Windows)
{
	extern(Windows)
    {
        // WGL functions
         BOOL function(void*,void*) wglCopyContext;
         void* function(void*) wglCreateContext;
         void* function(void*,int) wglCreateLayerContext;
         BOOL function(void*) wglDeleteContext;
         BOOL function(void*,int,int,UINT,LAYERPLANEDESCRIPTOR*) wglDescribeLayerPlane;
         void* function() wglGetCurrentContext;
         void* function() wglGetCurrentDC;
         int function(void*,int,int,int,COLORREF*) wglGetLayerPaletteEntries;
         FARPROC function(LPCSTR) wglGetProcAddress;
         BOOL function(void*,void*) wglMakeCurrent;
         BOOL function(void*,int,BOOL) wglRealizeLayerPalette;
         int function(void*,int,int,int,COLORREF*) wglSetLayerPaletteEntries;
         BOOL function(void*,void*) wglShareLists;
         BOOL function(void*,UINT) wglSwapLayerBuffers;
         BOOL function(void*,DWORD,DWORD,DWORD) wglUseFontBitmapsA;
         BOOL function(void*,DWORD,DWORD,DWORD,FLOAT,FLOAT,int,GLYPHMETRICSFLOAT*) wglUseFontOutlinesA;
         BOOL function(void*,DWORD,DWORD,DWORD) wglUseFontBitmapsW;
         BOOL function(void*,DWORD,DWORD,DWORD,FLOAT,FLOAT,int,GLYPHMETRICSFLOAT*) wglUseFontOutlinesW;

        alias wglUseFontBitmapsA    wglUseFontBitmaps;
        alias wglUseFontOutlinesA   wglUseFontOutlines;
    } // extern(Windows)


   	package
   	{
	    void loadPlatformGL(void delegate(void**, string) bindFunc)
	    {
	        bindFunc(cast(void**)&wglCopyContext, "wglCopyContext");
	        bindFunc(cast(void**)&wglCreateContext, "wglCreateContext");
	        bindFunc(cast(void**)&wglCreateLayerContext, "wglCreateLayerContext");
	        bindFunc(cast(void**)&wglDeleteContext, "wglDeleteContext");
	        bindFunc(cast(void**)&wglDescribeLayerPlane, "wglDescribeLayerPlane");
	        bindFunc(cast(void**)&wglGetCurrentContext, "wglGetCurrentContext");
	        bindFunc(cast(void**)&wglGetCurrentDC, "wglGetCurrentDC");
	        bindFunc(cast(void**)&wglGetLayerPaletteEntries, "wglGetLayerPaletteEntries");
	        bindFunc(cast(void**)&wglGetProcAddress, "wglGetProcAddress");
	        bindFunc(cast(void**)&wglMakeCurrent, "wglMakeCurrent");
	        bindFunc(cast(void**)&wglRealizeLayerPalette, "wglRealizeLayerPalette");
	        bindFunc(cast(void**)&wglSetLayerPaletteEntries, "wglSetLayerPaletteEntries");
	        bindFunc(cast(void**)&wglShareLists, "wglShareLists");
	        bindFunc(cast(void**)&wglSwapLayerBuffers, "wglSwapLayerBuffers");
	        bindFunc(cast(void**)&wglUseFontBitmapsA, "wglUseFontBitmapsA");
	        bindFunc(cast(void**)&wglUseFontOutlinesA, "wglUseFontOutlinesA");
	        bindFunc(cast(void**)&wglUseFontBitmapsW, "wglUseFontBitmapsW");
	        bindFunc(cast(void**)&wglUseFontOutlinesW, "wglUseFontOutlinesW");
	    }
    }
}