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
module derelict.opengl.glu;

public
{
    import derelict.opengl.glutypes;
    import derelict.opengl.glufuncs;
}

private
{
    import derelict.util.loader;
    import derelict.util.exception;
    import derelict.opengl.gl;
}

class DerelictGLULoader : SharedLibLoader
{
private:
    this()
    {
        super(
            "glu32.dll",
            "libGLU.so,libGLU.so.1",
            // on Mac, the GLU functions are in the OpenGL framework
            "../Frameworks/OpenGL.framework/OpenGL, /Library/Frameworks/OpenGL.framework/OpenGL, /System/Library/Frameworks/OpenGL.framework/OpenGL"
        );
    }

protected:
    override void loadSymbols()
    {
        if(!DerelictGL.isLoaded())
        {
            throw new SharedLibLoadException("DerelictGL must be loaded before attempting to load DerelictGLU!");
        }

        bindFunc(cast(void**)&gluBeginCurve, "gluBeginCurve");
        bindFunc(cast(void**)&gluBeginPolygon, "gluBeginPolygon");
        bindFunc(cast(void**)&gluBeginSurface, "gluBeginSurface");
        bindFunc(cast(void**)&gluBeginTrim, "gluBeginTrim");
        bindFunc(cast(void**)&gluBuild1DMipmaps, "gluBuild1DMipmaps");
        bindFunc(cast(void**)&gluBuild2DMipmaps, "gluBuild2DMipmaps");
        bindFunc(cast(void**)&gluCylinder, "gluCylinder");
        bindFunc(cast(void**)&gluDeleteNurbsRenderer, "gluDeleteNurbsRenderer");
        bindFunc(cast(void**)&gluDeleteQuadric, "gluDeleteQuadric");
        bindFunc(cast(void**)&gluDeleteTess, "gluDeleteTess");
        bindFunc(cast(void**)&gluDisk, "gluDisk");
        bindFunc(cast(void**)&gluEndCurve, "gluEndCurve");
        bindFunc(cast(void**)&gluEndPolygon, "gluEndPolygon");
        bindFunc(cast(void**)&gluEndSurface, "gluEndSurface");
        bindFunc(cast(void**)&gluEndTrim, "gluEndTrim");
        bindFunc(cast(void**)&gluErrorString, "gluErrorString");
        bindFunc(cast(void**)&gluGetNurbsProperty, "gluGetNurbsProperty");
        bindFunc(cast(void**)&gluGetString, "gluGetString");
        bindFunc(cast(void**)&gluGetTessProperty, "gluGetTessProperty");
        bindFunc(cast(void**)&gluLoadSamplingMatrices, "gluLoadSamplingMatrices");
        bindFunc(cast(void**)&gluLookAt, "gluLookAt");
        bindFunc(cast(void**)&gluNewNurbsRenderer, "gluNewNurbsRenderer");
        bindFunc(cast(void**)&gluNewQuadric, "gluNewQuadric");
        bindFunc(cast(void**)&gluNewTess, "gluNewTess");
        bindFunc(cast(void**)&gluNextContour, "gluNextContour");
        bindFunc(cast(void**)&gluNurbsCallback, "gluNurbsCallback");
        bindFunc(cast(void**)&gluNurbsCurve, "gluNurbsCurve");
        bindFunc(cast(void**)&gluNurbsProperty, "gluNurbsProperty");
        bindFunc(cast(void**)&gluNurbsSurface, "gluNurbsSurface");
        bindFunc(cast(void**)&gluOrtho2D, "gluOrtho2D");
        bindFunc(cast(void**)&gluPartialDisk, "gluPartialDisk");
        bindFunc(cast(void**)&gluPerspective, "gluPerspective");
        bindFunc(cast(void**)&gluPickMatrix, "gluPickMatrix");
        bindFunc(cast(void**)&gluProject, "gluProject");
        bindFunc(cast(void**)&gluPwlCurve, "gluPwlCurve");
        bindFunc(cast(void**)&gluQuadricCallback, "gluQuadricCallback");
        bindFunc(cast(void**)&gluQuadricDrawStyle, "gluQuadricDrawStyle");
        bindFunc(cast(void**)&gluQuadricNormals, "gluQuadricNormals");
        bindFunc(cast(void**)&gluQuadricOrientation, "gluQuadricOrientation");
        bindFunc(cast(void**)&gluQuadricTexture, "gluQuadricTexture");
        bindFunc(cast(void**)&gluScaleImage, "gluScaleImage");
        bindFunc(cast(void**)&gluSphere, "gluSphere");
        bindFunc(cast(void**)&gluTessBeginContour, "gluTessBeginContour");
        bindFunc(cast(void**)&gluTessBeginPolygon, "gluTessBeginPolygon");
        bindFunc(cast(void**)&gluTessCallback, "gluTessCallback");
        bindFunc(cast(void**)&gluTessEndContour, "gluTessEndContour");
        bindFunc(cast(void**)&gluTessEndPolygon, "gluTessEndPolygon");
        bindFunc(cast(void**)&gluTessNormal, "gluTessNormal");
        bindFunc(cast(void**)&gluTessProperty, "gluTessProperty");
        bindFunc(cast(void**)&gluTessVertex, "gluTessVertex");
        bindFunc(cast(void**)&gluUnProject, "gluUnProject");
    }
}

DerelictGLULoader DerelictGLU;

static this()
{
	DerelictGLU = new DerelictGLULoader();
}

static ~this()
{
	DerelictGLU.unload();
}