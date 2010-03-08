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
module derelict.opengl.extfuncs;

private
{
    version(Windows)
    {
        import derelict.util.wintypes;
    }
    import derelict.util.compat;
    import derelict.opengl.gltypes;
    import derelict.opengl.exttypes;
}

version(DerelictGL_ALL)
{
    version = DerelictGL_ARB;
    version = DerelictGL_EXT;
    version = DerelictGL_NV;
    version = DerelictGL_ATI;
    version = DerelictGL_SGIS;
    version = DerelictGL_SGI;
    version = DerelictGL_SGIX;
    version = DerelictGL_HP;
    version = DerelictGL_PGI;
    version = DerelictGL_IBM;
    version = DerelictGL_WIN;
}

extern(System)
{
    mixin(gsharedString!() ~
    "
    version(DerelictGL_ARB)
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
        void function(GLhandleARB, GLuint, in GLcharARB*) glBindAttribLocationARB;
        void function(GLhandleARB, GLuint, GLsizei, GLsizei*, GLint*, GLenum*, GLcharARB*) glGetActiveAttribARB;
        GLint function(GLhandleARB, in GLcharARB* name) glGetAttribLocationARB;

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

    version(DerelictGL_EXT)
    {
        // GL_EXT_blend_color
        void function(GLclampf, GLclampf, GLclampf, GLclampf) glBlendColorEXT;

        // GL_EXT_polygon_offset
        void function(GLfloat, GLfloat) glPolygonOffsetEXT;

        // GL_EXT_texture3D
        void function(GLenum, GLint, GLenum, GLsizei, GLsizei, GLsizei, GLint, GLenum, GLenum, GLvoid*) glTexImage3DEXT;
        void function(GLenum, GLint, GLint, GLint, GLint, GLsizei, GLsizei, GLsizei, GLenum, GLenum, GLvoid*) glTexSubImage3DEXT;

        // GL_EXT_subtexture
        void function(GLenum, GLint, GLint, GLsizei, GLenum, GLenum, in GLvoid*) glTexSubImage1DEXT;
        void function(GLenum, GLint, GLint, GLint, GLsizei, GLsizei, GLenum, GLenum, in GLvoid*) glTexSubImage21DEXT;

        // GL_EXT_copy_texture
        void function(GLenum, GLint, GLenum, GLint, GLint, GLsizei, GLint) glCopyTexImage1DEXT;
        void function(GLenum, GLint, GLenum, GLint, GLint, GLsizei, GLsizei, GLint)glCopyTexImage2DEXT;
        void function(GLenum, GLint, GLint, GLint, GLint, GLsizei) glCopyTexSubImage1DEXT;
        void function(GLenum, GLint, GLint, GLint, GLint, GLint, GLsizei, GLsizei) glCopyTexSubImage2DEXT;
        void function(GLenum, GLint, GLint, GLint, GLint, GLint, GLint, GLsizei, GLsizei) glCopyTexSubImage3DEXT;

        // GL_EXT_histogram
        void function(GLenum, GLboolean, GLenum, GLenum, GLvoid*) glGetHistogramEXT;
        void function(GLenum, GLenum, GLfloat*) glGetHistogramParameterfvEXT;
        void function(GLenum, GLenum, GLint*) glGetHistogramParameterivEXT;
        void function(GLenum, GLboolean, GLenum, GLenum, GLvoid*) glGetMinmaxEXT;
        void function(GLenum, GLenum, GLfloat*) glGetMinmaxParameterfvEXT;
        void function(GLenum, GLsizei, GLenum, GLint*) glGetMinmaxParameterivEXT;
        void function(GLenum, GLsizei, GLenum, GLboolean) glHistogramEXT;
        void function(GLenum, GLenum, GLboolean) glMinmaxEXT;
        void function(GLenum) glResetHistogramEXT;
        void function(GLenum) glResetMinmaxEXT;

        // GL_EXT_convolution
        void function(GLenum, GLenum, GLsizei, GLenum, GLenum, GLvoid*) glConvolutionFilter1DEXT;
        void function(GLenum, GLenum, GLsizei, GLsizei, GLenum, GLenum, GLvoid*) glConvolutionFilter2DEXT;
        void function(GLenum, GLenum, GLfloat) glConvolutionParameterfEXT;
        void function(GLenum, GLenum, GLfloat*) glConvolutionParameterfvEXT;
        void function(GLenum, GLenum, GLint) glConvolutionParameteriEXT;
        void function(GLenum, GLenum, GLint*) glConvolutionParameterivEXT;
        void function(GLenum, GLenum, GLint, GLint, GLsizei) glCopyConvolutionFilter1DEXT;
        void function(GLenum, GLenum, GLint, GLint, GLsizei, GLsizei) glCopyConvolutionFilter2DEXT;
        void function(GLenum, GLenum, GLenum, GLvoid*) glGetConvolutionFilterEXT;
        void function(GLenum, GLenum, GLfloat*) glGetConvolutionParameterfvEXT;
        void function(GLenum, GLenum, GLint*) glGetConvolutionParameterivEXT;
        void function(GLenum, GLenum, GLenum, GLvoid*, GLvoid*, GLvoid*) glGetSeparableFilterEXT;
        void function(GLenum, GLenum, GLsizei, GLsizei, GLenum, GLenum, GLvoid*, GLvoid*) glSeparableFilter2DEXT;

        // GL_EXT_texture_object
        GLboolean function(GLsizei, in GLuint*, GLboolean*) glAreTexturesResidentEXT;
        void function(GLenum, GLuint) glBindTextureEXT;
        void function(GLsizei, in GLuint*) glDeleteTexturesEXT;
        void function(GLsizei, GLuint*) glGenTexturesEXT;
        GLboolean function(GLuint) glIsTextureEXT;
        void function(GLsizei, in GLuint*, in GLclampf*) glPrioritizeTexturesEXT;

        // GL_EXT_vertex_array
        void function(GLint) glArrayElementEXT;
        void function(GLint, GLenum, GLsizei, GLsizei, in GLvoid*) glColorPointerEXT;
        void function(GLenum, GLint, GLsizei) glDrawArraysEXT;
        void function(GLsizei, GLsizei, in GLboolean*) glEdgeFlagPointerEXT;
        void function(GLenum, GLvoid**) glGetPointervEXT;
        void function(GLenum, GLsizei, GLsizei, in GLvoid*) glIndexPointerEXT;
        void function(GLenum, GLsizei, GLsizei, in GLvoid*) glNormalPointerEXT;
        void function(GLint, GLenum, GLsizei, GLsizei, in GLvoid*) glTexCoordPointerEXT;
        void function(GLint, GLenum, GLsizei, GLsizei, in GLvoid*) glVertexPointerEXT;

        // GL_EXT_blend_minmax
        void function(GLenum) glBlendEquationEXT;

        // GL_EXT_point_parameters
        void function(GLenum, GLfloat) glPointParameterfExt;
        void function(GLenum, in GLfloat*) glPointParameterfvExt;

        // GL_EXT_color_subtable
        void function(GLenum, GLsizei, GLsizei, GLenum, GLenum, in GLvoid*) glColorSubTableEXT;
        void function(GLenum, GLsizei, GLint, GLint, GLsizei) glCopyColorSubTableExt;

        // GL_EXT_paletted_texture
        void function(GLenum, GLenum, GLsizei, GLenum, GLenum, in GLvoid *) glColorTableEXT;
        void function(GLenum, GLenum, GLenum, GLvoid *) glGetColorTableEXT;
        void function(GLenum, GLenum, GLint *) glGetColorTableParameterivEXT;
        void function(GLenum, GLenum, GLfloat *) glGetColorTableParameterfvEXT;

        //GL_EXT_index_material
        void function (GLenum, GLenum) glIndexMaterialEXT;

        // GL_EXT_index_func
        void function(GLenum, GLclampf) glIndexFuncEXT;

        // GL_EXT_compiled_vertex_array
        void function(GLint, GLsizei) glLockArraysEXT;
        void function() glUnlockArraysEXT;

        // GL_EXT_cull_vertex
        void function(GLenum, GLdouble*) glCullParameterdvEXT;
        void function(GLenum, GLfloat*) glCullParameterfvEXT;

        // GL_EXT_draw_range_elements
        void function(GLenum, GLuint, GLuint, GLsizei, GLenum, in GLvoid*) glDrawRangeElementsEXT;

        // GL_EXT_light_texture
        void function(GLenum) glApplyTextureEXT;
        void function(GLenum) glTextureLightEXT;
        void function(GLenum, GLenum) glTextureMaterialEXT;
    }

    version(DerelictGL_SGI)
    {
        // GL_SGI_color_table
        void function(GLenum, GLenum, GLsizei, GLenum, GLenum, in GLvoid*) glColorTableSGI;
        void function(GLenum, GLenum, in GLfloat*) glColorTableParameterfvSGI;
        void function(GLenum, GLenum, in GLint*) glColorTableParameterivSGI;
        void function(GLenum, GLenum, GLint, GLint, GLsizei) glCopyColorTableSGI;
        void function(GLenum, GLenum, GLenum, GLvoid*) glGetColorTableSGI;
        void function(GLenum, GLenum, GLfloat*) glGetColorTableParameterfvSGI;
        void function(GLenum, GLenum, GLint*) glGetColorTableParameterivSGI;
    }

    version(DerelictGL_SGIS)
    {
        // GL_SGIS_texture_filter4
        void function(GLenum, GLenum, GLfloat*) glGetTexFilterFuncSGIS;
        void function(GLenum, GLenum, in GLfloat*) glTexFilterFuncSGIS;

        // GL_SGIS_pixel_texture
        void function(GLenum, GLint) glPixelTexGenParameteriSGIS;
        void function(GLenum, in GLint*) glPixelTexGenParameterivSGIS;
        void function(GLenum, GLfloat) glPixelTexGenParameterfSGIS;
        void function(GLenum, in GLfloat*) glPixelTexGenParameterfvSGIS;
        void function(GLenum, GLint*) glGetPixelTexGenParameterivSGIS;
        void function(GLenum, GLfloat*) glGetPixelTexGenParameterfvSGIS;

        // GL_SGIS_texture4D
        void function(GLenum, GLint, GLenum, GLsizei, GLsizei, GLsizei, GLsizei, GLint, GLenum, GLenum, in GLvoid*) glTexImage4DSGIS;
        void function(GLenum, GLint, GLint, GLint, GLint, GLint, GLsizei, GLsizei, GLsizei, GLsizei, GLenum, GLenum, in GLvoid*) glTexSubImage4DSGIS;

        // GL_SGIS_detail_texture
        void function(GLenum, GLsizei, in GLfloat*) glDetailTexFuncSGIS;
        void function(GLenum, GLfloat*) glGetDetailTexFuncSGIS;

        // GL_SGIS_sharpen_texture
        void function(GLenum, GLsizei, in GLfloat*) glSharpenTexFuncSGIS;
        void function(GLenum, GLfloat*) glGetSharpenTexFuncSGIS;

        // GL_SGIS_multisample
        void function(GLclampf, GLboolean) glSampleMaskSGIS;
        void function(GLenum) glSamplePatternSGIS;

        // GL_SGIS_point_parameters
        void function(GLenum, GLfloat) glPointParameterfSGIS;
        void function(GLenum, in GLfloat*) glPointParameterfvSGIS;

        // GL_SGIS_fog_function
        void function(GLsizei, in GLfloat*) glFogFuncSGIS;
        void function(GLfloat*) glGetFogFuncSGIS;
    }

    version(DerelictGL_SGIX)
    {
        // GL_SGIX_pixel_texture
        void function(GLenum) glPixelTexGenSGIX;

        // GL_SGIX_sprite
        void function(GLenum, GLfloat) glSpriteParameterfSGIX;
        void function(GLenum, in GLfloat*) glSpriteParameterfvSGIX;
        void function(GLenum, GLint) glSpriteParameteriSGIX;
        void function(GLenum, in GLint*) glSpriteParameterivSGIX;

        // GL_SGIX_instruments
        GLint function() glGetInstrumentsSGIX;
        void function(GLsizei, GLint*) glInstrumentsBufferSGIX;
        GLint function(GLint*) glPollInstrumentsSGIX;
        void function(GLint) glReadInstrumentsSGIX;
        void function() glStartInstrumentsSGIX;
        void function(GLint) glStopInstrumentsSGIX;

        // GL_SGIX_framezoom
        void function(GLint) glFrameZoomSGIX;

        // GL_SGIX_tag_sample_buffer
        void function() glTagSampleBufferSGIX;

        // GL_SGIX_polynomial_ffd
        void function(GLenum, GLdouble, GLdouble, GLint, GLint, GLdouble, GLdouble, GLint, GLint, GLdouble, GLdouble, GLint, GLint, in GLdouble*) glDeformationMap3dSGIX;
        void function(GLenum, GLfloat, GLfloat, GLint, GLint, GLfloat, GLfloat, GLint, GLint, GLfloat, GLfloat, GLint, GLint, in GLfloat*) glDeformationMap3fSGIX;
        void function(GLbitfield) glDeformSGIX;
        void function(GLbitfield) glLoadIdentityDeformationMapSGIX;

        // GL_SGIX_reference_plane
        void function(in GLdouble*) glReferencePlaneSGIX;

        // GL_SGIX_flush_raster
        void function() glFLushRasterSGIX;
        
        // GL_SGIX_list_priority
        void function(GLuint, GLenum, GLfloat *) glGetListParameterfvSGIX;
        void function(GLuint, GLenum, GLint *) glGetListParameterivSGIX;
        void function(GLuint, GLenum, GLfloat) glListParameterfSGIX;
        void function(GLuint, GLenum, in GLfloat *) glListParameterfvSGIX;
        void function(GLuint, GLenum, GLint) glListParameteriSGIX;
        void function(GLuint, GLenum, in GLint *) glListParameterivSGIX;

         // GL_SGIX_fragment_lighting
        void function(GLenum, GLenum) glFragmentColorMaterialSGIX;
        void function(GLenum, GLenum, GLfloat) glFragmentLightfSGIX;
        void function(GLenum, GLenum, in GLfloat*) glFragmentLightfvSGIX;
        void function(GLenum, GLenum, GLint) glFragmentLightiSGIX;
        void function(GLenum, GLenum, in GLint*) glFragmentLightivSGIX;
        void function(GLenum, GLfloat) glFragmentLightModelfSGIX;
        void function(GLenum, in GLfloat*) glFragmentLightModelfvSGIX;
        void function(GLenum, GLint) glFragmentLightModeliSGIX;
        void function(GLenum, in GLint*) glFragmentLightModelivSGIX;
        void function(GLenum, GLenum, GLfloat) glFragmentMaterialfSGIX;
        void function(GLenum, GLenum, in GLfloat*) glFragmentMaterialfvSGIX;
        void function(GLenum, GLenum, GLint) glFragmentMaterialiSGIX;
        void function(GLenum, GLenum, in GLint*) glFragmentMaterialivSGIX;
        void function(GLenum, GLenum, GLfloat*) glGetFragmentLightfvSGIX;
        void function(GLenum, GLenum, GLint*) glGetFragmentLightivSGIX;
        void function(GLenum, GLenum, GLfloat*) glGetFragmentMaterialfvSGIX;
        void function(GLenum, GLenum, GLint*) glGetFragmentMaterialivSGIX;
        void function(GLenum, GLint) glLightEnviSGIX;
    }

    version(DerelictGL_HP)
    {
        // GL_HP_image_transform
        void function(GLenum, GLenum, GLint) glImageTransformParameteriHP;
        void function(GLenum, GLenum, GLfloat) glImageTransformParameterfHP;
        void function(GLenum, GLenum, in GLint *) glImageTransformParameterivHP;
        void function(GLenum, GLenum, in GLfloat *) glImageTransformParameterfvHP;
        void function(GLenum, GLenum, GLint *) glGetImageTransformParameterivHP;
        void function(GLenum, GLenum, GLfloat *) glGetImageTransformParameterfvHP;
    }

    version(DerelictGL_PGI)
    {
        // GL_PGI_misc_hints
        void function(GLenum, GLint) glHintPGI;
    }

    version(Windows)
    {
        // WGL_ARB_buffer_region
        HANDLE function(HDC, int, UINT) wglCreateBufferRegionARB;
        void function(HANDLE) wglDeleteBufferRegionARB;
        BOOL function(HANDLE, int, int, int, int) wglSaveBufferRegionARB;
        BOOL function(HANDLE, int, int, int, int, int, int) wglRestoreBufferRegionARB;

        // WGL_ARB_extensions_string
        CCPTR function(HDC) wglGetExtensionsStringARB;

        // WGL_ARB_pixel_format
        BOOL function(HDC, int, int, UINT, in int*, int*) wglGetPixelFormatAttribivARB;
        BOOL function(HDC, int, int, UINT, in int*, float*) wglGetPixelFormatAttribfvARB;
        BOOL function(HDC, in int*, in float*, UINT, int*, UINT) wglChoosePixelFormatARB;

        // WGL_ARB_make_current_read
        BOOL function(HDC, HDC, HGLRC) wglMakeContextCurrentARB;
        HDC function() wglGetCurrentReadDCARB;

        // WGL_ARB_pbuffer
        HPBUFFERARB function(HDC, int, int, int, in int*) wglCreatePbufferARB;
        HDC function(HPBUFFERARB) wglGetPbufferDCARB;
        int function(HPBUFFERARB, HDC) wglReleasePbufferDCARB;
        BOOL function(HPBUFFERARB) wglDestroyPbufferARB;
        BOOL function(HPBUFFERARB, int, int*) wglQueryPbufferARB;

        // WGL_ARB_render_texture
        BOOL function(HPBUFFERARB, int) wglBindTexImageARB;
        BOOL function(HPBUFFERARB, int) wglReleaseTexImageARB;
        BOOL function(HPBUFFERARB, in int*) wglSetPbufferAttribARB;

        // WGL_ARB_create_context
        HGLRC function(HDC, HGLRC, in int*) wglCreateContextAttribsARB;
    }
    ");
}