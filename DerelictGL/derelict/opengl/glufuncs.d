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
module derelict.opengl.glufuncs;

private
{
	import derelict.opengl.gltypes;
    import derelict.opengl.glutypes;
    import derelict.util.compat;
}

extern(System)
{
    void function(GLUnurbs*) gluBeginCurve;
    void function(GLUtesselator*) gluBeginPolygon;
    void function(GLUnurbs*) gluBeginSurface;
    void function(GLUnurbs*) gluBeginTrim;
    GLint function(GLenum,GLint,GLsizei,GLenum,GLenum,in void*) gluBuild1DMipmaps;
    GLint function(GLenum,GLint,GLsizei,GLsizei,GLenum,GLenum,in void*) gluBuild2DMipmaps;
    void function(GLUquadric*,GLdouble,GLdouble,GLdouble,GLint,GLint) gluCylinder;
    void function(GLUnurbs*) gluDeleteNurbsRenderer;
    void function(GLUquadric*) gluDeleteQuadric;
    void function(GLUtesselator*) gluDeleteTess;
    void function(GLUquadric*,GLdouble,GLdouble,GLint,GLint) gluDisk;
    void function(GLUnurbs*) gluEndCurve;
    void function(GLUtesselator*) gluEndPolygon;
    void function(GLUnurbs*) gluEndSurface;
    void function(GLUnurbs*) gluEndTrim;
    CCPTR function(GLenum) gluErrorString;
    // wchar* function(GLenum) gluErrorUnicodeStringEXT;
    void function(GLUnurbs*,GLenum,GLfloat*) gluGetNurbsProperty;
    CCPTR function(GLenum) gluGetString;
    void function(GLUtesselator*,GLenum,GLdouble*) gluGetTessProperty;
    void function(GLUnurbs*,in GLfloat*,in GLfloat*,in GLint*) gluLoadSamplingMatrices;
    void function(GLdouble,GLdouble,GLdouble,GLdouble,GLdouble,GLdouble,GLdouble,GLdouble,GLdouble) gluLookAt;
    GLUnurbs* function() gluNewNurbsRenderer;
    GLUquadric* function() gluNewQuadric;
    GLUtesselator* function() gluNewTess;
    void function(GLUtesselator*,GLenum) gluNextContour;
    void function(GLUnurbs*,GLenum,_GLUfuncptr) gluNurbsCallback;
    void function(GLUnurbs*,GLint,GLfloat*,GLint,GLfloat*,GLint,GLenum) gluNurbsCurve;
    void function(GLUnurbs*,GLenum,GLfloat) gluNurbsProperty;
    void function(GLUnurbs*,GLint,GLfloat*,GLint,GLfloat*,GLint,GLint,GLfloat*,GLint,GLint,GLenum) gluNurbsSurface;
    void function(GLdouble,GLdouble,GLdouble,GLdouble) gluOrtho2D;
    void function(GLUquadric*,GLdouble,GLdouble,GLint,GLint,GLdouble,GLdouble) gluPartialDisk;
    void function(GLdouble,GLdouble,GLdouble,GLdouble) gluPerspective;
    void function(GLdouble,GLdouble,GLdouble,GLdouble,GLint*) gluPickMatrix;
    GLint function(GLdouble,GLdouble,GLdouble,in GLdouble*,in GLdouble*,in GLint*,GLdouble*,GLdouble*,GLdouble*) gluProject;
    void function(GLUnurbs*,GLint,GLfloat*,GLint,GLenum) gluPwlCurve;
    void function(GLUquadric*,GLenum,_GLUfuncptr) gluQuadricCallback;
    void function(GLUquadric*,GLenum) gluQuadricDrawStyle;
    void function(GLUquadric*,GLenum) gluQuadricNormals;
    void function(GLUquadric*,GLenum) gluQuadricOrientation;
    void function(GLUquadric*,GLboolean) gluQuadricTexture;
    GLint function(GLenum,GLsizei,GLsizei,GLenum,in void*,GLsizei,GLsizei,GLenum,GLvoid*) gluScaleImage;
    void function(GLUquadric*,GLdouble,GLint,GLint) gluSphere;
    void function(GLUtesselator*) gluTessBeginContour;
    void function(GLUtesselator*,GLvoid*) gluTessBeginPolygon;
    void function(GLUtesselator*,GLenum,_GLUfuncptr) gluTessCallback;
    void function(GLUtesselator*) gluTessEndContour;
    void function(GLUtesselator*) gluTessEndPolygon;
    void function(GLUtesselator*,GLdouble,GLdouble,GLdouble) gluTessNormal;
    void function(GLUtesselator*,GLenum,GLdouble) gluTessProperty;
    void function(GLUtesselator*,GLdouble*,GLvoid*) gluTessVertex;
    GLint function(GLdouble,GLdouble,GLdouble,in GLdouble*,in GLdouble*,in GLint*,GLdouble*,GLdouble*,GLdouble*) gluUnProject;
    // GLint function(GLdouble,GLdouble,GLdouble,GLdouble,in GLdouble*,in GLdouble*,in GLint*,GLdouble,GLdouble,GLdouble*,GLdouble*,GLdouble*,GLdouble*) gluUnProject4;
}