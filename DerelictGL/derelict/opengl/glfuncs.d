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
module derelict.opengl.glfuncs;

private
{
    import derelict.opengl.gltypes;
    import derelict.util.compat;
}

extern(System)
{
    void function(GLfloat c) glClearIndex;
    void function(GLclampf,GLclampf,GLclampf,GLclampf) glClearColor;
    void function(GLbitfield) glClear;
    void function(GLuint) glIndexMask;
    void function(GLboolean,GLboolean,GLboolean,GLboolean) glColorMask;
    void function(GLenum,GLclampf) glAlphaFunc;
    void function(GLenum,GLenum) glBlendFunc;
    void function(GLenum) glLogicOp;
    void function(GLenum) glCullFace;
    void function(GLenum) glFrontFace;
    void function(GLfloat) glPointSize;
    void function(GLfloat) glLineWidth;
    void function(GLint,GLushort) glLineStipple;
    void function(GLenum,GLenum) glPolygonMode;
    void function(GLfloat,GLfloat) glPolygonOffset;
    void function(in GLubyte*) glPolygonStipple;
    void function(GLubyte*) glGetPolygonStipple;
    void function(GLboolean) glEdgeFlag;
    void function(in GLboolean*)glEdgeFlagv;
    void function(GLint,GLint,GLsizei,GLsizei) glScissor;
    void function(GLenum,in GLdouble*) glClipPlane;
    void function(GLenum,GLdouble*) glGetClipPlane;
    void function(GLenum) glDrawBuffer;
    void function(GLenum) glReadBuffer;
    void function(GLenum) glEnable;
    void function(GLenum) glDisable;
    GLboolean function(GLenum) glIsEnabled;
    void function(GLenum) glEnableClientState;
    void function(GLenum) glDisableClientState;
    void function(GLenum,GLboolean*) glGetBooleanv;
    void function(GLenum,GLdouble*) glGetDoublev;
    void function(GLenum,GLfloat*) glGetFloatv;
    void function(GLenum,GLint*) glGetIntegerv;
    void function(GLbitfield) glPushAttrib;
    void function() glPopAttrib;
    void function(GLbitfield) glPushClientAttrib;
    void function() glPopClientAttrib;
    GLint function(GLenum) glRenderMode;
    GLenum function() glGetError;
    CCPTR function(GLenum) glGetString;
    void function() glFinish;
    void function() glFlush;
    void function(GLenum,GLenum) glHint;

    void function(GLclampd) glClearDepth;
    void function(GLenum) glDepthFunc;
    void function(GLboolean) glDepthMask;
    void function(GLclampd,GLclampd) glDepthRange;

    void function(GLfloat,GLfloat,GLfloat,GLfloat) glClearAccum;
    void function(GLenum,GLfloat) glAccum;

    void function(GLenum) glMatrixMode;
    void function(GLdouble,GLdouble,GLdouble,GLdouble,GLdouble,GLdouble) glOrtho;
    void function(GLdouble,GLdouble,GLdouble,GLdouble,GLdouble,GLdouble) glFrustum;
    void function(GLint,GLint,GLsizei,GLsizei) glViewport;
    void function() glPushMatrix;
    void function() glPopMatrix;
    void function() glLoadIdentity;
    void function(in GLdouble*) glLoadMatrixd;
    void function(in GLfloat*) glLoadMatrixf;
    void function(in GLdouble*) glMultMatrixd;
    void function(in GLfloat*) glMultMatrixf;
    void function(GLdouble,GLdouble,GLdouble,GLdouble) glRotated;
    void function(GLfloat,GLfloat,GLfloat,GLfloat) glRotatef;
    void function(GLdouble,GLdouble,GLdouble) glScaled;
    void function(GLfloat,GLfloat,GLfloat) glScalef;
    void function(GLdouble,GLdouble,GLdouble) glTranslated;
    void function(GLfloat,GLfloat,GLfloat) glTranslatef;

    GLboolean function(GLuint) glIsList;
    void function(GLuint,GLsizei) glDeleteLists;
    GLuint function(GLsizei) glGenLists;
    void function(GLuint,GLenum) glNewList;
    void function() glEndList;
    void function(GLuint) glCallList;
    void function(GLsizei,GLenum,in void*) glCallLists;
    void function(GLuint) glListBase;

    void function(GLenum) glBegin;
    void function() glEnd;
    void function(GLdouble,GLdouble) glVertex2d;
    void function(GLfloat,GLfloat) glVertex2f;
    void function(GLint,GLint) glVertex2i;
    void function(GLshort,GLshort) glVertex2s;
    void function(GLdouble,GLdouble,GLdouble) glVertex3d;
    void function(GLfloat,GLfloat,GLfloat) glVertex3f;
    void function(GLint,GLint,GLint) glVertex3i;
    void function(GLshort,GLshort,GLshort) glVertex3s;
    void function(GLdouble,GLdouble,GLdouble,GLdouble) glVertex4d;
    void function(GLfloat,GLfloat,GLfloat,GLfloat) glVertex4f;
    void function(GLint,GLint,GLint,GLint) glVertex4i;
    void function(GLshort,GLshort,GLshort,GLshort) glVertex4s;
    void function(in GLdouble*) glVertex2dv;
    void function(in GLfloat*) glVertex2fv;
    void function(in GLint*) glVertex2iv;
    void function(in GLshort*) glVertex2sv;
    void function(in GLdouble*) glVertex3dv;
    void function(in GLfloat*) glVertex3fv;
    void function(in GLint*) glVertex3iv;
    void function(in GLshort*) glVertex3sv;
    void function(in GLdouble*) glVertex4dv;
    void function(in GLfloat*) glVertex4fv;
    void function(in GLint*) glVertex4iv;
    void function(in GLshort*) glVertex4sv;
    void function(GLbyte,GLbyte,GLbyte) glNormal3b;
    void function(GLdouble,GLdouble,GLdouble) glNormal3d;
    void function(GLfloat,GLfloat,GLfloat) glNormal3f;
    void function(GLint,GLint,GLint) glNormal3i;
    void function(GLshort,GLshort,GLshort) glNormal3s;
    void function(in GLbyte*) glNormal3bv;
    void function(in GLdouble*) glNormal3dv;
    void function(in GLfloat*) glNormal3fv;
    void function(in GLint*) glNormal3iv;
    void function(in GLshort*) glNormal3sv;
    void function(GLdouble) glIndexd;
    void function(GLfloat) glIndexf;
    void function(GLint) glIndexi;
    void function(GLshort) glIndexs;
    void function(GLubyte) glIndexub;
    void function(in GLdouble*) glIndexdv;
    void function(in GLfloat*) glIndexfv;
    void function(in GLint*) glIndexiv;
    void function(in GLshort*) glIndexsv;
    void function(in GLubyte*) glIndexubv;
    void function(GLbyte,GLbyte,GLbyte) glColor3b;
    void function(GLdouble,GLdouble,GLdouble) glColor3d;
    void function(GLfloat,GLfloat,GLfloat) glColor3f;
    void function(GLint,GLint,GLint) glColor3i;
    void function(GLshort,GLshort,GLshort) glColor3s;
    void function(GLubyte,GLubyte,GLubyte) glColor3ub;
    void function(GLuint,GLuint,GLuint) glColor3ui;
    void function(GLushort,GLushort,GLushort) glColor3us;
    void function(GLbyte,GLbyte,GLbyte,GLbyte) glColor4b;
    void function(GLdouble,GLdouble,GLdouble,GLdouble) glColor4d;
    void function(GLfloat,GLfloat,GLfloat,GLfloat) glColor4f;
    void function(GLint,GLint,GLint,GLint) glColor4i;
    void function(GLshort,GLshort,GLshort,GLshort) glColor4s;
    void function(GLubyte,GLubyte,GLubyte,GLubyte) glColor4ub;
    void function(GLuint,GLuint,GLuint,GLuint) glColor4ui;
    void function(GLushort,GLushort,GLushort,GLushort) glColor4us;
    void function(in GLbyte*) glColor3bv;
    void function(in GLdouble*) glColor3dv;
    void function(in GLfloat*) glColor3fv;
    void function(in GLint*) glColor3iv;
    void function(in GLshort*) glColor3sv;
    void function(in GLubyte*) glColor3ubv;
    void function(in GLuint*) glColor3uiv;
    void function(in GLushort*) glColor3usv;
    void function(in GLbyte*) glColor4bv;
    void function(in GLdouble*) glColor4dv;
    void function(in GLfloat*) glColor4fv;
    void function(in GLint*) glColor4iv;
    void function(in GLshort*) glColor4sv;
    void function(in GLubyte*) glColor4ubv;
    void function(in GLuint*) glColor4uiv;
    void function(in GLushort*) glColor4usv;
    void function(GLdouble) glTexCoord1d;
    void function(GLfloat) glTexCoord1f;
    void function(GLint) glTexCoord1i;
    void function(GLshort) glTexCoord1s;
    void function(GLdouble,GLdouble) glTexCoord2d;
    void function(GLfloat,GLfloat) glTexCoord2f;
    void function(GLint,GLint) glTexCoord2i;
    void function(GLshort,GLshort) glTexCoord2s;
    void function(GLdouble,GLdouble,GLdouble) glTexCoord3d;
    void function(GLfloat,GLfloat,GLfloat) glTexCoord3f;
    void function(GLint,GLint,GLint) glTexCoord3i;
    void function(GLshort,GLshort,GLshort) glTexCoord3s;
    void function(GLdouble,GLdouble,GLdouble,GLdouble) glTexCoord4d;
    void function(GLfloat,GLfloat,GLfloat,GLfloat) glTexCoord4f;
    void function(GLint,GLint,GLint,GLint) glTexCoord4i;
    void function(GLshort,GLshort,GLshort,GLshort) glTexCoord4s;
    void function(in GLdouble*) glTexCoord1dv;
    void function(in GLfloat*) glTexCoord1fv;
    void function(in GLint*) glTexCoord1iv;
    void function(in GLshort*) glTexCoord1sv;
    void function(in GLdouble*) glTexCoord2dv;
    void function(in GLfloat*) glTexCoord2fv;
    void function(in GLint*) glTexCoord2iv;
    void function(in GLshort*) glTexCoord2sv;
    void function(in GLdouble*) glTexCoord3dv;
    void function(in GLfloat*) glTexCoord3fv;
    void function(in GLint*) glTexCoord3iv;
    void function(in GLshort*) glTexCoord3sv;
    void function(in GLdouble*) glTexCoord4dv;
    void function(in GLfloat*) glTexCoord4fv;
    void function(in GLint*) glTexCoord4iv;
    void function(in GLshort*) glTexCoord4sv;
    void function(GLdouble,GLdouble) glRasterPos2d;
    void function(GLfloat,GLfloat) glRasterPos2f;
    void function(GLint,GLint) glRasterPos2i;
    void function(GLshort,GLshort) glRasterPos2s;
    void function(GLdouble,GLdouble,GLdouble) glRasterPos3d;
    void function(GLfloat,GLfloat,GLfloat) glRasterPos3f;
    void function(GLint,GLint,GLint) glRasterPos3i;
    void function(GLshort,GLshort,GLshort) glRasterPos3s;
    void function(GLdouble,GLdouble,GLdouble,GLdouble) glRasterPos4d;
    void function(GLfloat,GLfloat,GLfloat,GLfloat) glRasterPos4f;
    void function(GLint,GLint,GLint,GLint) glRasterPos4i;
    void function(GLshort,GLshort,GLshort,GLshort) glRasterPos4s;
    void function(in GLdouble*) glRasterPos2dv;
    void function(in GLfloat*) glRasterPos2fv;
    void function(in GLint*) glRasterPos2iv;
    void function(in GLshort*) glRasterPos2sv;
    void function(in GLdouble*) glRasterPos3dv;
    void function(in GLfloat*) glRasterPos3fv;
    void function(in GLint*) glRasterPos3iv;
    void function(in GLshort*) glRasterPos3sv;
    void function(in GLdouble*) glRasterPos4dv;
    void function(in GLfloat*) glRasterPos4fv;
    void function(in GLint*) glRasterPos4iv;
    void function(in GLshort*) glRasterPos4sv;
    void function(GLdouble,GLdouble,GLdouble,GLdouble) glRectd;
    void function(GLfloat,GLfloat,GLfloat,GLfloat) glRectf;
    void function(GLint,GLint,GLint,GLint) glRecti;
    void function(GLshort,GLshort,GLshort,GLshort) glRects;
    void function(in GLdouble*, in GLdouble*) glRectdv;
    void function(in GLfloat*, in GLfloat*) glRectfv;
    void function(in GLint*, in GLint*) glRectiv;
    void function(in GLshort*, in GLshort*) glRectsv;

    void function(GLenum) glShadeModel;
    void function(GLenum,GLenum,GLfloat) glLightf;
    void function(GLenum,GLenum,GLint) glLighti;
    void function(GLenum,GLenum,in GLfloat*) glLightfv;
    void function(GLenum,GLenum,in GLint*) glLightiv;
    void function(GLenum,GLenum,GLfloat*) glGetLightfv;
    void function(GLenum,GLenum,GLint*) glGetLightiv;
    void function(GLenum,GLfloat) glLightModelf;
    void function(GLenum,GLint) glLightModeli;
    void function(GLenum,in GLfloat*) glLightModelfv;
    void function(GLenum,in GLint*) glLightModeliv;
    void function(GLenum,GLenum,GLfloat) glMaterialf;
    void function(GLenum,GLenum,GLint) glMateriali;
    void function(GLenum,GLenum,in GLfloat*) glMaterialfv;
    void function(GLenum,GLenum,in GLint*) glMaterialiv;
    void function(GLenum,GLenum,GLfloat*) glGetMaterialfv;
    void function(GLenum,GLenum,GLint*) glGetMaterialiv;
    void function(GLenum,GLenum) glColorMaterial;

    void function(GLfloat,GLfloat) glPixelZoom;
    void function(GLenum,GLfloat) glPixelStoref;
    void function(GLenum,GLint) glPixelStorei;
    void function(GLenum,GLfloat) glPixelTransferf;
    void function(GLenum,GLint) glPixelTransferi;
    void function(GLenum,GLint,in GLfloat*) glPixelMapfv;
    void function(GLenum,GLint,in GLuint*) glPixelMapuiv;
    void function(GLenum,GLint,in GLushort*) glPixelMapusv;
    void function(GLenum,GLfloat*) glGetPixelMapfv;
    void function(GLenum,GLuint*) glGetPixelMapuiv;
    void function(GLenum,GLushort*) glGetPixelMapusv;
    void function(GLsizei,GLsizei,GLfloat,GLfloat,GLfloat,GLfloat,in GLubyte*) glBitmap;
    void function(GLint,GLint,GLsizei,GLsizei,GLenum,GLenum,void*) glReadPixels;
    void function(GLsizei,GLsizei,GLenum,GLenum,in void*) glDrawPixels;
    void function(GLint,GLint,GLsizei,GLsizei,GLenum) glCopyPixels;

    void function(GLenum,GLint,GLuint) glStencilFunc;
    void function(GLuint) glStencilMask;
    void function(GLenum,GLenum,GLenum) glStencilOp;
    void function(GLint) glClearStencil;

    void function(GLenum,GLenum,GLdouble) glTexGend;
    void function(GLenum,GLenum,GLfloat) glTexGenf;
    void function(GLenum,GLenum,GLint) glTexGeni;
    void function(GLenum,GLenum,in GLdouble*) glTexGendv;
    void function(GLenum,GLenum,in GLfloat*) glTexGenfv;
    void function(GLenum,GLenum,in GLint*) glTexGeniv;
    void function(GLenum,GLenum,GLdouble*) glGetTexGendv;
    void function(GLenum,GLenum,GLfloat*) glGetTexGenfv;
    void function(GLenum,GLenum,GLint*) glGetTexGeniv;
    void function(GLenum,GLenum,GLfloat) glTexEnvf;
    void function(GLenum,GLenum,GLint) glTexEnvi;
    void function(GLenum,GLenum,in GLfloat*) glTexEnvfv;
    void function(GLenum,GLenum,in GLint*) glTexEnviv;
    void function(GLenum,GLenum,GLfloat*) glGetTexEnvfv;
    void function(GLenum,GLenum,GLint*) glGetTexEnviv;
    void function(GLenum,GLenum,GLfloat) glTexParameterf;
    void function(GLenum,GLenum,GLint) glTexParameteri;
    void function(GLenum,GLenum,in GLfloat*) glTexParameterfv;
    void function(GLenum,GLenum,in GLint*) glTexParameteriv;
    void function(GLenum,GLenum,GLfloat*) glGetTexParameterfv;
    void function(GLenum,GLenum,GLint*) glGetTexParameteriv;
    void function(GLenum,GLint,GLenum,GLfloat*) glGetTexLevelParameterfv;
    void function(GLenum,GLint,GLenum,GLint*) glGetTexLevelParameteriv;
    void function(GLenum,GLint,GLint,GLsizei,GLint,GLenum,GLenum,void*) glTexImage1D;
    void function(GLenum,GLint,GLint,GLsizei,GLsizei,GLint,GLenum,GLenum,void*) glTexImage2D;
    void function(GLenum,GLint,GLenum,GLenum,void*) glGetTexImage;

    void function(GLenum,GLdouble,GLdouble,GLint,GLint,in GLdouble*) glMap1d;
    void function(GLenum,GLfloat,GLfloat,GLint,GLint,in GLfloat*) glMap1f;
    void function(GLenum,GLdouble,GLdouble,GLint,GLint,GLdouble,GLdouble,GLint,GLint,GLdouble*) glMap2d;
    void function(GLenum,GLfloat,GLfloat,GLint,GLint,GLfloat,GLfloat,GLint,GLint,GLfloat*) glMap2f;
    void function(GLenum,GLenum,GLdouble*) glGetMapdv;
    void function(GLenum,GLenum,GLfloat*) glGetMapfv;
    void function(GLenum,GLenum,GLint*) glGetMapiv;
    void function(GLdouble) glEvalCoord1d;
    void function(GLfloat) glEvalCoord1f;
    void function(in GLdouble*) glEvalCoord1dv;
    void function(in GLfloat*) glEvalCoord1fv;
    void function(GLdouble,GLdouble) glEvalCoord2d;
    void function(GLfloat,GLfloat) glEvalCoord2f;
    void function(in GLdouble*) glEvalCoord2dv;
    void function(in GLfloat*) glEvalCoord2fv;
    void function(GLint,GLdouble,GLdouble) glMapGrid1d;
    void function(GLint,GLfloat,GLfloat) glMapGrid1f;
    void function(GLint,GLdouble,GLdouble,GLint,GLdouble,GLdouble) glMapGrid2d;
    void function(GLint,GLfloat,GLfloat,GLint,GLfloat,GLfloat) glMapGrid2f;
    void function(GLint) glEvalPoint1;
    void function(GLint,GLint) glEvalPoint2;
    void function(GLenum,GLint,GLint) glEvalMesh1;
    void function(GLenum,GLint,GLint,GLint,GLint) glEvalMesh2;

    void function(GLenum,GLfloat) glFogf;
    void function(GLenum,GLint) glFogi;
    void function(GLenum,in GLfloat*) glFogfv;
    void function(GLenum,in GLint*) glFogiv;

    void function(GLsizei,GLenum,GLfloat*) glFeedbackBuffer;
    void function(GLfloat) glPassThrough;
    void function(GLsizei,GLuint*) glSelectBuffer;
    void function() glInitNames;
    void function(GLuint) glLoadName;
    void function(GLuint) glPushName;
    void function() glPopName;

    void function(GLsizei,GLuint*) glGenTextures;
    void function(GLsizei,in GLuint*) glDeleteTextures;
    void function(GLenum,GLuint) glBindTexture;
    void function(GLsizei,in GLuint*,in GLclampf*) glPrioritizeTextures;
    GLboolean function(GLsizei,in GLuint*,GLboolean*) glAreTexturesResident;
    GLboolean function(GLuint) glIsTexture;

    void function(GLenum,GLint,GLint,GLsizei,GLenum,GLenum,in void*) glTexSubImage1D;
    void function(GLenum,GLint,GLint,GLint,GLsizei,GLsizei,GLenum,GLenum,in void*) glTexSubImage2D;
    void function(GLenum,GLint,GLenum,GLint,GLint,GLsizei,GLint) glCopyTexImage1D;
    void function(GLenum,GLint,GLenum,GLint,GLint,GLsizei,GLsizei,GLint) glCopyTexImage2D;
    void function(GLenum,GLint,GLint,GLint,GLint,GLsizei) glCopyTexSubImage1D;
    void function(GLenum,GLint,GLint,GLint,GLint,GLint,GLsizei,GLsizei) glCopyTexSubImage2D;

    void function(GLint,GLenum,GLsizei,in void*) glVertexPointer;
    void function(GLenum,GLsizei,in void*) glNormalPointer;
    void function(GLint,GLenum,GLsizei,in void*) glColorPointer;
    void function(GLenum,GLsizei,in void*) glIndexPointer;
    void function(GLint,GLenum,GLsizei,in void*) glTexCoordPointer;
    void function(GLsizei,in void*) glEdgeFlagPointer;
    void function(GLenum,void**) glGetPointerv;
    void function(GLint) glArrayElement;
    void function(GLenum,GLint,GLsizei) glDrawArrays;
    void function(GLenum,GLsizei,GLenum,in void*) glDrawElements;
    void function(GLenum,GLsizei,in void*) glInterleavedArrays;

    // gl 1.2
    void function(GLenum, GLuint, GLuint, GLsizei, GLenum, in void*) glDrawRangeElements;
    void function(GLenum, GLint, GLint, GLsizei, GLsizei, GLsizei, GLint, GLenum, GLenum, void*) glTexImage3D;
    void function(GLenum, GLint, GLint, GLint, GLint, GLsizei, GLsizei, GLsizei, GLenum, GLenum, void*) glTexSubImage3D;
    void function(GLenum, GLint, GLint, GLint, GLint, GLint, GLint, GLsizei, GLsizei) glCopyTexSubImage3D;

    /* This is GL_ARB_Imaging Extension
    void function(GLenum, GLenum, GLsizei, GLenum, GLenum, in void*) glColorTable;
    void function(GLenum, GLsizei, GLsizei, GLenum, GLenum, in void*) glColorSubTable;
    void function(GLenum, GLenum, in GLint*) glColorTableParameteriv;
    void function(GLenum, GLenum, in GLfloat*) glColorTableParameterfv;
    void function(GLenum, GLsizei, GLint, GLint, GLsizei) glCopyColorSubTable;
    void function(GLenum, GLenum, GLint, GLint, GLsizei) glCopyColorTable;
    void function(GLenum, GLenum, GLenum, void*) glGetColorTable;
    void function(GLenum, GLenum, GLfloat*) glGetColorTableParameterfv;
    void function(GLenum, GLenum, GLint*) glGetColorTableParameteriv;
    void function(GLenum, GLsizei, GLenum, GLboolean) glHistogram;
    void function(GLenum) glResetHistogram;
    void function(GLenum, GLboolean, GLenum, GLenum, void*) glGetHistogram;
    void function(GLenum, GLenum, GLfloat*) glGetHistogramParameterfv;
    void function(GLenum, GLenum, GLint*) glGetHistogramParameteriv;
    void function(GLenum, GLenum, GLboolean) glMinmax;
    void function(GLenum) glResetMinmax;
    void function(GLenum, GLboolean, GLenum, GLenum, void*) glGetMinmax;
    void function(GLenum, GLenum, GLfloat*) glGetMinmaxParameterfv;
    void function(GLenum, GLenum, GLint*) glGetMinmaxParameteriv;
    void function(GLenum, GLenum, GLsizei, GLenum, GLenum, in void*) glConvolutionFilter1D;
    void function(GLenum, GLenum, GLsizei, GLsizei, GLenum, GLenum, in void*) glConvolutionFilter2D;
    void function(GLenum, GLenum, GLfloat) glConvolutionParameterf;
    void function(GLenum, GLenum, in GLfloat*) glConvolutionParameterfv;
    void function(GLenum, GLenum, GLint) glConvolutionParameteri;
    void function(GLenum, GLenum, in GLint*) glConvolutionParameteriv;
    void function(GLenum, GLenum, GLint, GLint, GLsizei) glCopyConvolutionFilter1D;
    void function(GLenum, GLenum, GLint, GLint, GLsizei, GLsizei) glCopyConvolutionFilter2D;
    void function(GLenum, GLenum, GLenum, void*) glGetConvolutionFilter;
    void function(GLenum, GLenum, GLfloat*) glGetConvolutionParameterfv;
    void function(GLenum, GLenum, GLint*) glGetConvolutionParameteriv;
    void function(GLenum, GLenum, GLsizei, GLsizei, GLenum, GLenum, in void*, in void*) glSeparableFilter2D;
    void function(GLenum, GLenum, GLenum, void*, void*, void*) glSeparableFilter2D;
    */
    // gl 1.3
    void function(GLenum) glActiveTexture;
    void function(GLenum) glClientActiveTexture;
    void function(GLenum, GLdouble) glMultiTexCoord1d;
    void function(GLenum, in GLdouble*) glMultiTexCoord1dv;
    void function(GLenum, GLfloat) glMultiTexCoord1f;
    void function(GLenum, in GLfloat*) glMultiTexCoord1fv;
    void function(GLenum, GLint) glMultiTexCoord1i;
    void function(GLenum, in GLint*) glMultiTexCoord1iv;
    void function(GLenum, GLshort) glMultiTexCoord1s;
    void function(GLenum, in GLshort*) glMultiTexCoord1sv;
    void function(GLenum, GLdouble, GLdouble) glMultiTexCoord2d;
    void function(GLenum, in GLdouble*) glMultiTexCoord2dv;
    void function(GLenum, GLfloat, GLfloat) glMultiTexCoord2f;
    void function(GLenum, in GLfloat*) glMultiTexCoord2fv;
    void function(GLenum, GLint, GLint) glMultiTexCoord2i;
    void function(GLenum, in GLint*) glMultiTexCoord2iv;
    void function(GLenum, GLshort, GLshort) glMultiTexCoord2s;
    void function(GLenum, in GLshort*) glMultiTexCoord2sv;
    void function(GLenum, GLdouble, GLdouble, GLdouble) glMultiTexCoord3d;
    void function(GLenum, in GLdouble*) glMultiTexCoord3dv;
    void function(GLenum, GLfloat, GLfloat, GLfloat) glMultiTexCoord3f;
    void function(GLenum, in GLfloat*) glMultiTexCoord3fv;
    void function(GLenum, GLint, GLint, GLint) glMultiTexCoord3i;
    void function(GLenum, in GLint*) glMultiTexCoord3iv;
    void function(GLenum, GLshort, GLshort, GLshort) glMultiTexCoord3s;
    void function(GLenum, in GLshort*) glMultiTexCoord3sv;
    void function(GLenum, GLdouble, GLdouble, GLdouble, GLdouble) glMultiTexCoord4d;
    void function(GLenum, in GLdouble*) glMultiTexCoord4dv;
    void function(GLenum, GLfloat, GLfloat, GLfloat, GLfloat) glMultiTexCoord4f;
    void function(GLenum, in GLfloat*) glMultiTexCoord4fv;
    void function(GLenum, GLint, GLint, GLint, GLint) glMultiTexCoord4i;
    void function(GLenum, in GLint*) glMultiTexCoord4iv;
    void function(GLenum, GLshort, GLshort, GLshort, GLshort) glMultiTexCoord4s;
    void function(GLenum, in GLshort*) glMultiTexCoord4sv;
    void function(GLdouble*) glLoadTransposeMatrixd;
    void function(in GLfloat*) glLoadTransposeMatrixf;
    void function(in GLdouble*) glMultTransposeMatrixd;
    void function(in GLfloat*) glMultTransposeMatrixf;
    void function(in GLclampf, GLboolean) glSampleCoverage;
    void function(GLenum, GLint, GLenum, GLsizei, GLint, GLsizei, in void*) glCompressedTexImage1D;
    void function(GLenum, GLint, GLenum, GLsizei, GLsizei, GLint, GLsizei, in void*) glCompressedTexImage2D;
    void function(GLenum, GLint, GLenum, GLsizei, GLsizei, GLsizei depth, GLint, GLsizei, in void*) glCompressedTexImage3D;
    void function(GLenum, GLint, GLint, GLsizei, GLenum, GLsizei, in void*) glCompressedTexSubImage1D;
    void function(GLenum, GLint, GLint, GLint, GLsizei, GLsizei, GLenum, GLsizei, in void*) glCompressedTexSubImage2D;
    void function(GLenum, GLint, GLint, GLint, GLint, GLsizei, GLsizei, GLsizei, GLenum, GLsizei, in void*) glCompressedTexSubImage3D;
    void function(GLenum, GLint, void*) glGetCompressedTexImage;

    // gl 1.4
    void function(GLenum, GLenum, GLenum, GLenum) glBlendFuncSeparate;
    void function(GLfloat) glFogCoordf;
    void function(in GLfloat*) glFogCoordfv;
    void function(GLdouble) glFogCoordd;
    void function(in GLdouble*) glFogCoorddv;
    void function(GLenum, GLsizei,in void*) glFogCoordPointer;
    void function(GLenum, GLint*, GLsizei*, GLsizei) glMultiDrawArrays;
    void function(GLenum, GLsizei*, GLenum, in void**, GLsizei) glMultiDrawElements;
    void function(GLenum, GLfloat) glPointParameterf;
    void function(GLenum, GLfloat*) glPointParameterfv;
    void function(GLenum, GLint) glPointParameteri;
    void function(GLenum, GLint*) glPointParameteriv;
    void function(GLbyte, GLbyte, GLbyte) glSecondaryColor3b;
    void function(in GLbyte*) glSecondaryColor3bv;
    void function(GLdouble, GLdouble, GLdouble) glSecondaryColor3d;
    void function(in GLdouble*) glSecondaryColor3dv;
    void function(GLfloat, GLfloat, GLfloat) glSecondaryColor3f;
    void function(in GLfloat*) glSecondaryColor3fv;
    void function(GLint, GLint, GLint) glSecondaryColor3i;
    void function(in GLint*) glSecondaryColor3iv;
    void function(GLshort, GLshort, GLshort) glSecondaryColor3s;
    void function(in GLshort*) glSecondaryColor3sv;
    void function(GLubyte, GLubyte, GLubyte) glSecondaryColor3ub;
    void function(in GLubyte*) glSecondaryColor3ubv;
    void function(GLuint, GLuint, GLuint) glSecondaryColor3ui;
    void function(in GLuint*) glSecondaryColor3uiv;
    void function(GLushort, GLushort, GLushort) glSecondaryColor3us;
    void function(in GLushort*) glSecondaryColor3usv;
    void function(GLint, GLenum, GLsizei, void*) glSecondaryColorPointer;
    void function(GLdouble, GLdouble) glWindowPos2d;
    void function(in GLdouble*) glWindowPos2dv;
    void function(GLfloat, GLfloat) glWindowPos2f;
    void function(in GLfloat*) glWindowPos2fv;
    void function(GLint, GLint) glWindowPos2i;
    void function(in GLint*) glWindowPos2iv;
    void function(GLshort, GLshort) glWindowPos2s;
    void function(in GLshort*) glWindowPos2sv;
    void function(GLdouble, GLdouble, GLdouble) glWindowPos3d;
    void function(in GLdouble*) glWindowPos3dv;
    void function(GLfloat, GLfloat, GLfloat) glWindowPos3f;
    void function(in GLfloat*) glWindowPos3fv;
    void function(GLint, GLint, GLint) glWindowPos3i;
    void function(in GLint*) glWindowPos3iv;
    void function(GLshort, GLshort, GLshort) glWindowPos3s;
    void function(in GLshort*) glWindowPos3sv;
    void function(GLclampf, GLclampf, GLclampf, GLclampf) glBlendColor;
    void function(GLenum) glBlendEquation;

    // gl 1.5
    void function(GLsizei, GLuint*) glGenQueries;
    void function(GLsizei,in GLuint*) glDeleteQueries;
    GLboolean function(GLuint) glIsQuery;
    void function(GLenum, GLuint) glBeginQuery;
    void function(GLenum) glEndQuery;
    void function(GLenum, GLenum, GLint*) glGetQueryiv;
    void function(GLuint, GLenum, GLint*) glGetQueryObjectiv;
    void function(GLuint, GLenum, GLuint*) glGetQueryObjectuiv;
    void function(GLenum, GLuint) glBindBuffer;
    void function(GLsizei, in GLuint*) glDeleteBuffers;
    void function(GLsizei, GLuint*) glGenBuffers;
    GLboolean function(GLuint) glIsBuffer;
    void function(GLenum, GLsizeiptr, in void*, GLenum) glBufferData;
    void function(GLenum, GLintptr, GLsizeiptr,in void*) glBufferSubData;
    void function(GLenum, GLintptr, GLsizeiptr, void*) glGetBufferSubData;
    void* function(GLenum, GLenum) glMapBuffer;
    GLboolean function(GLenum) glUnmapBuffer;
    void function(GLenum, GLenum, GLint*) glGetBufferParameteriv;
    void function(GLenum, GLenum, void**) glGetBufferPointerv;

    // gl 2.0
    void function(GLenum, GLenum) glBlendEquationSeparate;
    void function(GLsizei, in GLenum*) glDrawBuffers;
    void function(GLenum, GLenum, GLenum, GLenum) glStencilOpSeparate;
    void function(GLenum, GLenum, GLint, GLuint) glStencilFuncSeparate;
    void function(GLenum, GLuint) glStencilMaskSeparate;
    void function(GLuint, GLuint) glAttachShader;
    void function(GLuint, GLuint, in GLchar*) glBindAttribLocation;
    void function(GLuint) glCompileShader;
    GLuint function() glCreateProgram;
    GLuint function(GLenum) glCreateShader;
    void function(GLuint) glDeleteProgram;
    void function(GLuint) glDeleteShader;
    void function(GLuint, GLuint) glDetachShader;
    void function(GLuint) glDisableVertexAttribArray;
    void function(GLuint) glEnableVertexAttribArray;
    void function(GLuint, GLuint, GLsizei, GLsizei*, GLint*, GLenum*, GLchar*) glGetActiveAttrib;
    void function(GLuint, GLuint, GLsizei, GLsizei*, GLint*, GLenum*, GLchar*) glGetActiveUniform;
    void function(GLuint, GLsizei, GLsizei*, GLuint*) glGetAttachedShaders;
    GLint function(GLuint, in GLchar*) glGetAttribLocation;
    void function(GLuint, GLenum, GLint*) glGetProgramiv;
    void function(GLuint, GLsizei, GLsizei*, GLchar*) glGetProgramInfoLog;
    void function(GLuint, GLenum, GLint *) glGetShaderiv;
    void function(GLuint, GLsizei, GLsizei*, GLchar*) glGetShaderInfoLog;
    void function(GLuint, GLsizei, GLsizei*, GLchar*) glGetShaderSource;
    GLint function(GLuint, in GLchar*) glGetUniformLocation;
    void function(GLuint, GLint, GLfloat*) glGetUniformfv;
    void function(GLuint, GLint, GLint*) glGetUniformiv;
    void function(GLuint, GLenum, GLdouble*) glGetVertexAttribdv;
    void function(GLuint, GLenum, GLfloat*) glGetVertexAttribfv;
    void function(GLuint, GLenum, GLint*) glGetVertexAttribiv;
    void function(GLuint, GLenum, void**) glGetVertexAttribPointerv;
    GLboolean function(GLuint) glIsProgram;
    GLboolean function(GLuint) glIsShader;
    void function(GLuint) glLinkProgram;
    void function(GLuint, GLsizei, in GLchar**, in GLint*) glShaderSource;
    void function(GLuint) glUseProgram;
    void function(GLint, GLfloat) glUniform1f;
    void function(GLint, GLfloat, GLfloat) glUniform2f;
    void function(GLint, GLfloat, GLfloat, GLfloat) glUniform3f;
    void function(GLint, GLfloat, GLfloat, GLfloat, GLfloat) glUniform4f;
    void function(GLint, GLint) glUniform1i;
    void function(GLint, GLint, GLint) glUniform2i;
    void function(GLint, GLint, GLint, GLint) glUniform3i;
    void function(GLint, GLint, GLint, GLint, GLint) glUniform4i;
    void function(GLint, GLsizei, in GLfloat*) glUniform1fv;
    void function(GLint, GLsizei, in GLfloat*) glUniform2fv;
    void function(GLint, GLsizei, in GLfloat*) glUniform3fv;
    void function(GLint, GLsizei, in GLfloat*) glUniform4fv;
    void function(GLint, GLsizei, in GLint*) glUniform1iv;
    void function(GLint, GLsizei, in GLint*) glUniform2iv;
    void function(GLint, GLsizei, in GLint*) glUniform3iv;
    void function(GLint, GLsizei, in GLint*) glUniform4iv;
    void function(GLint, GLsizei, GLboolean, in GLfloat*) glUniformMatrix2fv;
    void function(GLint, GLsizei, GLboolean, in GLfloat*) glUniformMatrix3fv;
    void function(GLint, GLsizei, GLboolean, in GLfloat*) glUniformMatrix4fv;
    void function(GLuint) glValidateProgram;
    void function(GLuint, GLdouble) glVertexAttrib1d;
    void function(GLuint, in GLdouble*) glVertexAttrib1dv;
    void function(GLuint, GLfloat) glVertexAttrib1f;
    void function(GLuint, in GLfloat*) glVertexAttrib1fv;
    void function(GLuint, GLshort) glVertexAttrib1s;
    void function(GLuint, in GLshort*) glVertexAttrib1sv;
    void function(GLuint, GLdouble, GLdouble) glVertexAttrib2d;
    void function(GLuint, in GLdouble*) glVertexAttrib2dv;
    void function(GLuint, GLfloat, GLfloat) glVertexAttrib2f;
    void function(GLuint, in GLfloat*) glVertexAttrib2fv;
    void function(GLuint, GLshort, GLshort) glVertexAttrib2s;
    void function(GLuint, in GLshort*) glVertexAttrib2sv;
    void function(GLuint, GLdouble, GLdouble, GLdouble) glVertexAttrib3d;
    void function(GLuint, in GLdouble*) glVertexAttrib3dv;
    void function(GLuint, GLfloat, GLfloat, GLfloat) glVertexAttrib3f;
    void function(GLuint, in GLfloat*) glVertexAttrib3fv;
    void function(GLuint, GLshort, GLshort, GLshort) glVertexAttrib3s;
    void function(GLuint, in GLshort*) glVertexAttrib3sv;
    void function(GLuint, in GLbyte*) glVertexAttrib4Nbv;
    void function(GLuint, in GLint*) glVertexAttrib4Niv;
    void function(GLuint, in GLshort*) glVertexAttrib4Nsv;
    void function(GLuint, GLubyte, GLubyte, GLubyte, GLubyte) glVertexAttrib4Nub;
    void function(GLuint, in GLubyte*) glVertexAttrib4Nubv;
    void function(GLuint, in GLuint*) glVertexAttrib4Nuiv;
    void function(GLuint, in GLushort*) glVertexAttrib4Nusv;
    void function(GLuint, in GLbyte*) glVertexAttrib4bv;
    void function(GLuint, GLdouble, GLdouble, GLdouble, GLdouble) glVertexAttrib4d;
    void function(GLuint, in GLdouble*) glVertexAttrib4dv;
    void function(GLuint, GLfloat, GLfloat, GLfloat, GLfloat) glVertexAttrib4f;
    void function(GLuint, in GLfloat*) glVertexAttrib4fv;
    void function(GLuint, in GLint*) glVertexAttrib4iv;
    void function(GLuint, GLshort, GLshort, GLshort, GLshort) glVertexAttrib4s;
    void function(GLuint, in GLshort*) glVertexAttrib4sv;
    void function(GLuint, in GLubyte*) glVertexAttrib4ubv;
    void function(GLuint, in GLuint*) glVertexAttrib4uiv;
    void function(GLuint, in GLushort*) glVertexAttrib4usv;
    void function(GLuint, GLint, GLenum, GLboolean, GLsizei, in void*) glVertexAttribPointer;

    // gl 2.1
    void function(GLint, GLsizei, GLboolean, in GLfloat*) glUniformMatrix2x3fv;
    void function(GLint, GLsizei, GLboolean, in GLfloat*) glUniformMatrix3x2fv;
    void function(GLint, GLsizei, GLboolean, in GLfloat*) glUniformMatrix2x4fv;
    void function(GLint, GLsizei, GLboolean, in GLfloat*) glUniformMatrix4x2fv;
    void function(GLint, GLsizei, GLboolean, in GLfloat*) glUniformMatrix3x4fv;
    void function(GLint, GLsizei, GLboolean, in GLfloat*) glUniformMatrix4x3fv;
}