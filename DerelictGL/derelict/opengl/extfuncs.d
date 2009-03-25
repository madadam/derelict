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
module derelict.opengl.extfuncs;

private
{
    import derelict.opengl.gltypes;
    import derelict.opengl.exttypes;
}

extern(System)
{
    // GL_ARB_multitexture
    void function(GLenum) glActiveTextureARB;
    void function(GLenum) glClientActiveTextureARB;
    void function(GLenum, GLdouble) glMultiTexCoord1dARB;
    void function(GLenum, in GLdouble*) glMultiTexCoord1dvARB;
    void function(GLenum, GLfloat) glMultiTexCoord1fARB;
    void function(GLenum, in GLfloat*) glMultiTexCoord1fvARB;
    void function(GLenum, GLint) glMultiTexCoord1iARB;
    void function(GLenum, in GLint*) glMultiTexCoord1ivARB;
    void function(GLenum, GLshort) glMultiTexCoord1sARB;
    void function(GLenum, in GLshort*) glMultiTexCoord1svARB;
    void function(GLenum, GLdouble, GLdouble) glMultiTexCoord2dARB;
    void function(GLenum, in GLdouble*) glMultiTexCoord2dvARB;
    void function(GLenum, GLfloat, GLfloat) glMultiTexCoord2fARB;
    void function(GLenum, in GLfloat*) glMultiTexCoord2fvARB;
    void function(GLenum, GLint, GLint) glMultiTexCoord2iARB;
    void function(GLenum, in GLint*) glMultiTexCoord2ivARB;
    void function(GLenum, GLshort, GLshort) glMultiTexCoord2sARB;
    void function(GLenum, in GLshort*) glMultiTexCoord2svARB;
    void function(GLenum, GLdouble, GLdouble, GLdouble) glMultiTexCoord3dARB;
    void function(GLenum, in GLdouble*) glMultiTexCoord3dvARB;
    void function(GLenum, GLfloat, GLfloat, GLfloat) glMultiTexCoord3fARB;
    void function(GLenum, in GLfloat*) glMultiTexCoord3fvARB;
    void function(GLenum, GLint, GLint, GLint) glMultiTexCoord3iARB;
    void function(GLenum, in GLint*) glMultiTexCoord3ivARB;
    void function(GLenum, GLshort, GLshort, GLshort) glMultiTexCoord3sARB;
    void function(GLenum, in GLshort*) glMultiTexCoord3svARB;
    void function(GLenum, GLdouble, GLdouble, GLdouble, GLdouble) glMultiTexCoord4dARB;
    void function(GLenum, in GLdouble*) glMultiTexCoord4dvARB;
    void function(GLenum, GLfloat, GLfloat, GLfloat, GLfloat) glMultiTexCoord4fARB;
    void function(GLenum, in GLfloat*) glMultiTexCoord4fvARB;
    void function(GLenum, GLint, GLint, GLint, GLint) glMultiTexCoord4iARB;
    void function(GLenum, in GLint*) glMultiTexCoord4ivARB;
    void function(GLenum, GLshort, GLshort, GLshort, GLshort) glMultiTexCoord4sARB;
    void function(GLenum, in GLshort*) glMultiTexCoord4svARB;

    // GL_ARB_transpose_matrix
    void function(GLfloat*) glLoadTransposeMatrixfARB;
    void function(GLdouble*) glLoadTransposeMatrixdARB;
    void function(GLfloat*) glMultTransposeMatrixfARB;
    void function(GLdouble*) glMultTransposeMatrixdARB;

    // GL_ARB_multisample
    void function(GLclampf, GLboolean) glSampleCoverageARB;

    // GL_ARB_texture_compression
    void function(GLenum, GLint, GLenum, GLsizei, GLsizei, GLsizei, GLint, GLsizei, in GLvoid*) glCompressedTexImage3DARB;
    void function(GLenum, GLint, GLenum, GLsizei, GLsizei, GLint, GLsizei, in GLvoid*) glCompressedTexImage2DARB;
    void function(GLenum, GLint, GLenum, GLsizei, GLint, GLsizei, in GLvoid*) glCompressedTexImage1DARB;
    void function(GLenum, GLint, GLint, GLint, GLint, GLsizei, GLsizei, GLsizei, GLenum, GLsizei, in GLvoid*) glCompressedTexSubImage3DARB;
    void function(GLenum, GLint, GLint, GLint, GLsizei, GLsizei, GLenum, GLsizei, in GLvoid*) glCompressedTexSubImage2DARB;
    void function(GLenum, GLint, GLint, GLsizei, GLenum, GLsizei, in GLvoid*) glCompressedTexSubImage1DARB;
    void function(GLenum, GLint, GLvoid*) glGetCompressedTexImageARB;

    // GL_ARB_point_parameters
    void function(GLenum, GLfloat) glPointParameterfARB;
    void function(GLenum, GLfloat*) glPointParameterfvARB;

    // GL_ARB_vertex_blend
    void function(GLint, GLbyte*) glWeightbvARB;
    void function(GLint, GLshort*) glWeightsvARB;
    void function(GLint, GLint*) glWeightivARB;
    void function(GLint, GLfloat*) glWeightfvARB;
    void function(GLint, GLdouble*) glWeightdvARB;
    void function(GLint, GLubyte*) glWeightubvARB;
    void function(GLint, GLushort*) glWeightusvARB;
    void function(GLint, GLuint*) glWeightuivARB;
    void function(GLint, GLenum, GLsizei, GLvoid*) glWeightPointerARB;
    void function(GLint) glVertexBlendARB;

    // GL_ARB_matrix_palette
    void function(GLint) glCurrentPaletteMatrixARB;
    void function(GLint, GLubyte*) glMatrixIndexubvARB;
    void function(GLint, GLushort*) glMatrixIndexusvARB;
    void function(GLint, GLuint*) glMatrixIndexuivARB;
    void function(GLint, GLenum, GLsizei, GLvoid*) glMatrixIndexPointerARB;

    // GL_ARB_window_pos
    void function(GLdouble, GLdouble) glWindowPos2dARB;
    void function(in GLdouble*) glWindowPos2dvARB;
    void function(GLfloat, GLfloat) glWindowPos2fARB;
    void function(in GLfloat*) glWindowPos2fvARB;
    void function(GLint, GLint) glWindowPos2iARB;
    void function(in GLint*) glWindowPos2ivARB;
    void function(GLshort, GLshort) glWindowPos2sARB;
    void function(in GLshort*) glWindowPos2svARB;
    void function(GLdouble, GLdouble, GLdouble) glWindowPos3dARB;
    void function(in GLdouble*) glWindowPos3dvARB;
    void function(GLfloat, GLfloat, GLfloat) glWindowPos3fARB;
    void function(in GLfloat*) glWindowPos3fvARB;
    void function(GLint, GLint, GLint) glWindowPos3iARB;
    void function(in GLint*) glWindowPos3ivARB;
    void function(GLshort, GLshort, GLshort) glWindowPos3sARB;
    void function(in GLshort*) glWindowPos3svARB;

    // GL_ARB_vertex_program
    void function(GLuint, GLdouble) glVertexAttrib1dARB;
    void function(GLuint, in GLdouble*) glVertexAttrib1dvARB;
    void function(GLuint, GLfloat) glVertexAttrib1fARB;
    void function(GLuint, in GLfloat*) glVertexAttrib1fvARB;
    void function(GLuint, GLshort) glVertexAttrib1sARB;
    void function(GLuint, in GLshort*) glVertexAttrib1svARB;
    void function(GLuint, GLdouble, GLdouble) glVertexAttrib2dARB;
    void function(GLuint, in GLdouble*) glVertexAttrib2dvARB;
    void function(GLuint, GLfloat, GLfloat) glVertexAttrib2fARB;
    void function(GLuint, in GLfloat*) glVertexAttrib2fvARB;
    void function(GLuint, GLshort, GLshort) glVertexAttrib2sARB;
    void function(GLuint, in GLshort*) glVertexAttrib2svARB;
    void function(GLuint, GLdouble, GLdouble, GLdouble) glVertexAttrib3dARB;
    void function(GLuint, in GLdouble*) glVertexAttrib3dvARB;
    void function(GLuint, GLfloat, GLfloat, GLfloat) glVertexAttrib3fARB;
    void function(GLuint, in GLfloat*) glVertexAttrib3fvARB;
    void function(GLuint, GLshort, GLshort, GLshort) glVertexAttrib3sARB;
    void function(GLuint, in GLshort*) glVertexAttrib3svARB;
    void function(GLuint, in GLbyte*) glVertexAttrib4NbvARB;
    void function(GLuint, in GLint*) glVertexAttrib4NivARB;
    void function(GLuint, in GLshort*) glVertexAttrib4NsvARB;
    void function(GLuint, GLubyte, GLubyte, GLubyte, GLubyte) glVertexAttrib4NubARB;
    void function(GLuint, in GLubyte*) glVertexAttrib4NubvARB;
    void function(GLuint, in GLuint*) glVertexAttrib4NuivARB;
    void function(GLuint, in GLushort*) glVertexAttrib4NusvARB;
    void function(GLuint, in GLbyte*) glVertexAttrib4bvARB;
    void function(GLuint, GLdouble, GLdouble, GLdouble, GLdouble) glVertexAttrib4dARB;
    void function(GLuint, in GLdouble*) glVertexAttrib4dvARB;
    void function(GLuint, GLfloat, GLfloat, GLfloat, GLfloat) glVertexAttrib4fARB;
    void function(GLuint, in GLfloat*) glVertexAttrib4fvARB;
    void function(GLuint, in GLint*) glVertexAttrib4ivARB;
    void function(GLuint, GLshort, GLshort, GLshort, GLshort) glVertexAttrib4sARB;
    void function(GLuint, in GLshort*) glVertexAttrib4svARB;
    void function(GLuint, in GLubyte*) glVertexAttrib4ubvARB;
    void function(GLuint, in GLuint*) glVertexAttrib4uivARB;
    void function(GLuint, in GLushort*) glVertexAttrib4usvARB;
    void function(GLuint, GLint, GLenum, GLboolean, GLsizei, in GLvoid*) glVertexAttribPointerARB;
    void function(GLuint) glEnableVertexAttribArrayARB;
    void function(GLuint) glDisableVertexAttribArrayARB;
    void function(GLenum, GLenum, GLsizei, in GLvoid*) glProgramStringARB;
    void function(GLenum, GLuint) glBindProgramARB;
    void function(GLsizei, in GLuint*) glDeleteProgramsARB;
    void function(GLsizei, GLuint*) glGenProgramsARB;
    void function(GLenum, GLuint, GLdouble, GLdouble, GLdouble, GLdouble) glProgramEnvParameter4dARB;
    void function(GLenum, GLuint, in GLdouble*) glProgramEnvParameter4dvARB;
    void function(GLenum, GLuint, GLfloat, GLfloat, GLfloat, GLfloat) glProgramEnvParameter4fARB;
    void function(GLenum, GLuint, in GLfloat*) glProgramEnvParameter4fvARB;
    void function(GLenum, GLuint, GLdouble, GLdouble, GLdouble, GLdouble) glProgramLocalParameter4dARB;
    void function(GLenum, GLuint, in GLdouble*) glProgramLocalParameter4dvARB;
    void function(GLenum, GLuint, GLfloat, GLfloat, GLfloat, GLfloat) glProgramLocalParameter4fARB;
    void function(GLenum, GLuint, in GLfloat*) glProgramLocalParameter4fvARB;
    void function(GLenum, GLuint, GLdouble*) glGetProgramEnvParameterdvARB;
    void function(GLenum, GLuint, GLfloat*) glGetProgramEnvParameterfvARB;
    void function(GLenum, GLuint, GLdouble*) glGetProgramLocalParameterdvARB;
    void function(GLenum, GLuint, GLfloat*) glGetProgramLocalParameterfvARB;
    void function(GLenum, GLenum, GLint*) glGetProgramivARB;
    void function(GLenum, GLenum, GLvoid*) glGetProgramStringARB;
    void function(GLuint, GLenum, GLdouble*) glGetVertexAttribdvARB;
    void function(GLuint, GLenum, GLfloat*) glGetVertexAttribfvARB;
    void function(GLuint, GLenum, GLint*) glGetVertexAttribivARB;
    void function(GLuint, GLenum, GLvoid*) glGetVertexAttribPointervARB;
    GLboolean function(GLuint) glIsProgramARB;

    // GL_ARB_vertex_buffer_object
    void function(GLenum, GLuint) glBindBufferARB;
    void function(GLsizei, in GLuint*) glDeleteBuffersARB;
    void function(GLsizei, GLuint*) glGenBuffersARB;
    GLboolean function(GLuint) glIsBufferARB;
    void function(GLenum, GLsizeiptrARB, in GLvoid*, GLenum) glBufferDataARB;
    void function(GLenum, GLintptrARB, GLsizeiptrARB, in GLvoid*) glBufferSubDataARB;
    void function(GLenum, GLintptrARB, GLsizeiptrARB, GLvoid*) glGetBufferSubDataARB;
    GLvoid* function(GLenum, GLenum) glMapBufferARB;
    GLboolean function(GLenum) glUnmapBufferARB;
    void function(GLenum, GLenum, GLint*) glGetBufferParameterivARB;
    void function(GLenum, GLenum, GLvoid*) glGetBufferPointervARB;

    // GL_ARB_occlusion_query
    void function(GLsizei, GLuint*) glGenQueriesARB;
    void function(GLsizei, in GLuint*) glDeleteQueriesARB;
    GLboolean function(GLuint) glIsQueryARB;
    void function(GLenum, GLuint) glBeginQueryARB;
    void function(GLenum) glEndQueryARB;
    void function(GLenum, GLenum, GLint*) glGetQueryivARB;
    void function(GLuint, GLenum, GLint*) glGetQueryObjectivARB;
    void function(GLuint, GLenum, GLuint*) glGetQueryObjectuivARB;

    // GL_ARB_shader_objects
    void function(GLhandleARB) glDeleteObjectARB;
    GLhandleARB function(GLenum) glGetHandleARB;
    void function(GLhandleARB, GLhandleARB) glDetachObjectARB;
    GLhandleARB function(GLenum) glCreateShaderObjectARB;
    void function(GLhandleARB, GLsizei, in GLcharARB**, in GLint*) glShaderSourceARB;
    void function(GLhandleARB) glCompileShaderARB;
    GLhandleARB function() glCreateProgramObjectARB;
    void function(GLhandleARB, GLhandleARB) glAttachObjectARB;
    void function(GLhandleARB) glLinkProgramARB;
    void function(GLhandleARB) glUseProgramObjectARB;
    void function(GLhandleARB) glValidateProgramARB;
    void function(GLint, GLfloat) glUniform1fARB;
    void function(GLint, GLfloat, GLfloat) glUniform2fARB;
    void function(GLint, GLfloat, GLfloat, GLfloat) glUniform3fARB;
    void function(GLint, GLfloat, GLfloat, GLfloat, GLfloat) glUniform4fARB;
    void function(GLint, GLint) glUniform1iARB;
    void function(GLint, GLint, GLint) glUniform2iARB;
    void function(GLint, GLint, GLint, GLint) glUniform3iARB;
    void function(GLint, GLint, GLint, GLint, GLint) glUniform4iARB;
    void function(GLint, GLsizei, in GLfloat*) glUniform1fvARB;
    void function(GLint, GLsizei, in GLfloat*) glUniform2fvARB;
    void function(GLint, GLsizei, in GLfloat*) glUniform3fvARB;
    void function(GLint, GLsizei, in GLfloat*) glUniform4fvARB;
    void function(GLint, GLsizei, in GLint*) glUniform1ivARB;
    void function(GLint, GLsizei, in GLint*) glUniform2ivARB;
    void function(GLint, GLsizei, in GLint*) glUniform3ivARB;
    void function(GLint, GLsizei, in GLint*) glUniform4ivARB;
    void function(GLint, GLsizei, GLboolean, in GLfloat*) glUniformMatrix2fvARB;
    void function(GLint, GLsizei, GLboolean, in GLfloat*) glUniformMatrix3fvARB;
    void function(GLint, GLsizei, GLboolean, in GLfloat*) glUniformMatrix4fvARB;
    void function(GLhandleARB, GLenum, GLfloat*) glGetObjectParameterfvARB;
    void function(GLhandleARB, GLenum, GLint*) glGetObjectParameterivARB;
    void function(GLhandleARB, GLsizei, GLsizei*, GLcharARB*) glGetInfoLogARB;
    void function(GLhandleARB, GLsizei, GLsizei*, GLhandleARB*) glGetAttachedObjectsARB;
    GLint function(GLhandleARB, in GLcharARB*) glGetUniformLocationARB;
    void function(GLhandleARB, GLuint, GLsizei, GLsizei*, GLint*, GLenum*, GLcharARB*) glGetActiveUniformARB;
    void function(GLhandleARB, GLint, GLfloat*) glGetUniformfvARB;
    void function(GLhandleARB, GLint, GLint*) glGetUniformivARB;
    void function(GLhandleARB, GLsizei, GLsizei*, GLcharARB*) glGetShaderSourceARB;

    // GL_ARB_vertex_shader
    void function (GLhandleARB, GLuint, in GLcharARB*) glBindAttribLocationARB;
    void function (GLhandleARB, GLuint, GLsizei, GLsizei*, GLint*, GLenum*, GLcharARB*) glGetActiveAttribARB;
    GLint function (GLhandleARB, in GLcharARB* name) glGetAttribLocationARB;

    // GL_ARB_draw_buffers
    void function(GLsizei, in GLenum*) glDrawBuffersARB;

    // GL_ARB_color_buffer_float
    void function(GLenum, GLenum) glClampColorARB;

    // GL_ARB_draw_instanced
    void function(GLenum, GLint, GLsizei, GLsizei) glDrawArraysInstancedARB;
    void function(GLenum, GLsizei, GLenum, in void*, GLsizei) glDrawElementsInstancedARB;

    // GL_ARB_framebuffer_object
    GLboolean function(GLuint) glIsRenderbuffer;
    void function(GLenum, GLuint) glBindRenderbuffer;
    void function(GLsizei, in GLuint*) glDeleteRenderbuffers;
    void function(GLsizei, GLuint*) glGenRenderbuffers;
    void function(GLenum, GLenum, GLsizei, GLsizei) glRenderbufferStorage;
    void function(GLenum, GLsizei, GLenum, GLsizei, GLsizei) glRenderbufferStorageMultisample;
    void function(GLenum, GLenum, GLint*) glGetRenderbufferParameteriv;
    GLboolean function(GLuint) glIsFramebuffer;
    void function(GLenum, GLuint) glBindFramebuffer;
    void function(GLsizei, in GLuint*) glDeleteFramebuffers;
    void function(GLsizei, GLuint*) glGenFramebuffers;
    GLenum function(GLenum) glCheckFramebufferStatus;
    void function(GLenum, GLenum, GLenum, GLuint, GLint) glFramebufferTexture1D;
    void function(GLenum, GLenum, GLenum, GLuint, GLint) glFramebufferTexture2D;
    void function(GLenum, GLenum, GLenum, GLuint, GLint, GLint) glFramebufferTexture3D;
    void function(GLenum, GLenum, GLuint, GLint, GLint) glFramebufferTextureLayer;
    void function(GLenum, GLenum, GLenum, GLuint) glFramebufferRenderbuffer;
    void function(GLenum, GLenum, GLenum, GLint*) glGetFramebufferAttachmentParameteriv;
    void function(GLint, GLint, GLint, GLint, GLint, GLint, GLint, GLint, GLbitfield, GLenum) glBlitFramebuffer;
    void function(GLenum) glGenerateMipmap;

    // GL_ARB_geometry_shader4
    void function(GLuint, GLenum, GLint) glProgramParameteriARB;
    void function(GLenum, GLenum, GLuint, GLint) glFramebufferTextureARB;
    void function(GLenum, GLenum, GLuint, GLint, GLint) glFramebufferTextureLayerARB;
    void function(GLenum, GLenum, GLuint, GLint, GLenum) glFramebufferTextureFaceARB;

    // GL_ARB_imaging
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
    void function(GLenum, GLenum, GLenum, void*, void*, void*) glGetSeparableFilter;

    // GL_ARB_instanced_arrays
    void function(GLuint, GLuint) glVertexAttribDivisorARB;

    // GL_ARB_map_buffer_range
    void* function(GLenum, GLintptr, GLsizeiptr, GLbitfield) glMapBufferRange;
    void function(GLenum, GLintptr, GLsizeiptr) glFlushMappedBufferRange;

    // GL_ARB_texture_buffer_object
    void function(GLenum, GLenum, GLuint) glTexBufferARB;

    // GL_ARB_vertex_array_object
    void function(GLuint) glBindVertexArray;
    void function(GLsizei, in GLuint*) glDeleteVertexArrays;
    void function(GLsizei, GLuint*) glGenVertexArrays;
    GLboolean function(GLuint) glIsVertexArray;

    // GL_ARB_uniform_buffer_object
    void function(GLuint, GLsizei, in char**, GLuint*) glGetUniformIndicesARB;
    void function(GLuint, GLsizei, in GLuint*, GLenum, GLint*) glGetActiveUniformsARB;
    void function(GLuint, GLuint, GLsizei, GLsizei*, char*) glGetActiveUniformNameARB;
    GLuint function(GLuint, in char*) glGetUinformBlockIndexARB;
    void function(GLuint, GLuint, GLenum, int*) glGetActiveUniformBlockivARB;
    void function(GLuint, GLuint, GLsizei, GLsizei*, char*) glGetActiveUniformBlockNameARB;
    void function(GLenum, GLuint, GLuint, GLintptr, GLsizeiptr) glBindBufferRange;
    void function(GLenum, GLuint, GLuint) glBindBufferBase;
    void function(GLenum, GLuint, GLint*) glGetIntegeri_v;
    void function(GLuint, GLuint, GLuint) glUniformBlockBindingARB;
}