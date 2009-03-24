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
module derelict.opengl.gl;

public
{
    import derelict.opengl.glfuncs;
    import derelict.opengl.gltypes;
}

private
{
    import derelict.util.loader;
    import derelict.util.exception;
    import derelict.util.compat;

    version(Windows)
        import derelict.opengl.wgl;

    version(darwin)
        version = MacOSX;
    version(OSX)
        version = MacOSX;
}

enum GLVersion
{
    None,
    GL11 = 11,
    GL12 = 12,
    GL13 = 13,
    GL14 = 14,
    GL15 = 15,
    GL20 = 20,
    GL21 = 21,
    GL30 = 30,

    HigestSupported = 30
}


class DerelictGLLoader : SharedLibLoader
{
private:
    this()
    {
        super(
            "opengl32.dll",
            "libGL.so.2,libGL.so.1,libGL.so",
            "../Frameworks/OpenGL.framework/OpenGL, /Library/Frameworks/OpenGL.framework/OpenGL, /System/Library/Frameworks/OpenGL.framework/OpenGL"
        );
    }

    GLVersion findMaxAvailable()
    {
        string verstr = toDString(glGetString(GL_VERSION));
        if(verstr.findStr("3.0") == 0)
            return GLVersion.GL30;
        else if(verstr.findStr("2.1") == 0)
            return GLVersion.GL21;
        else if(verstr.findStr("2.0") == 0)
            return GLVersion.GL20;
        else if(verstr.findStr("1.5") == 0)
            return GLVersion.GL15;
        else if(verstr.findStr("1.4") == 0)
            return GLVersion.GL14;
        else if(verstr.findStr("1.3") == 0)
            return GLVersion.GL13;
        else if(verstr.findStr("1.2") == 0)
            return GLVersion.GL12;
        else if(verstr.findStr("1.1") == 0)
            return GLVersion.GL11;

        throw new DerelictException("Unsupported OpenGL version: " ~ verstr);
    }

    GLVersion _maxVersion;

public:
    GLVersion maxVersion()
    {
        return _maxVersion;
    }

    GLVersion loadExtendedVersions(GLVersion minRequired = GLVersion.GL11)
    {
        if(!hasValidContext())
            throw new DerelictException("An OpenGL context must be created and activated before attempting to load extended versions.");

        GLVersion maxAvail = findMaxAvailable();
        if(maxAvail < minRequired)
            throw new DerelictException("Required GL version " ~ versionToString(minRequired) ~ " is not available.");

        bool doThrow = false;

        // gl 1.2
        if(maxAvail >= GLVersion.GL12)
        {
            doThrow = (minRequired >= GLVersion.GL12);

            bindExtendedFunc(cast(void**)&glDrawRangeElements, "glDrawRangeElements", doThrow);
            bindExtendedFunc(cast(void**)&glTexImage3D, "glTexImage3D", doThrow);
            bindExtendedFunc(cast(void**)&glTexSubImage3D, "glTexSubImage3D", doThrow);
            bindExtendedFunc(cast(void**)&glCopyTexSubImage3D, "glCopyTexSubImage3D", doThrow);

            /* GL_ARB_imaging
            bindExtendedFunc(cast(void**)&glColorTable, "glColorTable", doThrow);
            bindExtendedFunc(cast(void**)&glColorSubTable, "glColorSubTable", doThrow);
            bindExtendedFunc(cast(void**)&glColorTableParameteriv, "glColorTableParameteriv", doThrow);
            bindExtendedFunc(cast(void**)&glColorTableParameterfv, "glColorTableParameterfv", doThrow);
            bindExtendedFunc(cast(void**)&glCopyColorSubTable, "glCopyColorSubTable", doThrow);
            bindExtendedFunc(cast(void**)&glCopyColorTable, "glCopyColorTable", doThrow);
            bindExtendedFunc(cast(void**)&glGetColorTable, "glGetColorTable", doThrow);
            bindExtendedFunc(cast(void**)&glGetColorTableParameterfv, "glGetColorTableParameterfv", doThrow);
            bindExtendedFunc(cast(void**)&glGetColorTableParameteriv, "glGetColorTableParameteriv", doThrow);
            bindExtendedFunc(cast(void**)&glHistogram, "glHistogram", doThrow);
            bindExtendedFunc(cast(void**)&glResetHistogram, "glResetHistogram", doThrow);
            bindExtendedFunc(cast(void**)&glGetHistogram, "glGetHistogram", doThrow);
            bindExtendedFunc(cast(void**)&glGetHistogramParameterfv, "glGetHistogramParameterfv", doThrow);
            bindExtendedFunc(cast(void**)&glGetHistogramParameteriv, "glGetHistogramParameteriv", doThrow);
            bindExtendedFunc(cast(void**)&glMinmax, "glMinmax", doThrow);
            bindExtendedFunc(cast(void**)&glResetMinmax, "glResetMinmax", doThrow);
            bindExtendedFunc(cast(void**)&glGetMinmax, "glGetMinmax", doThrow);
            bindExtendedFunc(cast(void**)&glGetMinmaxParameterfv, "glGetMinmaxParameterfv", doThrow);
            bindExtendedFunc(cast(void**)&glGetMinmaxParameteriv, "glGetMinmaxParameteriv", doThrow);
            bindExtendedFunc(cast(void**)&glConvolutionFilter1D, "glConvolutionFilter1D", doThrow);
            bindExtendedFunc(cast(void**)&glConvolutionFilter2D, "glConvolutionFilter2D", doThrow);
            bindExtendedFunc(cast(void**)&glConvolutionParameterf, "glConvolutionParameterf", doThrow);
            bindExtendedFunc(cast(void**)&glConvolutionParameterfv, "glConvolutionParameterfv", doThrow);
            bindExtendedFunc(cast(void**)&glConvolutionParameteri, "glConvolutionParameteri", doThrow);
            bindExtendedFunc(cast(void**)&glConvolutionParameteriv, "glConvolutionParameteriv", doThrow);
            bindExtendedFunc(cast(void**)&glCopyConvolutionFilter1D, "glCopyConvolutionFilter1D", doThrow);
            bindExtendedFunc(cast(void**)&glCopyConvolutionFilter2D, "glCopyConvolutionFilter2D", doThrow);
            bindExtendedFunc(cast(void**)&glGetConvolutionFilter, "glGetConvolutionFilter", doThrow);
            bindExtendedFunc(cast(void**)&glGetConvolutionParameterfv, "glGetConvolutionParameterfv", doThrow);
            bindExtendedFunc(cast(void**)&glGetConvolutionParameteriv, "glGetConvolutionParameteriv", doThrow);
            bindExtendedFunc(cast(void**)&glSeparableFilter2D, "glSeparableFilter2D", doThrow);
            bindExtendedFunc(cast(void**)&glGetSeparableFilter, "glGetSeparableFilter", doThrow);
            */
            _maxVersion = GLVersion.GL12;
        }

        // gl 1.3
        if(maxAvail >= GLVersion.GL13)
        {
            doThrow = (minRequired >= GLVersion.GL13);

            bindExtendedFunc(cast(void**)&glActiveTexture, "glActiveTexture", doThrow);
            bindExtendedFunc(cast(void**)&glClientActiveTexture, "glClientActiveTexture", doThrow);
            bindExtendedFunc(cast(void**)&glMultiTexCoord1d, "glMultiTexCoord1d", doThrow);
            bindExtendedFunc(cast(void**)&glMultiTexCoord1dv, "glMultiTexCoord1dv", doThrow);
            bindExtendedFunc(cast(void**)&glMultiTexCoord1f, "glMultiTexCoord1f", doThrow);
            bindExtendedFunc(cast(void**)&glMultiTexCoord1fv, "glMultiTexCoord1fv", doThrow);
            bindExtendedFunc(cast(void**)&glMultiTexCoord1i, "glMultiTexCoord1i", doThrow);
            bindExtendedFunc(cast(void**)&glMultiTexCoord1iv, "glMultiTexCoord1iv", doThrow);
            bindExtendedFunc(cast(void**)&glMultiTexCoord1s, "glMultiTexCoord1s", doThrow);
            bindExtendedFunc(cast(void**)&glMultiTexCoord1sv, "glMultiTexCoord1sv", doThrow);
            bindExtendedFunc(cast(void**)&glMultiTexCoord2d, "glMultiTexCoord2d", doThrow);
            bindExtendedFunc(cast(void**)&glMultiTexCoord2dv, "glMultiTexCoord2dv", doThrow);
            bindExtendedFunc(cast(void**)&glMultiTexCoord2f, "glMultiTexCoord2f", doThrow);
            bindExtendedFunc(cast(void**)&glMultiTexCoord2fv, "glMultiTexCoord2fv", doThrow);
            bindExtendedFunc(cast(void**)&glMultiTexCoord2i, "glMultiTexCoord2i", doThrow);
            bindExtendedFunc(cast(void**)&glMultiTexCoord2iv, "glMultiTexCoord2iv", doThrow);
            bindExtendedFunc(cast(void**)&glMultiTexCoord2s, "glMultiTexCoord2s", doThrow);
            bindExtendedFunc(cast(void**)&glMultiTexCoord2sv, "glMultiTexCoord2sv", doThrow);
            bindExtendedFunc(cast(void**)&glMultiTexCoord3d, "glMultiTexCoord3d", doThrow);
            bindExtendedFunc(cast(void**)&glMultiTexCoord3dv, "glMultiTexCoord3d", doThrow);
            bindExtendedFunc(cast(void**)&glMultiTexCoord3f, "glMultiTexCoord3f", doThrow);
            bindExtendedFunc(cast(void**)&glMultiTexCoord3fv, "glMultiTexCoord3fv", doThrow);
            bindExtendedFunc(cast(void**)&glMultiTexCoord3i, "glMultiTexCoord3i", doThrow);
            bindExtendedFunc(cast(void**)&glMultiTexCoord3iv, "glMultiTexCoord3iv", doThrow);
            bindExtendedFunc(cast(void**)&glMultiTexCoord3s, "glMultiTexCoord3s", doThrow);
            bindExtendedFunc(cast(void**)&glMultiTexCoord3sv, "glMultiTexCoord3sv", doThrow);
            bindExtendedFunc(cast(void**)&glMultiTexCoord4d, "glMultiTexCoord4d", doThrow);
            bindExtendedFunc(cast(void**)&glMultiTexCoord4dv, "glMultiTexCoord4dv", doThrow);
            bindExtendedFunc(cast(void**)&glMultiTexCoord4f, "glMultiTexCoord4f", doThrow);
            bindExtendedFunc(cast(void**)&glMultiTexCoord4fv, "glMultiTexCoord4fv", doThrow);
            bindExtendedFunc(cast(void**)&glMultiTexCoord4i, "glMultiTexCoord4i", doThrow);
            bindExtendedFunc(cast(void**)&glMultiTexCoord4iv, "glMultiTexCoord4iv", doThrow);
            bindExtendedFunc(cast(void**)&glMultiTexCoord4s, "glMultiTexCoord4s", doThrow);
            bindExtendedFunc(cast(void**)&glMultiTexCoord4sv, "glMultiTexCoord4sv", doThrow);
            bindExtendedFunc(cast(void**)&glLoadTransposeMatrixd, "glLoadTransposeMatrixd", doThrow);
            bindExtendedFunc(cast(void**)&glLoadTransposeMatrixf, "glLoadTransposeMatrixf", doThrow);
            bindExtendedFunc(cast(void**)&glMultTransposeMatrixd, "glMultTransposeMatrixd", doThrow);
            bindExtendedFunc(cast(void**)&glMultTransposeMatrixf, "glMultTransposeMatrixf", doThrow);
            bindExtendedFunc(cast(void**)&glSampleCoverage, "glSampleCoverage", doThrow);
            bindExtendedFunc(cast(void**)&glCompressedTexImage1D, "glCompressedTexImage1D", doThrow);
            bindExtendedFunc(cast(void**)&glCompressedTexImage2D, "glCompressedTexImage2D", doThrow);
            bindExtendedFunc(cast(void**)&glCompressedTexImage3D, "glCompressedTexImage3D", doThrow);
            bindExtendedFunc(cast(void**)&glCompressedTexSubImage1D, "glCompressedTexSubImage1D", doThrow);
            bindExtendedFunc(cast(void**)&glCompressedTexSubImage2D, "glCompressedTexSubImage2D", doThrow);
            bindExtendedFunc(cast(void**)&glCompressedTexSubImage3D, "glCompressedTexSubImage3D", doThrow);
            bindExtendedFunc(cast(void**)&glGetCompressedTexImage, "glGetCompressedTexImage", doThrow);

            _maxVersion = GLVersion.GL13;
        }

        if(maxAvail >= GLVersion.GL14)
        {
            doThrow = (minRequired >= GLVersion.GL14);

            bindExtendedFunc(cast(void**)&glBlendFuncSeparate, "glBlendFuncSeparate", doThrow);
            bindExtendedFunc(cast(void**)&glFogCoordf, "glFogCoordf", doThrow);
            bindExtendedFunc(cast(void**)&glFogCoordfv, "glFogCoordfv", doThrow);
            bindExtendedFunc(cast(void**)&glFogCoordd, "glFogCoordd", doThrow);
            bindExtendedFunc(cast(void**)&glFogCoorddv, "glFogCoorddv", doThrow);
            bindExtendedFunc(cast(void**)&glFogCoordPointer, "glFogCoordPointer", doThrow);
            bindExtendedFunc(cast(void**)&glMultiDrawArrays, "glMultiDrawArrays", doThrow);
            bindExtendedFunc(cast(void**)&glMultiDrawElements, "glMultiDrawElements", doThrow);
            bindExtendedFunc(cast(void**)&glPointParameterf, "glPointParameterf", doThrow);
            bindExtendedFunc(cast(void**)&glPointParameterfv, "glPointParameterfv", doThrow);
            bindExtendedFunc(cast(void**)&glPointParameteri, "glPointParameteri", doThrow);
            bindExtendedFunc(cast(void**)&glPointParameteriv, "glPointParameteriv", doThrow);
            bindExtendedFunc(cast(void**)&glSecondaryColor3b, "glSecondaryColor3b", doThrow);
            bindExtendedFunc(cast(void**)&glSecondaryColor3bv, "glSecondaryColor3bv", doThrow);
            bindExtendedFunc(cast(void**)&glSecondaryColor3d, "glSecondaryColor3d", doThrow);
            bindExtendedFunc(cast(void**)&glSecondaryColor3dv, "glSecondaryColor3dv", doThrow);
            bindExtendedFunc(cast(void**)&glSecondaryColor3f, "glSecondaryColor3f", doThrow);
            bindExtendedFunc(cast(void**)&glSecondaryColor3fv, "glSecondaryColor3fv", doThrow);
            bindExtendedFunc(cast(void**)&glSecondaryColor3i, "glSecondaryColor3i", doThrow);
            bindExtendedFunc(cast(void**)&glSecondaryColor3iv, "glSecondaryColor3iv", doThrow);
            bindExtendedFunc(cast(void**)&glSecondaryColor3s, "glSecondaryColor3s", doThrow);
            bindExtendedFunc(cast(void**)&glSecondaryColor3sv, "glSecondaryColor3sv", doThrow);
            bindExtendedFunc(cast(void**)&glSecondaryColor3ub, "glSecondaryColor3ub", doThrow);
            bindExtendedFunc(cast(void**)&glSecondaryColor3ubv, "glSecondaryColor3ubv", doThrow);
            bindExtendedFunc(cast(void**)&glSecondaryColor3ui, "glSecondaryColor3ui", doThrow);
            bindExtendedFunc(cast(void**)&glSecondaryColor3uiv, "glSecondaryColor3uiv", doThrow);
            bindExtendedFunc(cast(void**)&glSecondaryColor3us, "glSecondaryColor3us", doThrow);
            bindExtendedFunc(cast(void**)&glSecondaryColor3usv, "glSecondaryColor3usv", doThrow);
            bindExtendedFunc(cast(void**)&glSecondaryColorPointer, "glSecondaryColorPointer", doThrow);
            bindExtendedFunc(cast(void**)&glWindowPos2d, "glWindowPos2d", doThrow);
            bindExtendedFunc(cast(void**)&glWindowPos2dv, "glWindowPos2dv", doThrow);
            bindExtendedFunc(cast(void**)&glWindowPos2f, "glWindowPos2f", doThrow);
            bindExtendedFunc(cast(void**)&glWindowPos2fv, "glWindowPos2fv", doThrow);
            bindExtendedFunc(cast(void**)&glWindowPos2i, "glWindowPos2i", doThrow);
            bindExtendedFunc(cast(void**)&glWindowPos2iv, "glWindowPos2iv", doThrow);
            bindExtendedFunc(cast(void**)&glWindowPos2s, "glWindowPos2s", doThrow);
            bindExtendedFunc(cast(void**)&glWindowPos2sv, "glWindowPos2sv", doThrow);
            bindExtendedFunc(cast(void**)&glWindowPos3d, "glWindowPos3d", doThrow);
            bindExtendedFunc(cast(void**)&glWindowPos3dv, "glWindowPos3dv", doThrow);
            bindExtendedFunc(cast(void**)&glWindowPos3f, "glWindowPos3f", doThrow);
            bindExtendedFunc(cast(void**)&glWindowPos3fv, "glWindowPos3fv", doThrow);
            bindExtendedFunc(cast(void**)&glWindowPos3i, "glWindowPos3i", doThrow);
            bindExtendedFunc(cast(void**)&glWindowPos3iv, "glWindowPos3iv", doThrow);
            bindExtendedFunc(cast(void**)&glWindowPos3s, "glWindowPos3s", doThrow);
            bindExtendedFunc(cast(void**)&glWindowPos3sv, "glWindowPos3sv", doThrow);
            bindExtendedFunc(cast(void**)&glBlendEquation, "glBlendEquation", doThrow);
            bindExtendedFunc(cast(void**)&glBlendColor, "glBlendColor", doThrow);

            _maxVersion = GLVersion.GL14;
        }

        if(maxAvail >= GLVersion.GL15)
        {
            doThrow = (minRequired >= GLVersion.GL15);

            bindExtendedFunc(cast(void**)&glGenQueries, "glGenQueries", doThrow);
            bindExtendedFunc(cast(void**)&glDeleteQueries, "glDeleteQueries", doThrow);
            bindExtendedFunc(cast(void**)&glIsQuery, "glIsQuery", doThrow);
            bindExtendedFunc(cast(void**)&glBeginQuery, "glBeginQuery", doThrow);
            bindExtendedFunc(cast(void**)&glEndQuery, "glEndQuery", doThrow);
            bindExtendedFunc(cast(void**)&glGetQueryiv, "glGetQueryiv", doThrow);
            bindExtendedFunc(cast(void**)&glGetQueryObjectiv, "glGetQueryObjectiv", doThrow);
            bindExtendedFunc(cast(void**)&glGetQueryObjectuiv, "glGetQueryObjectuiv", doThrow);
            bindExtendedFunc(cast(void**)&glBindBuffer, "glBindBuffer", doThrow);
            bindExtendedFunc(cast(void**)&glDeleteBuffers, "glDeleteBuffers", doThrow);
            bindExtendedFunc(cast(void**)&glGenBuffers, "glGenBuffers", doThrow);
            bindExtendedFunc(cast(void**)&glIsBuffer, "glIsBuffer", doThrow);
            bindExtendedFunc(cast(void**)&glBufferData, "glBufferData", doThrow);
            bindExtendedFunc(cast(void**)&glBufferSubData, "glBufferSubData", doThrow);
            bindExtendedFunc(cast(void**)&glGetBufferSubData, "glGetBufferSubData", doThrow);
            bindExtendedFunc(cast(void**)&glMapBuffer, "glMapBuffer", doThrow);
            bindExtendedFunc(cast(void**)&glUnmapBuffer, "glUnmapBuffer", doThrow);
            bindExtendedFunc(cast(void**)&glGetBufferParameteriv, "glGetBufferParameteriv", doThrow);
            bindExtendedFunc(cast(void**)&glGetBufferPointerv, "glGetBufferPointerv", doThrow);

            _maxVersion = GLVersion.GL15;
        }

        if(maxAvail >= GLVersion.GL20)
        {
            doThrow = (minRequired >= GLVersion.GL20);

            bindExtendedFunc(cast(void**)&glBlendEquationSeparate, "glBlendEquationSeparate", doThrow);
            bindExtendedFunc(cast(void**)&glDrawBuffers, "glDrawBuffers", doThrow);
            bindExtendedFunc(cast(void**)&glStencilOpSeparate, "glStencilOpSeparate", doThrow);
            bindExtendedFunc(cast(void**)&glStencilFuncSeparate, "glStencilFuncSeparate", doThrow);
            bindExtendedFunc(cast(void**)&glStencilMaskSeparate, "glStencilMaskSeparate", doThrow);
            bindExtendedFunc(cast(void**)&glAttachShader, "glAttachShader", doThrow);
            bindExtendedFunc(cast(void**)&glBindAttribLocation, "glBindAttribLocation", doThrow);
            bindExtendedFunc(cast(void**)&glCompileShader, "glCompileShader", doThrow);
            bindExtendedFunc(cast(void**)&glCreateProgram, "glCreateProgram", doThrow);
            bindExtendedFunc(cast(void**)&glCreateShader, "glCreateShader", doThrow);
            bindExtendedFunc(cast(void**)&glDeleteProgram, "glDeleteProgram", doThrow);
            bindExtendedFunc(cast(void**)&glDeleteShader, "glDeleteShader", doThrow);
            bindExtendedFunc(cast(void**)&glDetachShader, "glDetachShader", doThrow);
            bindExtendedFunc(cast(void**)&glDisableVertexAttribArray, "glDisableVertexAttribArray", doThrow);
            bindExtendedFunc(cast(void**)&glEnableVertexAttribArray, "glEnableVertexAttribArray", doThrow);
            bindExtendedFunc(cast(void**)&glGetActiveAttrib, "glGetActiveAttrib", doThrow);
            bindExtendedFunc(cast(void**)&glGetActiveUniform, "glGetActiveUniform", doThrow);
            bindExtendedFunc(cast(void**)&glGetAttachedShaders, "glGetAttachedShaders", doThrow);
            bindExtendedFunc(cast(void**)&glGetAttribLocation, "glGetAttribLocation", doThrow);
            bindExtendedFunc(cast(void**)&glGetProgramiv, "glGetProgramiv", doThrow);
            bindExtendedFunc(cast(void**)&glGetProgramInfoLog, "glGetProgramInfoLog", doThrow);
            bindExtendedFunc(cast(void**)&glGetShaderiv, "glGetShaderiv", doThrow);
            bindExtendedFunc(cast(void**)&glGetShaderInfoLog, "glGetShaderInfoLog", doThrow);
            bindExtendedFunc(cast(void**)&glGetShaderSource, "glGetShaderSource", doThrow);
            bindExtendedFunc(cast(void**)&glGetUniformLocation, "glGetUniformLocation", doThrow);
            bindExtendedFunc(cast(void**)&glGetUniformfv, "glGetUniformfv", doThrow);
            bindExtendedFunc(cast(void**)&glGetUniformiv, "glGetUniformiv", doThrow);
            bindExtendedFunc(cast(void**)&glGetVertexAttribdv, "glGetVertexAttribdv", doThrow);
            bindExtendedFunc(cast(void**)&glGetVertexAttribfv, "glGetVertexAttribfv", doThrow);
            bindExtendedFunc(cast(void**)&glGetVertexAttribiv, "glGetVertexAttribiv", doThrow);
            bindExtendedFunc(cast(void**)&glGetVertexAttribPointerv, "glGetVertexAttribPointerv", doThrow);
            bindExtendedFunc(cast(void**)&glIsProgram, "glIsProgram", doThrow);
            bindExtendedFunc(cast(void**)&glIsShader, "glIsShader", doThrow);
            bindExtendedFunc(cast(void**)&glLinkProgram, "glLinkProgram", doThrow);
            bindExtendedFunc(cast(void**)&glShaderSource, "glShaderSource", doThrow);
            bindExtendedFunc(cast(void**)&glUseProgram, "glUseProgram", doThrow);
            bindExtendedFunc(cast(void**)&glUniform1f, "glUniform1f", doThrow);
            bindExtendedFunc(cast(void**)&glUniform2f, "glUniform2f", doThrow);
            bindExtendedFunc(cast(void**)&glUniform3f, "glUniform3f", doThrow);
            bindExtendedFunc(cast(void**)&glUniform4f, "glUniform4f", doThrow);
            bindExtendedFunc(cast(void**)&glUniform1i, "glUniform1i", doThrow);
            bindExtendedFunc(cast(void**)&glUniform2i, "glUniform2i", doThrow);
            bindExtendedFunc(cast(void**)&glUniform3i, "glUniform3i", doThrow);
            bindExtendedFunc(cast(void**)&glUniform4i, "glUniform4i", doThrow);
            bindExtendedFunc(cast(void**)&glUniform1fv, "glUniform1fv", doThrow);
            bindExtendedFunc(cast(void**)&glUniform2fv, "glUniform2fv", doThrow);
            bindExtendedFunc(cast(void**)&glUniform3fv, "glUniform3fv", doThrow);
            bindExtendedFunc(cast(void**)&glUniform4fv, "glUniform4fv", doThrow);
            bindExtendedFunc(cast(void**)&glUniform1iv, "glUniform1iv", doThrow);
            bindExtendedFunc(cast(void**)&glUniform2iv, "glUniform2iv", doThrow);
            bindExtendedFunc(cast(void**)&glUniform3iv, "glUniform3iv", doThrow);
            bindExtendedFunc(cast(void**)&glUniform4iv, "glUniform4iv", doThrow);
            bindExtendedFunc(cast(void**)&glUniformMatrix2fv, "glUniformMatrix2fv", doThrow);
            bindExtendedFunc(cast(void**)&glUniformMatrix3fv, "glUniformMatrix3fv", doThrow);
            bindExtendedFunc(cast(void**)&glUniformMatrix4fv, "glUniformMatrix4fv", doThrow);
            bindExtendedFunc(cast(void**)&glValidateProgram, "glValidateProgram", doThrow);
            bindExtendedFunc(cast(void**)&glVertexAttrib1d, "glVertexAttrib1d", doThrow);
            bindExtendedFunc(cast(void**)&glVertexAttrib1dv, "glVertexAttrib1dv", doThrow);
            bindExtendedFunc(cast(void**)&glVertexAttrib1f, "glVertexAttrib1f", doThrow);
            bindExtendedFunc(cast(void**)&glVertexAttrib1fv, "glVertexAttrib1fv", doThrow);
            bindExtendedFunc(cast(void**)&glVertexAttrib1s, "glVertexAttrib1s", doThrow);
            bindExtendedFunc(cast(void**)&glVertexAttrib1sv, "glVertexAttrib1sv", doThrow);
            bindExtendedFunc(cast(void**)&glVertexAttrib2d, "glVertexAttrib2d", doThrow);
            bindExtendedFunc(cast(void**)&glVertexAttrib2dv, "glVertexAttrib2dv", doThrow);
            bindExtendedFunc(cast(void**)&glVertexAttrib2f, "glVertexAttrib2f", doThrow);
            bindExtendedFunc(cast(void**)&glVertexAttrib2fv, "glVertexAttrib2fv", doThrow);
            bindExtendedFunc(cast(void**)&glVertexAttrib2s, "glVertexAttrib2s", doThrow);
            bindExtendedFunc(cast(void**)&glVertexAttrib2sv, "glVertexAttrib2sv", doThrow);
            bindExtendedFunc(cast(void**)&glVertexAttrib3d, "glVertexAttrib3d", doThrow);
            bindExtendedFunc(cast(void**)&glVertexAttrib3dv, "glVertexAttrib3dv", doThrow);
            bindExtendedFunc(cast(void**)&glVertexAttrib3f, "glVertexAttrib3f", doThrow);
            bindExtendedFunc(cast(void**)&glVertexAttrib3fv, "glVertexAttrib3fv", doThrow);
            bindExtendedFunc(cast(void**)&glVertexAttrib3s, "glVertexAttrib3s", doThrow);
            bindExtendedFunc(cast(void**)&glVertexAttrib3sv, "glVertexAttrib3sv", doThrow);
            bindExtendedFunc(cast(void**)&glVertexAttrib4Nbv, "glVertexAttrib4Nbv", doThrow);
            bindExtendedFunc(cast(void**)&glVertexAttrib4Niv, "glVertexAttrib4Niv", doThrow);
            bindExtendedFunc(cast(void**)&glVertexAttrib4Nsv, "glVertexAttrib4Nsv", doThrow);
            bindExtendedFunc(cast(void**)&glVertexAttrib4Nub, "glVertexAttrib4Nub", doThrow);
            bindExtendedFunc(cast(void**)&glVertexAttrib4Nubv, "glVertexAttrib4Nubv", doThrow);
            bindExtendedFunc(cast(void**)&glVertexAttrib4Nuiv, "glVertexAttrib4Nuiv", doThrow);
            bindExtendedFunc(cast(void**)&glVertexAttrib4Nusv, "glVertexAttrib4Nusv", doThrow);
            bindExtendedFunc(cast(void**)&glVertexAttrib4bv, "glVertexAttrib4bv", doThrow);
            bindExtendedFunc(cast(void**)&glVertexAttrib4d, "glVertexAttrib4d", doThrow);
            bindExtendedFunc(cast(void**)&glVertexAttrib4dv, "glVertexAttrib4dv", doThrow);
            bindExtendedFunc(cast(void**)&glVertexAttrib4f, "glVertexAttrib4f", doThrow);
            bindExtendedFunc(cast(void**)&glVertexAttrib4fv, "glVertexAttrib4fv", doThrow);
            bindExtendedFunc(cast(void**)&glVertexAttrib4iv, "glVertexAttrib4iv", doThrow);
            bindExtendedFunc(cast(void**)&glVertexAttrib4s, "glVertexAttrib4s", doThrow);
            bindExtendedFunc(cast(void**)&glVertexAttrib4sv, "glVertexAttrib4sv", doThrow);
            bindExtendedFunc(cast(void**)&glVertexAttrib4ubv, "glVertexAttrib4ubv", doThrow);
            bindExtendedFunc(cast(void**)&glVertexAttrib4uiv, "glVertexAttrib4uiv", doThrow);
            bindExtendedFunc(cast(void**)&glVertexAttrib4usv, "glVertexAttrib4usv", doThrow);
            bindExtendedFunc(cast(void**)&glVertexAttribPointer, "glVertexAttribPointer", doThrow);

            _maxVersion = GLVersion.GL20;
        }

        if(maxAvail >= GLVersion.GL21)
        {
            doThrow = (minRequired >= GLVersion.GL21);

            bindExtendedFunc(cast(void**)&glUniformMatrix2x3fv, "glUniformMatrix2x3fv", doThrow);
            bindExtendedFunc(cast(void**)&glUniformMatrix3x2fv, "glUniformMatrix3x2fv", doThrow);
            bindExtendedFunc(cast(void**)&glUniformMatrix2x4fv, "glUniformMatrix2x4fv", doThrow);
            bindExtendedFunc(cast(void**)&glUniformMatrix4x2fv, "glUniformMatrix4x2fv", doThrow);
            bindExtendedFunc(cast(void**)&glUniformMatrix3x4fv, "glUniformMatrix3x4fv", doThrow);
            bindExtendedFunc(cast(void**)&glUniformMatrix4x3fv, "glUniformMatrix4x3fv", doThrow);

            _maxVersion = GLVersion.GL21;
        }

        return _maxVersion;
    }

    string versionToString(GLVersion ver)
    {
        switch(ver)
        {
            case GLVersion.GL30:
                return "OpenGL Version 3.0";
            case GLVersion.GL21:
                return "OpenGL Version 3.0";
            case GLVersion.GL20:
                return "OpenGL Version 3.0";
            case GLVersion.GL15:
                return "OpenGL Version 3.0";
            case GLVersion.GL14:
                return "OpenGL Version 3.0";
            case GLVersion.GL13:
                return "OpenGL Version 3.0";
            case GLVersion.GL12:
                return "OpenGL Version 3.0";
            case GLVersion.GL11:
                return "OpenGL Version 3.0";
            case GLVersion.None:
                return "OpenGL Version None";
            default:
                break;
        }
        return "Uknown OpenGL Version";
    }

    bool hasValidContext()
    {
        version(Windows)
        {
            if(wglGetCurrentContext() is null)
                return false;
        }
        else version(UsingGLX)
        {
            if(glXGetCurrentContext() is null)
                return false;
        }
        else version(MacOSX)
        {
            if(CGLGetCurrentContext() is null)
                return false;
        }
        else
        {
            assert(0, "DerelictGLLoader.hasValidContext is unimplemented for this platform");
        }

        return true;
    }

protected:
    override void loadSymbols()
    {
        // gl 1.0
        bindFunc(cast(void**)&glClearIndex, "glClearIndex");
        bindFunc(cast(void**)&glClearColor, "glClearColor");
        bindFunc(cast(void**)&glClear, "glClear");
        bindFunc(cast(void**)&glIndexMask, "glIndexMask");
        bindFunc(cast(void**)&glColorMask, "glColorMask");
        bindFunc(cast(void**)&glAlphaFunc, "glAlphaFunc");
        bindFunc(cast(void**)&glBlendFunc, "glBlendFunc");
        bindFunc(cast(void**)&glLogicOp, "glLogicOp");
        bindFunc(cast(void**)&glCullFace, "glCullFace");
        bindFunc(cast(void**)&glFrontFace, "glFrontFace");
        bindFunc(cast(void**)&glPointSize, "glPointSize");
        bindFunc(cast(void**)&glLineWidth, "glLineWidth");
        bindFunc(cast(void**)&glLineStipple, "glLineStipple");
        bindFunc(cast(void**)&glPolygonMode, "glPolygonMode");
        bindFunc(cast(void**)&glPolygonOffset, "glPolygonOffset");
        bindFunc(cast(void**)&glPolygonStipple, "glPolygonStipple");
        bindFunc(cast(void**)&glGetPolygonStipple, "glGetPolygonStipple");
        bindFunc(cast(void**)&glEdgeFlag, "glEdgeFlag");
        bindFunc(cast(void**)&glEdgeFlagv, "glEdgeFlagv");
        bindFunc(cast(void**)&glScissor, "glScissor");
        bindFunc(cast(void**)&glClipPlane, "glClipPlane");
        bindFunc(cast(void**)&glGetClipPlane, "glGetClipPlane");
        bindFunc(cast(void**)&glDrawBuffer, "glDrawBuffer");
        bindFunc(cast(void**)&glReadBuffer, "glReadBuffer");
        bindFunc(cast(void**)&glEnable, "glEnable");
        bindFunc(cast(void**)&glDisable, "glDisable");
        bindFunc(cast(void**)&glIsEnabled, "glIsEnabled");
        bindFunc(cast(void**)&glEnableClientState, "glEnableClientState");
        bindFunc(cast(void**)&glDisableClientState, "glDisableClientState");
        bindFunc(cast(void**)&glGetBooleanv, "glGetBooleanv");
        bindFunc(cast(void**)&glGetDoublev, "glGetDoublev");
        bindFunc(cast(void**)&glGetFloatv, "glGetFloatv");
        bindFunc(cast(void**)&glGetIntegerv, "glGetIntegerv");
        bindFunc(cast(void**)&glPushAttrib, "glPushAttrib");
        bindFunc(cast(void**)&glPopAttrib, "glPopAttrib");
        bindFunc(cast(void**)&glPushClientAttrib, "glPushClientAttrib");
        bindFunc(cast(void**)&glPopClientAttrib, "glPopClientAttrib");
        bindFunc(cast(void**)&glRenderMode, "glRenderMode");
        bindFunc(cast(void**)&glGetError, "glGetError");
        bindFunc(cast(void**)&glGetString, "glGetString");
        bindFunc(cast(void**)&glFinish, "glFinish");
        bindFunc(cast(void**)&glFlush, "glFlush");
        bindFunc(cast(void**)&glHint, "glHint");
        bindFunc(cast(void**)&glClearDepth, "glClearDepth");
        bindFunc(cast(void**)&glDepthFunc, "glDepthFunc");
        bindFunc(cast(void**)&glDepthMask, "glDepthMask");
        bindFunc(cast(void**)&glDepthRange, "glDepthRange");
        bindFunc(cast(void**)&glClearAccum, "glClearAccum");
        bindFunc(cast(void**)&glAccum, "glAccum");
        bindFunc(cast(void**)&glMatrixMode, "glMatrixMode");
        bindFunc(cast(void**)&glOrtho, "glOrtho");
        bindFunc(cast(void**)&glFrustum, "glFrustum");
        bindFunc(cast(void**)&glViewport, "glViewport");
        bindFunc(cast(void**)&glPushMatrix, "glPushMatrix");
        bindFunc(cast(void**)&glPopMatrix, "glPopMatrix");
        bindFunc(cast(void**)&glLoadIdentity, "glLoadIdentity");
        bindFunc(cast(void**)&glLoadMatrixd, "glLoadMatrixd");
        bindFunc(cast(void**)&glLoadMatrixf, "glLoadMatrixf");
        bindFunc(cast(void**)&glMultMatrixd, "glMultMatrixd");
        bindFunc(cast(void**)&glMultMatrixf, "glMultMatrixf");
        bindFunc(cast(void**)&glRotated, "glRotated");
        bindFunc(cast(void**)&glRotatef, "glRotatef");
        bindFunc(cast(void**)&glScaled, "glScaled");
        bindFunc(cast(void**)&glScalef, "glScalef");
        bindFunc(cast(void**)&glTranslated, "glTranslated");
        bindFunc(cast(void**)&glTranslatef, "glTranslatef");
        bindFunc(cast(void**)&glIsList, "glIsList");
        bindFunc(cast(void**)&glDeleteLists, "glDeleteLists");
        bindFunc(cast(void**)&glGenLists, "glGenLists");
        bindFunc(cast(void**)&glNewList, "glNewList");
        bindFunc(cast(void**)&glEndList, "glEndList");
        bindFunc(cast(void**)&glCallList, "glCallList");
        bindFunc(cast(void**)&glCallLists, "glCallLists");
        bindFunc(cast(void**)&glListBase, "glListBase");
        bindFunc(cast(void**)&glBegin, "glBegin");
        bindFunc(cast(void**)&glEnd, "glEnd");
        bindFunc(cast(void**)&glVertex2d, "glVertex2d");
        bindFunc(cast(void**)&glVertex2f, "glVertex2f");
        bindFunc(cast(void**)&glVertex2i, "glVertex2i");
        bindFunc(cast(void**)&glVertex2s, "glVertex2s");
        bindFunc(cast(void**)&glVertex3d, "glVertex3d");
        bindFunc(cast(void**)&glVertex3f, "glVertex3f");
        bindFunc(cast(void**)&glVertex3i, "glVertex3i");
        bindFunc(cast(void**)&glVertex3s, "glVertex3s");
        bindFunc(cast(void**)&glVertex4d, "glVertex4d");
        bindFunc(cast(void**)&glVertex4f, "glVertex4f");
        bindFunc(cast(void**)&glVertex4i, "glVertex4i");
        bindFunc(cast(void**)&glVertex4s, "glVertex4s");
        bindFunc(cast(void**)&glVertex2dv, "glVertex2dv");
        bindFunc(cast(void**)&glVertex2fv, "glVertex2fv");
        bindFunc(cast(void**)&glVertex2iv, "glVertex2iv");
        bindFunc(cast(void**)&glVertex2sv, "glVertex2sv");
        bindFunc(cast(void**)&glVertex3dv, "glVertex3dv");
        bindFunc(cast(void**)&glVertex3fv, "glVertex3fv");
        bindFunc(cast(void**)&glVertex3iv, "glVertex3iv");
        bindFunc(cast(void**)&glVertex3sv, "glVertex3sv");
        bindFunc(cast(void**)&glVertex4dv, "glVertex4dv");
        bindFunc(cast(void**)&glVertex4fv, "glVertex4fv");
        bindFunc(cast(void**)&glVertex4iv, "glVertex4iv");
        bindFunc(cast(void**)&glVertex4sv, "glVertex4sv");
        bindFunc(cast(void**)&glNormal3b, "glNormal3b");
        bindFunc(cast(void**)&glNormal3d, "glNormal3d");
        bindFunc(cast(void**)&glNormal3f, "glNormal3f");
        bindFunc(cast(void**)&glNormal3i, "glNormal3i");
        bindFunc(cast(void**)&glNormal3s, "glNormal3s");
        bindFunc(cast(void**)&glNormal3bv, "glNormal3bv");
        bindFunc(cast(void**)&glNormal3dv, "glNormal3dv");
        bindFunc(cast(void**)&glNormal3fv, "glNormal3fv");
        bindFunc(cast(void**)&glNormal3iv, "glNormal3iv");
        bindFunc(cast(void**)&glNormal3sv, "glNormal3sv");
        bindFunc(cast(void**)&glIndexd, "glIndexd");
        bindFunc(cast(void**)&glIndexf, "glIndexf");
        bindFunc(cast(void**)&glIndexi, "glIndexi");
        bindFunc(cast(void**)&glIndexs, "glIndexs");
        bindFunc(cast(void**)&glIndexub, "glIndexub");
        bindFunc(cast(void**)&glIndexdv, "glIndexdv");
        bindFunc(cast(void**)&glIndexfv, "glIndexfv");
        bindFunc(cast(void**)&glIndexiv, "glIndexiv");
        bindFunc(cast(void**)&glIndexsv, "glIndexsv");
        bindFunc(cast(void**)&glIndexubv, "glIndexubv");
        bindFunc(cast(void**)&glColor3b, "glColor3b");
        bindFunc(cast(void**)&glColor3d, "glColor3d");
        bindFunc(cast(void**)&glColor3f, "glColor3f");
        bindFunc(cast(void**)&glColor3i, "glColor3i");
        bindFunc(cast(void**)&glColor3s, "glColor3s");
        bindFunc(cast(void**)&glColor3ub, "glColor3ub");
        bindFunc(cast(void**)&glColor3ui, "glColor3ui");
        bindFunc(cast(void**)&glColor3us, "glColor3us");
        bindFunc(cast(void**)&glColor4b, "glColor4b");
        bindFunc(cast(void**)&glColor4d, "glColor4d");
        bindFunc(cast(void**)&glColor4f, "glColor4f");
        bindFunc(cast(void**)&glColor4i, "glColor4i");
        bindFunc(cast(void**)&glColor4s, "glColor4s");
        bindFunc(cast(void**)&glColor4ub, "glColor4ub");
        bindFunc(cast(void**)&glColor4ui, "glColor4ui");
        bindFunc(cast(void**)&glColor4us, "glColor4us");
        bindFunc(cast(void**)&glColor3bv, "glColor3bv");
        bindFunc(cast(void**)&glColor3dv, "glColor3dv");
        bindFunc(cast(void**)&glColor3fv, "glColor3fv");
        bindFunc(cast(void**)&glColor3iv, "glColor3iv");
        bindFunc(cast(void**)&glColor3sv, "glColor3sv");
        bindFunc(cast(void**)&glColor3ubv, "glColor3ubv");
        bindFunc(cast(void**)&glColor3uiv, "glColor3uiv");
        bindFunc(cast(void**)&glColor3usv, "glColor3usv");
        bindFunc(cast(void**)&glColor4bv, "glColor4bv");
        bindFunc(cast(void**)&glColor4dv, "glColor4dv");
        bindFunc(cast(void**)&glColor4fv, "glColor4fv");
        bindFunc(cast(void**)&glColor4iv, "glColor4iv");
        bindFunc(cast(void**)&glColor4sv, "glColor4sv");
        bindFunc(cast(void**)&glColor4ubv, "glColor4ubv");
        bindFunc(cast(void**)&glColor4uiv, "glColor4uiv");
        bindFunc(cast(void**)&glColor4usv, "glColor4usv");
        bindFunc(cast(void**)&glTexCoord1d, "glTexCoord1d");
        bindFunc(cast(void**)&glTexCoord1f, "glTexCoord1f");
        bindFunc(cast(void**)&glTexCoord1i, "glTexCoord1i");
        bindFunc(cast(void**)&glTexCoord1s, "glTexCoord1s");
        bindFunc(cast(void**)&glTexCoord2d, "glTexCoord2d");
        bindFunc(cast(void**)&glTexCoord2f, "glTexCoord2f");
        bindFunc(cast(void**)&glTexCoord2i, "glTexCoord2i");
        bindFunc(cast(void**)&glTexCoord2s, "glTexCoord2s");
        bindFunc(cast(void**)&glTexCoord3d, "glTexCoord3d");
        bindFunc(cast(void**)&glTexCoord3f, "glTexCoord3f");
        bindFunc(cast(void**)&glTexCoord3i, "glTexCoord3i");
        bindFunc(cast(void**)&glTexCoord3s, "glTexCoord3s");
        bindFunc(cast(void**)&glTexCoord4d, "glTexCoord4d");
        bindFunc(cast(void**)&glTexCoord4f, "glTexCoord4f");
        bindFunc(cast(void**)&glTexCoord4i, "glTexCoord4i");
        bindFunc(cast(void**)&glTexCoord4s, "glTexCoord4s");
        bindFunc(cast(void**)&glTexCoord1dv, "glTexCoord1dv");
        bindFunc(cast(void**)&glTexCoord1fv, "glTexCoord1fv");
        bindFunc(cast(void**)&glTexCoord1iv, "glTexCoord1iv");
        bindFunc(cast(void**)&glTexCoord1sv, "glTexCoord1sv");
        bindFunc(cast(void**)&glTexCoord2dv, "glTexCoord2dv");
        bindFunc(cast(void**)&glTexCoord2fv, "glTexCoord2fv");
        bindFunc(cast(void**)&glTexCoord2iv, "glTexCoord2iv");
        bindFunc(cast(void**)&glTexCoord2sv, "glTexCoord2sv");
        bindFunc(cast(void**)&glTexCoord3dv, "glTexCoord3dv");
        bindFunc(cast(void**)&glTexCoord3fv, "glTexCoord3fv");
        bindFunc(cast(void**)&glTexCoord3iv, "glTexCoord3iv");
        bindFunc(cast(void**)&glTexCoord3sv, "glTexCoord3sv");
        bindFunc(cast(void**)&glTexCoord4dv, "glTexCoord4dv");
        bindFunc(cast(void**)&glTexCoord4fv, "glTexCoord4fv");
        bindFunc(cast(void**)&glTexCoord4iv, "glTexCoord4iv");
        bindFunc(cast(void**)&glTexCoord4sv, "glTexCoord4sv");
        bindFunc(cast(void**)&glRasterPos2d, "glRasterPos2d");
        bindFunc(cast(void**)&glRasterPos2f, "glRasterPos2f");
        bindFunc(cast(void**)&glRasterPos2i, "glRasterPos2i");
        bindFunc(cast(void**)&glRasterPos2s, "glRasterPos2s");
        bindFunc(cast(void**)&glRasterPos3d, "glRasterPos3d");
        bindFunc(cast(void**)&glRasterPos3f, "glRasterPos3f");
        bindFunc(cast(void**)&glRasterPos3i, "glRasterPos3i");
        bindFunc(cast(void**)&glRasterPos3s, "glRasterPos3s");
        bindFunc(cast(void**)&glRasterPos4d, "glRasterPos4d");
        bindFunc(cast(void**)&glRasterPos4f, "glRasterPos4f");
        bindFunc(cast(void**)&glRasterPos4i, "glRasterPos4i");
        bindFunc(cast(void**)&glRasterPos4s, "glRasterPos4s");
        bindFunc(cast(void**)&glRasterPos2dv, "glRasterPos2dv");
        bindFunc(cast(void**)&glRasterPos2fv, "glRasterPos2fv");
        bindFunc(cast(void**)&glRasterPos2iv, "glRasterPos2iv");
        bindFunc(cast(void**)&glRasterPos2sv, "glRasterPos2sv");
        bindFunc(cast(void**)&glRasterPos3dv, "glRasterPos3dv");
        bindFunc(cast(void**)&glRasterPos3fv, "glRasterPos3fv");
        bindFunc(cast(void**)&glRasterPos3iv, "glRasterPos3iv");
        bindFunc(cast(void**)&glRasterPos3sv, "glRasterPos3sv");
        bindFunc(cast(void**)&glRasterPos4dv, "glRasterPos4dv");
        bindFunc(cast(void**)&glRasterPos4fv, "glRasterPos4fv");
        bindFunc(cast(void**)&glRasterPos4iv, "glRasterPos4iv");
        bindFunc(cast(void**)&glRasterPos4sv, "glRasterPos4sv");
        bindFunc(cast(void**)&glRectd, "glRectd");
        bindFunc(cast(void**)&glRectf, "glRectf");
        bindFunc(cast(void**)&glRecti, "glRecti");
        bindFunc(cast(void**)&glRects, "glRects");
        bindFunc(cast(void**)&glRectdv, "glRectdv");
        bindFunc(cast(void**)&glRectfv, "glRectfv");
        bindFunc(cast(void**)&glRectiv, "glRectiv");
        bindFunc(cast(void**)&glRectsv, "glRectsv");
        bindFunc(cast(void**)&glShadeModel, "glShadeModel");
        bindFunc(cast(void**)&glLightf, "glLightf");
        bindFunc(cast(void**)&glLighti, "glLighti");
        bindFunc(cast(void**)&glLightfv, "glLightfv");
        bindFunc(cast(void**)&glLightiv, "glLightiv");
        bindFunc(cast(void**)&glGetLightfv, "glGetLightfv");
        bindFunc(cast(void**)&glGetLightiv, "glGetLightiv");
        bindFunc(cast(void**)&glLightModelf, "glLightModelf");
        bindFunc(cast(void**)&glLightModeli, "glLightModeli");
        bindFunc(cast(void**)&glLightModelfv, "glLightModelfv");
        bindFunc(cast(void**)&glLightModeliv, "glLightModeliv");
        bindFunc(cast(void**)&glMaterialf, "glMaterialf");
        bindFunc(cast(void**)&glMateriali, "glMateriali");
        bindFunc(cast(void**)&glMaterialfv, "glMaterialfv");
        bindFunc(cast(void**)&glMaterialiv, "glMaterialiv");
        bindFunc(cast(void**)&glGetMaterialfv, "glGetMaterialfv");
        bindFunc(cast(void**)&glGetMaterialiv, "glGetMaterialiv");
        bindFunc(cast(void**)&glColorMaterial, "glColorMaterial");
        bindFunc(cast(void**)&glPixelZoom, "glPixelZoom");
        bindFunc(cast(void**)&glPixelStoref, "glPixelStoref");
        bindFunc(cast(void**)&glPixelStorei, "glPixelStorei");
        bindFunc(cast(void**)&glPixelTransferf, "glPixelTransferf");
        bindFunc(cast(void**)&glPixelTransferi, "glPixelTransferi");
        bindFunc(cast(void**)&glPixelMapfv, "glPixelMapfv");
        bindFunc(cast(void**)&glPixelMapuiv, "glPixelMapuiv");
        bindFunc(cast(void**)&glPixelMapusv, "glPixelMapusv");
        bindFunc(cast(void**)&glGetPixelMapfv, "glGetPixelMapfv");
        bindFunc(cast(void**)&glGetPixelMapuiv, "glGetPixelMapuiv");
        bindFunc(cast(void**)&glGetPixelMapusv, "glGetPixelMapusv");
        bindFunc(cast(void**)&glBitmap, "glBitmap");
        bindFunc(cast(void**)&glReadPixels, "glReadPixels");
        bindFunc(cast(void**)&glDrawPixels, "glDrawPixels");
        bindFunc(cast(void**)&glCopyPixels, "glCopyPixels");
        bindFunc(cast(void**)&glStencilFunc, "glStencilFunc");
        bindFunc(cast(void**)&glStencilMask, "glStencilMask");
        bindFunc(cast(void**)&glStencilOp, "glStencilOp");
        bindFunc(cast(void**)&glClearStencil, "glClearStencil");
        bindFunc(cast(void**)&glTexGend, "glTexGend");
        bindFunc(cast(void**)&glTexGenf, "glTexGenf");
        bindFunc(cast(void**)&glTexGeni, "glTexGeni");
        bindFunc(cast(void**)&glTexGendv, "glTexGendv");
        bindFunc(cast(void**)&glTexGenfv, "glTexGenfv");
        bindFunc(cast(void**)&glTexGeniv, "glTexGeniv");
        bindFunc(cast(void**)&glTexEnvf, "glTexEnvf");
        bindFunc(cast(void**)&glTexEnvi, "glTexEnvi");
        bindFunc(cast(void**)&glTexEnvfv, "glTexEnvfv");
        bindFunc(cast(void**)&glTexEnviv, "glTexEnviv");
        bindFunc(cast(void**)&glGetTexEnvfv, "glGetTexEnvfv");
        bindFunc(cast(void**)&glGetTexEnviv, "glGetTexEnviv");
        bindFunc(cast(void**)&glTexParameterf, "glTexParameterf");
        bindFunc(cast(void**)&glTexParameteri, "glTexParameteri");
        bindFunc(cast(void**)&glTexParameterfv, "glTexParameterfv");
        bindFunc(cast(void**)&glTexParameteriv, "glTexParameteriv");
        bindFunc(cast(void**)&glGetTexParameterfv, "glGetTexParameterfv");
        bindFunc(cast(void**)&glGetTexParameteriv, "glGetTexParameteriv");
        bindFunc(cast(void**)&glGetTexLevelParameterfv, "glGetTexLevelParameterfv");
        bindFunc(cast(void**)&glGetTexLevelParameteriv, "glGetTexLevelParameteriv");
        bindFunc(cast(void**)&glTexImage1D, "glTexImage1D");
        bindFunc(cast(void**)&glTexImage2D, "glTexImage2D");
        bindFunc(cast(void**)&glGetTexImage, "glGetTexImage");
        bindFunc(cast(void**)&glMap1d, "glMap1d");
        bindFunc(cast(void**)&glMap1f, "glMap1f");
        bindFunc(cast(void**)&glMap2d, "glMap2d");
        bindFunc(cast(void**)&glMap2f, "glMap2f");
        bindFunc(cast(void**)&glGetMapdv, "glGetMapdv");
        bindFunc(cast(void**)&glGetMapfv, "glGetMapfv");
        bindFunc(cast(void**)&glEvalCoord1d, "glEvalCoord1d");
        bindFunc(cast(void**)&glEvalCoord1f, "glEvalCoord1f");
        bindFunc(cast(void**)&glEvalCoord1dv, "glEvalCoord1dv");
        bindFunc(cast(void**)&glEvalCoord1fv, "glEvalCoord1fv");
        bindFunc(cast(void**)&glEvalCoord2d, "glEvalCoord2d");
        bindFunc(cast(void**)&glEvalCoord2f, "glEvalCoord2f");
        bindFunc(cast(void**)&glEvalCoord2dv, "glEvalCoord2dv");
        bindFunc(cast(void**)&glEvalCoord2fv, "glEvalCoord2fv");
        bindFunc(cast(void**)&glMapGrid1d, "glMapGrid1d");
        bindFunc(cast(void**)&glMapGrid1f, "glMapGrid1f");
        bindFunc(cast(void**)&glMapGrid2d, "glMapGrid2d");
        bindFunc(cast(void**)&glMapGrid2f, "glMapGrid2f");
        bindFunc(cast(void**)&glEvalPoint1, "glEvalPoint1");
        bindFunc(cast(void**)&glEvalPoint2, "glEvalPoint2");
        bindFunc(cast(void**)&glEvalMesh1, "glEvalMesh1");
        bindFunc(cast(void**)&glEvalMesh2, "glEvalMesh2");
        bindFunc(cast(void**)&glFogf, "glFogf");
        bindFunc(cast(void**)&glFogi, "glFogi");
        bindFunc(cast(void**)&glFogfv, "glFogfv");
        bindFunc(cast(void**)&glFogiv, "glFogiv");
        bindFunc(cast(void**)&glFeedbackBuffer, "glFeedbackBuffer");
        bindFunc(cast(void**)&glPassThrough, "glPassThrough");
        bindFunc(cast(void**)&glSelectBuffer, "glSelectBuffer");
        bindFunc(cast(void**)&glInitNames, "glInitNames");
        bindFunc(cast(void**)&glLoadName, "glLoadName");
        bindFunc(cast(void**)&glPushName, "glPushName");
        bindFunc(cast(void**)&glPopName, "glPopName");
        // gl 1.1
        bindFunc(cast(void**)&glGenTextures, "glGenTextures");
        bindFunc(cast(void**)&glDeleteTextures, "glDeleteTextures");
        bindFunc(cast(void**)&glBindTexture, "glBindTexture");
        bindFunc(cast(void**)&glPrioritizeTextures, "glPrioritizeTextures");
        bindFunc(cast(void**)&glAreTexturesResident, "glAreTexturesResident");
        bindFunc(cast(void**)&glIsTexture, "glIsTexture");
        bindFunc(cast(void**)&glTexSubImage1D, "glTexSubImage1D");
        bindFunc(cast(void**)&glTexSubImage2D, "glTexSubImage2D");
        bindFunc(cast(void**)&glCopyTexImage1D, "glCopyTexImage1D");
        bindFunc(cast(void**)&glCopyTexImage2D, "glCopyTexImage2D");
        bindFunc(cast(void**)&glCopyTexSubImage1D, "glCopyTexSubImage1D");
        bindFunc(cast(void**)&glCopyTexSubImage2D, "glCopyTexSubImage2D");
        bindFunc(cast(void**)&glVertexPointer, "glVertexPointer");
        bindFunc(cast(void**)&glNormalPointer, "glNormalPointer");
        bindFunc(cast(void**)&glColorPointer, "glColorPointer");
        bindFunc(cast(void**)&glIndexPointer, "glIndexPointer");
        bindFunc(cast(void**)&glTexCoordPointer, "glTexCoordPointer");
        bindFunc(cast(void**)&glEdgeFlagPointer, "glEdgeFlagPointer");
        bindFunc(cast(void**)&glGetPointerv, "glGetPointerv");
        bindFunc(cast(void**)&glArrayElement, "glArrayElement");
        bindFunc(cast(void**)&glDrawArrays, "glDrawArrays");
        bindFunc(cast(void**)&glDrawElements, "glDrawElements");
        bindFunc(cast(void**)&glInterleavedArrays, "glInterleavedArrays");

        loadPlatformGL(&bindFunc);

        _maxVersion = GLVersion.GL11;
    }

    void bindExtendedFunc(void** ptr, string funcName, bool doThrow)
    {
        void* func = wglGetProcAddress(toCString(funcName));
        if(func is null && doThrow)
            Derelict_HandleMissingSymbol(lib.name, funcName);
        else
            *ptr = func;
    }
}

DerelictGLLoader DerelictGL;

static this()
{
    DerelictGL = new DerelictGLLoader();
}

static ~this()
{
    DerelictGL.unload();
}