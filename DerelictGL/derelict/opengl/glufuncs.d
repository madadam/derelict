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