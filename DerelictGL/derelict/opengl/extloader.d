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
module derelict.opengl.extloader;

private
{
    import derelict.opengl.extfuncs;
    import derelict.opengl.gltypes;
    import derelict.opengl.glfuncs;
    import derelict.util.compat;

    debug
    {
        import derelict.util.exception;
    }

    version(Windows)
    {
        import derelict.opengl.wgl;
        alias wglGetProcAddress getAddress;
    }
}

private
{
    string extStr;
    bool[string] loaded;
}

package
{
    void extLoadAll()
    {
        loaded["GL_ARB_multitexture"] = load_GL_ARB_multitexture();
        loaded["GL_ARB_transpose_matrix"] = load_GL_ARB_transpose_matrix();
        loaded["GL_ARB_multisample"] = load_GL_ARB_multisample();
        loaded["GL_ARB_texture_env_add"] = load_GL_ARB_texture_env_add();
        loaded["GL_ARB_texture_cube_map"] = load_GL_ARB_texture_cube_map();
        loaded["GL_ARB_texture_compression"] = load_GL_ARB_texture_compression();
        loaded["GL_ARB_texture_border_clamp"] = load_GL_ARB_texture_border_clamp();
        loaded["GL_ARB_point_parameters"] = load_GL_ARB_point_parameters();
        loaded["GL_ARB_vertex_blend"] = load_GL_ARB_vertex_blend();
        loaded["GL_ARB_matrix_palette"] = load_GL_ARB_matrix_palette();
        loaded["GL_ARB_texture_env_combine"] = load_GL_ARB_texture_env_combine();
        loaded["GL_ARB_texture_env_crossbar"] = load_GL_ARB_texture_env_crossbar();
        loaded["GL_ARB_texture_env_dot3"] = load_GL_ARB_texture_env_dot3();
        loaded["GL_ARB_texture_mirrored_repeat"] = load_GL_ARB_texture_mirrored_repeat();
        loaded["GL_ARB_depth_texture"] = load_GL_ARB_depth_texture();
        loaded["GL_ARB_shadow"] = load_GL_ARB_shadow();
        loaded["GL_ARB_shadow_ambient"] = load_GL_ARB_shadow_ambient();
        loaded["GL_ARB_window_pos"] = load_GL_ARB_window_pos();
        loaded["GL_ARB_vertex_program"] = load_GL_ARB_vertex_program();
        loaded["GL_ARB_fragment_program"] = load_GL_ARB_fragment_program();
        loaded["GL_ARB_vertex_buffer_object"] = load_GL_ARB_vertex_buffer_object();
        loaded["GL_ARB_occlusion_query"] = load_GL_ARB_occlusion_query();
        loaded["GL_ARB_shader_objects"] = load_GL_ARB_shader_objects();
        loaded["GL_ARB_vertex_shader"] = load_GL_ARB_vertex_shader();
        loaded["GL_ARB_fragment_shader"] = load_GL_ARB_fragment_shader();
        loaded["GL_ARB_shading_language_100"] = load_GL_ARB_shading_language_100();
        loaded["GL_ARB_texture_non_power_of_two"] = load_GL_ARB_texture_non_power_of_two();
        loaded["GL_ARB_point_sprite"] = load_GL_ARB_point_sprite();
        loaded["GL_ARB_fragment_program_shadow"] = load_GL_ARB_fragment_program_shadow();
        loaded["GL_ARB_draw_buffers"] = load_GL_ARB_draw_buffers();
        loaded["GL_ARB_texture_rectangle"] = load_GL_ARB_texture_rectangle();
        loaded["GL_ARB_color_buffer_float"] = load_GL_ARB_color_buffer_float();
        loaded["GL_ARB_half_float_pixel"] = load_GL_ARB_half_float_pixel();
        loaded["GL_ARB_texture_float"] = load_GL_ARB_texture_float();
        loaded["GL_ARB_pixel_buffer_object"] = load_GL_ARB_pixel_buffer_object();
        loaded["GL_ARB_depth_buffer_float"] = load_GL_ARB_depth_buffer_float();
        loaded["GL_ARB_draw_instanced"] = load_GL_ARB_draw_instanced();
        loaded["GL_ARB_framebuffer_object"] = load_GL_ARB_framebuffer_object();
        loaded["GL_ARB_framebuffer_sRGB"] = load_GL_ARB_framebuffer_sRGB();
        loaded["GL_ARB_geometry_shader4"] = load_GL_ARB_geometry_shader4();
        loaded["GL_ARB_half_float_vertex"] = load_GL_ARB_half_float_vertex();
        loaded["GL_ARB_imgaging"] = load_GL_ARB_imaging();
        loaded["GL_ARB_instanced_arrays"] = load_GL_ARB_instanced_arrays();
        loaded["GL_ARB_texture_buffer_object"] = load_GL_ARB_texture_buffer_object();
        loaded["GL_ARB_texture_compression_rgtc"] = load_GL_ARB_texture_compression_rgtc();
        loaded["GL_ARB_teture_rg"] = load_GL_ARB_teture_rg();
        loaded["GL_ARB_vertex_array_object"] = load_GL_ARB_vertex_array_object();
        loaded["GL_ARB_uniform_buffer_object"] = load_GL_ARB_uniform_buffer_object();
    }

    string[] getLoadedExtensionNames()
    {
        auto keys = loaded.keys;
        string[] ret;
        foreach(key; keys)
        {
            if(loaded[key])
                ret ~= key;
        }
        return ret;
    }

    string[] getNotLoadedExtensionNames()
    {
        auto keys = loaded.keys;
        string[] ret;
        foreach(key; keys)
        {
            if(!loaded[key])
            {
                if(extIsSupported(key))
                    ret ~= key ~ " (Load Failure)";
                else
                    ret ~= key ~ " (Unsupported)";
            }
        }
        return ret;
    }

    bool extIsSupported(string extName)
    {
        if(extStr is null) extStr = toDString(glGetString(GL_EXTENSIONS));
        return (extStr.findStr(extName) != -1);
    }

    bool extIsLoaded(string extName)
    {
        bool* b = (extName in loaded);
        return (b !is null) ? *b : false;
    }
}

private
{
    bool bindExtFunc(void** ptr, string funcName)
    {
        *ptr = getAddress(toCString(funcName));
        debug
        {
            if(*ptr is null)
                throw new SymbolLoadException("Failed to load OpenGL extension " ~ funcName);
        }
        return (*ptr !is null);
    }

    bool load_GL_ARB_multitexture()
    {
        if(!extIsSupported("GL_ARB_multitexture"))
            return false;
        if(!bindExtFunc(cast(void**)&glActiveTextureARB, "glActiveTextureARB"))
            return false;
        if(!bindExtFunc(cast(void**)&glClientActiveTextureARB, "glClientActiveTextureARB"))
            return false;
        if(!bindExtFunc(cast(void**)&glMultiTexCoord1dARB, "glMultiTexCoord1dARB"))
            return false;
        if(!bindExtFunc(cast(void**)&glMultiTexCoord1dvARB, "glMultiTexCoord1dvARB"))
            return false;
        if(!bindExtFunc(cast(void**)&glMultiTexCoord1fARB, "glMultiTexCoord1fARB"))
            return false;
        if(!bindExtFunc(cast(void**)&glMultiTexCoord1fvARB, "glMultiTexCoord1fvARB"))
            return false;
        if(!bindExtFunc(cast(void**)&glMultiTexCoord1iARB, "glMultiTexCoord1iARB"))
            return false;
        if(!bindExtFunc(cast(void**)&glMultiTexCoord1ivARB, "glMultiTexCoord1ivARB"))
            return false;
        if(!bindExtFunc(cast(void**)&glMultiTexCoord1sARB, "glMultiTexCoord1sARB"))
            return false;
        if(!bindExtFunc(cast(void**)&glMultiTexCoord1svARB, "glMultiTexCoord1svARB"))
            return false;
        if(!bindExtFunc(cast(void**)&glMultiTexCoord2dARB, "glMultiTexCoord2dARB"))
            return false;
        if(!bindExtFunc(cast(void**)&glMultiTexCoord2dvARB, "glMultiTexCoord2dvARB"))
            return false;
        if(!bindExtFunc(cast(void**)&glMultiTexCoord2fARB, "glMultiTexCoord2fARB"))
            return false;
        if(!bindExtFunc(cast(void**)&glMultiTexCoord2fvARB, "glMultiTexCoord2fvARB"))
            return false;
        if(!bindExtFunc(cast(void**)&glMultiTexCoord2iARB, "glMultiTexCoord2iARB"))
            return false;
        if(!bindExtFunc(cast(void**)&glMultiTexCoord2ivARB, "glMultiTexCoord2ivARB"))
            return false;
        if(!bindExtFunc(cast(void**)&glMultiTexCoord2sARB, "glMultiTexCoord2sARB"))
            return false;
        if(!bindExtFunc(cast(void**)&glMultiTexCoord2svARB, "glMultiTexCoord2svARB"))
            return false;
        if(!bindExtFunc(cast(void**)&glMultiTexCoord3dARB, "glMultiTexCoord3dARB"))
            return false;
        if(!bindExtFunc(cast(void**)&glMultiTexCoord3dvARB, "glMultiTexCoord3dvARB"))
            return false;
        if(!bindExtFunc(cast(void**)&glMultiTexCoord3fARB, "glMultiTexCoord3fARB"))
            return false;
        if(!bindExtFunc(cast(void**)&glMultiTexCoord3fvARB, "glMultiTexCoord3fvARB"))
            return false;
        if(!bindExtFunc(cast(void**)&glMultiTexCoord3iARB, "glMultiTexCoord3iARB"))
            return false;
        if(!bindExtFunc(cast(void**)&glMultiTexCoord3ivARB, "glMultiTexCoord3ivARB"))
            return false;
        if(!bindExtFunc(cast(void**)&glMultiTexCoord3sARB, "glMultiTexCoord3sARB"))
            return false;
        if(!bindExtFunc(cast(void**)&glMultiTexCoord3svARB, "glMultiTexCoord3svARB"))
            return false;
        if(!bindExtFunc(cast(void**)&glMultiTexCoord4dARB, "glMultiTexCoord4dARB"))
            return false;
        if(!bindExtFunc(cast(void**)&glMultiTexCoord4dvARB, "glMultiTexCoord4dvARB"))
            return false;
        if(!bindExtFunc(cast(void**)&glMultiTexCoord4fARB, "glMultiTexCoord4fARB"))
            return false;
        if(!bindExtFunc(cast(void**)&glMultiTexCoord4fvARB, "glMultiTexCoord4fvARB"))
            return false;
        if(!bindExtFunc(cast(void**)&glMultiTexCoord4iARB, "glMultiTexCoord4iARB"))
            return false;
        if(!bindExtFunc(cast(void**)&glMultiTexCoord4ivARB, "glMultiTexCoord4ivARB"))
            return false;
        if(!bindExtFunc(cast(void**)&glMultiTexCoord4sARB, "glMultiTexCoord4sARB"))
            return false;
        if(!bindExtFunc(cast(void**)&glMultiTexCoord4svARB, "glMultiTexCoord4svARB"))
            return false;
        return true;
    }

    bool load_GL_ARB_transpose_matrix()
    {
        if(!extIsSupported("GL_ARB_transpose_matrix"))
            return false;
        if(!bindExtFunc(cast(void**)&glLoadTransposeMatrixfARB, "glLoadTransposeMatrixfARB"))
            return false;
        if(!bindExtFunc(cast(void**)&glLoadTransposeMatrixdARB, "glLoadTransposeMatrixdARB"))
            return false;
        if(!bindExtFunc(cast(void**)&glMultTransposeMatrixfARB, "glMultTransposeMatrixfARB"))
            return false;
        if(!bindExtFunc(cast(void**)&glMultTransposeMatrixdARB, "glMultTransposeMatrixdARB"))
            return false;
        return true;
    }

    bool load_GL_ARB_multisample()
    {
        if(!extIsSupported("GL_ARB_multisample"))
            return false;
        if(!bindExtFunc(cast(void**)&glSampleCoverageARB, "glSampleCoverageARB"))
            return false;
        return true;
    }

    bool load_GL_ARB_texture_env_add()
    {
        if(!extIsSupported("GL_ARB_texture_env_add"))
            return false;
        return true;
    }

    bool load_GL_ARB_texture_cube_map()
    {
        if(!extIsSupported("GL_ARB_texture_cube_map"))
            return false;
        return true;
    }

    bool load_GL_ARB_texture_compression()
    {
        if(!extIsSupported("GL_ARB_texture_compression"))
            return false;
        if(!bindExtFunc(cast(void**)&glCompressedTexImage3DARB, "glCompressedTexImage3DARB"))
            return false;
        if(!bindExtFunc(cast(void**)&glCompressedTexImage2DARB, "glCompressedTexImage2DARB"))
            return false;
        if(!bindExtFunc(cast(void**)&glCompressedTexImage1DARB, "glCompressedTexImage1DARB"))
            return false;
        if(!bindExtFunc(cast(void**)&glCompressedTexSubImage3DARB, "glCompressedTexSubImage3DARB"))
            return false;
        if(!bindExtFunc(cast(void**)&glCompressedTexSubImage2DARB, "glCompressedTexSubImage2DARB"))
            return false;
        if(!bindExtFunc(cast(void**)&glCompressedTexSubImage1DARB, "glCompressedTexSubImage1DARB"))
            return false;
        if(!bindExtFunc(cast(void**)&glGetCompressedTexImageARB, "glGetCompressedTexImageARB"))
            return false;
        return true;
    }

    bool load_GL_ARB_texture_border_clamp()
    {
        if(!extIsSupported("GL_ARB_texture_border_clamp"))
            return false;
        return true;
    }

    bool load_GL_ARB_point_parameters()
    {
        if(!extIsSupported("GL_ARB_point_parameters"))
            return false;
        if(!bindExtFunc(cast(void**)&glPointParameterfARB, "glPointParameterfARB"))
            return false;
        if(!bindExtFunc(cast(void**)&glPointParameterfvARB, "glPointParameterfvARB"))
            return false;
        return true;
    }

    bool load_GL_ARB_vertex_blend()
    {
        if(!extIsSupported("GL_ARB_vertex_blend"))
            return false;
        if(!bindExtFunc(cast(void**)&glWeightbvARB, "glWeightbvARB"))
            return false;
        if(!bindExtFunc(cast(void**)&glWeightsvARB, "glWeightsvARB"))
            return false;
        if(!bindExtFunc(cast(void**)&glWeightivARB, "glWeightivARB"))
            return false;
        if(!bindExtFunc(cast(void**)&glWeightfvARB, "glWeightfvARB"))
            return false;
        if(!bindExtFunc(cast(void**)&glWeightdvARB, "glWeightdvARB"))
            return false;
        if(!bindExtFunc(cast(void**)&glWeightubvARB, "glMatrixIndexPointerARB"))
            return false;
        if(!bindExtFunc(cast(void**)&glWeightusvARB, "glWeightusvARB"))
            return false;
        if(!bindExtFunc(cast(void**)&glWeightuivARB, "glWeightuivARB"))
            return false;
        if(!bindExtFunc(cast(void**)&glWeightPointerARB, "glWeightPointerARB"))
            return false;
        if(!bindExtFunc(cast(void**)&glVertexBlendARB, "glVertexBlendARB"))
            return false;
        return true;
    }

    bool load_GL_ARB_matrix_palette()
    {
        if(!extIsSupported("GL_ARB_matrix_palette"))
            return false;
        if(!bindExtFunc(cast(void**)&glCurrentPaletteMatrixARB, "glCurrentPaletteMatrixARB"))
            return false;
        if(!bindExtFunc(cast(void**)&glMatrixIndexubvARB, "glMatrixIndexubvARB"))
            return false;
        if(!bindExtFunc(cast(void**)&glMatrixIndexusvARB, "glMatrixIndexusvARB"))
            return false;
        if(!bindExtFunc(cast(void**)&glMatrixIndexuivARB, "glMatrixIndexuivARB"))
            return false;
        if(!bindExtFunc(cast(void**)&glMatrixIndexPointerARB, "glMatrixIndexPointerARB"))
            return false;
        return true;
    }

    bool load_GL_ARB_texture_env_combine()
    {
        if(!extIsSupported("GL_ARB_texture_env_combine"))
            return false;
        return true;
    }

    bool load_GL_ARB_texture_env_crossbar()
    {
        if(!extIsSupported("GL_ARB_texture_env_crossbar"))
            return false;
        return true;
    }

    bool load_GL_ARB_texture_env_dot3()
    {
        if(!extIsSupported("GL_ARB_texture_env_dot3"))
            return false;
        return true;
    }

    bool load_GL_ARB_texture_mirrored_repeat()
    {
        if(!extIsSupported("GL_ARB_texture_mirrored_repeat"))
            return false;
        return true;
    }

    bool load_GL_ARB_depth_texture()
    {
        if(!extIsSupported("GL_ARB_depth_texture"))
            return false;
        return true;
    }

    bool load_GL_ARB_shadow()
    {
        if(!extIsSupported("GL_ARB_shadow"))
            return false;
        return true;
    }

    bool load_GL_ARB_shadow_ambient()
    {
        if(!extIsSupported("GL_ARB_shadow_ambient"))
            return false;
        return true;
    }

    bool load_GL_ARB_window_pos()
    {
        if(!extIsSupported("GL_ARB_window_pos"))
            return false;
        if(!bindExtFunc(cast(void**)&glWindowPos2dARB, "glWindowPos2dARB"))
            return false;
        if(!bindExtFunc(cast(void**)&glWindowPos2dvARB, "glWindowPos2dvARB"))
            return false;
        if(!bindExtFunc(cast(void**)&glWindowPos2fARB, "glWindowPos2fARB"))
            return false;
        if(!bindExtFunc(cast(void**)&glWindowPos2fvARB, "glWindowPos2fvARB"))
            return false;
        if(!bindExtFunc(cast(void**)&glWindowPos2iARB, "glWindowPos2iARB"))
            return false;
        if(!bindExtFunc(cast(void**)&glWindowPos2ivARB, "glWindowPos2ivARB"))
            return false;
        if(!bindExtFunc(cast(void**)&glWindowPos2sARB, "glWindowPos2sARB"))
            return false;
        if(!bindExtFunc(cast(void**)&glWindowPos2svARB, "glWindowPos2svARB"))
            return false;
        if(!bindExtFunc(cast(void**)&glWindowPos3dARB, "glWindowPos3dARB"))
            return false;
        if(!bindExtFunc(cast(void**)&glWindowPos3dvARB, "glWindowPos3dvARB"))
            return false;
        if(!bindExtFunc(cast(void**)&glWindowPos3fARB, "glWindowPos3fARB"))
            return false;
        if(!bindExtFunc(cast(void**)&glWindowPos3fvARB, "glWindowPos3fvARB"))
            return false;
        if(!bindExtFunc(cast(void**)&glWindowPos3iARB, "glWindowPos3iARB"))
            return false;
        if(!bindExtFunc(cast(void**)&glWindowPos3ivARB, "glWindowPos3ivARB"))
            return false;
        if(!bindExtFunc(cast(void**)&glWindowPos3sARB, "glWindowPos3sARB"))
            return false;
        if(!bindExtFunc(cast(void**)&glWindowPos3svARB, "glWindowPos3svARB"))
            return false;
        return true;
    }

    bool load_GL_ARB_vertex_program()
    {
        if(!extIsSupported("GL_ARB_vertex_program"))
            return false;
        if(!bindExtFunc(cast(void**)&glVertexAttrib1dARB, "glVertexAttrib1dARB"))
            return false;
        if(!bindExtFunc(cast(void**)&glVertexAttrib1dvARB, "glVertexAttrib1dvARB"))
            return false;
        if(!bindExtFunc(cast(void**)&glVertexAttrib1fARB, "glVertexAttrib1fARB"))
            return false;
        if(!bindExtFunc(cast(void**)&glVertexAttrib1fvARB, "glVertexAttrib1fvARB"))
            return false;
        if(!bindExtFunc(cast(void**)&glVertexAttrib1sARB, "glVertexAttrib1sARB"))
            return false;
        if(!bindExtFunc(cast(void**)&glVertexAttrib1svARB, "glVertexAttrib1svARB"))
            return false;
        if(!bindExtFunc(cast(void**)&glVertexAttrib2dARB, "glVertexAttrib2dARB"))
            return false;
        if(!bindExtFunc(cast(void**)&glVertexAttrib2dvARB, "glVertexAttrib2dvARB"))
            return false;
        if(!bindExtFunc(cast(void**)&glVertexAttrib2fARB, "glVertexAttrib2fARB"))
            return false;
        if(!bindExtFunc(cast(void**)&glVertexAttrib2fvARB, "glVertexAttrib2fvARB"))
            return false;
        if(!bindExtFunc(cast(void**)&glVertexAttrib2sARB, "glVertexAttrib2sARB"))
            return false;
        if(!bindExtFunc(cast(void**)&glVertexAttrib2svARB, "glVertexAttrib2svARB"))
            return false;
        if(!bindExtFunc(cast(void**)&glVertexAttrib3dARB, "glVertexAttrib3dARB"))
            return false;
        if(!bindExtFunc(cast(void**)&glVertexAttrib3dvARB, "glVertexAttrib3dvARB"))
            return false;
        if(!bindExtFunc(cast(void**)&glVertexAttrib3fARB, "glVertexAttrib3fARB"))
            return false;
        if(!bindExtFunc(cast(void**)&glVertexAttrib3fvARB, "glVertexAttrib3fvARB"))
            return false;
        if(!bindExtFunc(cast(void**)&glVertexAttrib3sARB, "glVertexAttrib3sARB"))
            return false;
        if(!bindExtFunc(cast(void**)&glVertexAttrib3svARB, "glVertexAttrib3svARB"))
            return false;
        if(!bindExtFunc(cast(void**)&glVertexAttrib4NbvARB, "glVertexAttrib4NbvARB"))
            return false;
        if(!bindExtFunc(cast(void**)&glVertexAttrib4NivARB, "glVertexAttrib4NivARB"))
            return false;
        if(!bindExtFunc(cast(void**)&glVertexAttrib4NsvARB, "glVertexAttrib4NsvARB"))
            return false;
        if(!bindExtFunc(cast(void**)&glVertexAttrib4NubARB, "glVertexAttrib4NubARB"))
            return false;
        if(!bindExtFunc(cast(void**)&glVertexAttrib4NubvARB, "glVertexAttrib4NubvARB"))
            return false;
        if(!bindExtFunc(cast(void**)&glVertexAttrib4NuivARB, "glVertexAttrib4NuivARB"))
            return false;
        if(!bindExtFunc(cast(void**)&glVertexAttrib4NusvARB, "glVertexAttrib4NusvARB"))
            return false;
        if(!bindExtFunc(cast(void**)&glVertexAttrib4bvARB, "glVertexAttrib4bvARB"))
            return false;
        if(!bindExtFunc(cast(void**)&glVertexAttrib4dARB, "glVertexAttrib4dARB"))
            return false;
        if(!bindExtFunc(cast(void**)&glVertexAttrib4dvARB, "glVertexAttrib4dvARB"))
            return false;
        if(!bindExtFunc(cast(void**)&glVertexAttrib4fARB, "glVertexAttrib4fARB"))
            return false;
        if(!bindExtFunc(cast(void**)&glVertexAttrib4fvARB, "glVertexAttrib4fvARB"))
            return false;
        if(!bindExtFunc(cast(void**)&glVertexAttrib4ivARB, "glVertexAttrib4ivARB"))
            return false;
        if(!bindExtFunc(cast(void**)&glVertexAttrib4sARB, "glVertexAttrib4sARB"))
            return false;
        if(!bindExtFunc(cast(void**)&glVertexAttrib4svARB, "glVertexAttrib4svARB"))
            return false;
        if(!bindExtFunc(cast(void**)&glVertexAttrib4ubvARB, "glVertexAttrib4ubvARB"))
            return false;
        if(!bindExtFunc(cast(void**)&glVertexAttrib4uivARB, "glVertexAttrib4uivARB"))
            return false;
        if(!bindExtFunc(cast(void**)&glVertexAttrib4usvARB, "glVertexAttrib4usvARB"))
            return false;
        if(!bindExtFunc(cast(void**)&glVertexAttribPointerARB, "glVertexAttribPointerARB"))
            return false;
        if(!bindExtFunc(cast(void**)&glEnableVertexAttribArrayARB, "glEnableVertexAttribArrayARB"))
            return false;
        if(!bindExtFunc(cast(void**)&glDisableVertexAttribArrayARB, "glDisableVertexAttribArrayARB"))
            return false;
        if(!bindExtFunc(cast(void**)&glProgramStringARB, "glProgramStringARB"))
            return false;
        if(!bindExtFunc(cast(void**)&glBindProgramARB, "glBindProgramARB"))
            return false;
        if(!bindExtFunc(cast(void**)&glDeleteProgramsARB, "glDeleteProgramsARB"))
            return false;
        if(!bindExtFunc(cast(void**)&glGenProgramsARB, "glGenProgramsARB"))
            return false;
        if(!bindExtFunc(cast(void**)&glProgramEnvParameter4dARB, "glProgramEnvParameter4dARB"))
            return false;
        if(!bindExtFunc(cast(void**)&glProgramEnvParameter4dvARB, "glProgramEnvParameter4dvARB"))
            return false;
        if(!bindExtFunc(cast(void**)&glProgramEnvParameter4fARB, "glProgramEnvParameter4fARB"))
            return false;
        if(!bindExtFunc(cast(void**)&glProgramEnvParameter4fvARB, "glProgramEnvParameter4fvARB"))
            return false;
        if(!bindExtFunc(cast(void**)&glProgramLocalParameter4dARB, "glProgramLocalParameter4dARB"))
            return false;
        if(!bindExtFunc(cast(void**)&glProgramLocalParameter4dvARB, "glProgramLocalParameter4dvARB"))
            return false;
        if(!bindExtFunc(cast(void**)&glProgramLocalParameter4fARB, "glProgramLocalParameter4fARB"))
            return false;
        if(!bindExtFunc(cast(void**)&glProgramLocalParameter4fvARB, "glProgramLocalParameter4fvARB"))
            return false;
        if(!bindExtFunc(cast(void**)&glGetProgramEnvParameterdvARB, "glGetProgramEnvParameterdvARB"))
            return false;
        if(!bindExtFunc(cast(void**)&glGetProgramEnvParameterfvARB, "glGetProgramEnvParameterfvARB"))
            return false;
        if(!bindExtFunc(cast(void**)&glGetProgramLocalParameterdvARB, "glGetProgramLocalParameterdvARB"))
            return false;
        if(!bindExtFunc(cast(void**)&glGetProgramLocalParameterfvARB, "glGetProgramLocalParameterfvARB"))
            return false;
        if(!bindExtFunc(cast(void**)&glGetProgramivARB, "glGetProgramivARB"))
            return false;
        if(!bindExtFunc(cast(void**)&glGetProgramStringARB, "glGetProgramStringARB"))
            return false;
        if(!bindExtFunc(cast(void**)&glGetVertexAttribdvARB, "glGetVertexAttribdvARB"))
            return false;
        if(!bindExtFunc(cast(void**)&glGetVertexAttribfvARB, "glGetVertexAttribfvARB"))
            return false;
        if(!bindExtFunc(cast(void**)&glGetVertexAttribivARB, "glGetVertexAttribivARB"))
            return false;
        if(!bindExtFunc(cast(void**)&glGetVertexAttribPointervARB, "glGetVertexAttribPointervARB"))
            return false;
        if(!bindExtFunc(cast(void**)&glIsProgramARB, "glIsProgramARB"))
            return false;
        return true;
    }

    bool load_GL_ARB_fragment_program()
    {
        if(!extIsSupported("GL_ARB_fragment_program"))
            return false;
        return true;
    }

    bool load_GL_ARB_vertex_buffer_object()
    {
        if(!extIsSupported("GL_ARB_vertex_buffer_object"))
            return false;
        if(!bindExtFunc(cast(void**)&glBindBufferARB, "glBindBufferARB"))
            return false;
        if(!bindExtFunc(cast(void**)&glDeleteBuffersARB, "glDeleteBuffersARB"))
            return false;
        if(!bindExtFunc(cast(void**)&glGenBuffersARB, "glGenBuffersARB"))
            return false;
        if(!bindExtFunc(cast(void**)&glIsBufferARB, "glIsBufferARB"))
            return false;
        if(!bindExtFunc(cast(void**)&glBufferDataARB, "glBufferDataARB"))
            return false;
        if(!bindExtFunc(cast(void**)&glBufferSubDataARB, "glBufferSubDataARB"))
            return false;
        if(!bindExtFunc(cast(void**)&glGetBufferSubDataARB, "glGetBufferSubDataARB"))
            return false;
        if(!bindExtFunc(cast(void**)&glMapBufferARB, "glMapBufferARB"))
            return false;
        if(!bindExtFunc(cast(void**)&glUnmapBufferARB, "glUnmapBufferARB"))
            return false;
        if(!bindExtFunc(cast(void**)&glGetBufferParameterivARB, "glGetBufferParameterivARB"))
            return false;
        if(!bindExtFunc(cast(void**)&glGetBufferPointervARB, "glGetBufferPointervARB"))
            return false;
        return true;
    }

    bool load_GL_ARB_occlusion_query()
    {
        if(!extIsSupported("GL_ARB_occlusion_query"))
            return false;
        if(!bindExtFunc(cast(void**)&glGenQueriesARB, "glGenQueriesARB"))
            return false;
        if(!bindExtFunc(cast(void**)&glDeleteQueriesARB, "glDeleteQueriesARB"))
            return false;
        if(!bindExtFunc(cast(void**)&glIsQueryARB, "glIsQueryARB"))
            return false;
        if(!bindExtFunc(cast(void**)&glBeginQueryARB, "glBeginQueryARB"))
            return false;
        if(!bindExtFunc(cast(void**)&glEndQueryARB, "glEndQueryARB"))
            return false;
        if(!bindExtFunc(cast(void**)&glGetQueryivARB, "glGetQueryivARB"))
            return false;
        if(!bindExtFunc(cast(void**)&glGetQueryObjectivARB, "glGetQueryObjectivARB"))
            return false;
        if(!bindExtFunc(cast(void**)&glGetQueryObjectuivARB, "glGetQueryObjectuivARB"))
            return false;
        return true;
    }

    bool load_GL_ARB_shader_objects()
    {
        if(!extIsSupported("GL_ARB_shader_objects"))
            return false;
        if(!bindExtFunc(cast(void**)&glDeleteObjectARB, "glDeleteObjectARB"))
            return false;
        if(!bindExtFunc(cast(void**)&glGetHandleARB, "glGetHandleARB"))
            return false;
        if(!bindExtFunc(cast(void**)&glDetachObjectARB, "glDetachObjectARB"))
            return false;
        if(!bindExtFunc(cast(void**)&glCreateShaderObjectARB, "glCreateShaderObjectARB"))
            return false;
        if(!bindExtFunc(cast(void**)&glShaderSourceARB, "glShaderSourceARB"))
            return false;
        if(!bindExtFunc(cast(void**)&glCompileShaderARB, "glCompileShaderARB"))
            return false;
        if(!bindExtFunc(cast(void**)&glCreateProgramObjectARB, "glCreateProgramObjectARB"))
            return false;
        if(!bindExtFunc(cast(void**)&glAttachObjectARB, "glAttachObjectARB"))
            return false;
        if(!bindExtFunc(cast(void**)&glLinkProgramARB, "glLinkProgramARB"))
            return false;
        if(!bindExtFunc(cast(void**)&glUseProgramObjectARB, "glUseProgramObjectARB"))
            return false;
        if(!bindExtFunc(cast(void**)&glValidateProgramARB, "glValidateProgramARB"))
            return false;
        if(!bindExtFunc(cast(void**)&glUniform1fARB, "glUniform1fARB"))
            return false;
        if(!bindExtFunc(cast(void**)&glUniform2fARB, "glUniform2fARB"))
            return false;
        if(!bindExtFunc(cast(void**)&glUniform3fARB, "glUniform3fARB"))
            return false;
        if(!bindExtFunc(cast(void**)&glUniform4fARB, "glUniform4fARB"))
            return false;
        if(!bindExtFunc(cast(void**)&glUniform1iARB, "glUniform1iARB"))
            return false;
        if(!bindExtFunc(cast(void**)&glUniform2iARB, "glUniform2iARB"))
            return false;
        if(!bindExtFunc(cast(void**)&glUniform3iARB, "glUniform3iARB"))
            return false;
        if(!bindExtFunc(cast(void**)&glUniform4iARB, "glUniform4iARB"))
            return false;
        if(!bindExtFunc(cast(void**)&glUniform1fvARB, "glUniform1fvARB"))
            return false;
        if(!bindExtFunc(cast(void**)&glUniform2fvARB, "glUniform2fvARB"))
            return false;
        if(!bindExtFunc(cast(void**)&glUniform3fvARB, "glUniform3fvARB"))
            return false;
        if(!bindExtFunc(cast(void**)&glUniform4fvARB, "glUniform4fvARB"))
            return false;
        if(!bindExtFunc(cast(void**)&glUniform1ivARB, "glUniform1ivARB"))
            return false;
        if(!bindExtFunc(cast(void**)&glUniform2ivARB, "glUniform2ivARB"))
            return false;
        if(!bindExtFunc(cast(void**)&glUniform3ivARB, "glUniform3ivARB"))
            return false;
        if(!bindExtFunc(cast(void**)&glUniform4ivARB, "glUniform4ivARB"))
            return false;
        if(!bindExtFunc(cast(void**)&glUniformMatrix2fvARB, "glUniformMatrix2fvARB"))
            return false;
        if(!bindExtFunc(cast(void**)&glUniformMatrix3fvARB, "glUniformMatrix3fvARB"))
            return false;
        if(!bindExtFunc(cast(void**)&glUniformMatrix4fvARB, "glUniformMatrix4fvARB"))
            return false;
        if(!bindExtFunc(cast(void**)&glGetObjectParameterfvARB, "glGetObjectParameterfvARB"))
            return false;
        if(!bindExtFunc(cast(void**)&glGetObjectParameterivARB, "glGetObjectParameterivARB"))
            return false;
        if(!bindExtFunc(cast(void**)&glGetInfoLogARB, "glGetInfoLogARB"))
            return false;
        if(!bindExtFunc(cast(void**)&glGetAttachedObjectsARB, "glGetAttachedObjectsARB"))
            return false;
        if(!bindExtFunc(cast(void**)&glGetUniformLocationARB, "glGetUniformLocationARB"))
            return false;
        if(!bindExtFunc(cast(void**)&glGetActiveUniformARB, "glGetActiveUniformARB"))
            return false;
        if(!bindExtFunc(cast(void**)&glGetUniformfvARB, "glGetUniformfvARB"))
            return false;
        if(!bindExtFunc(cast(void**)&glGetUniformivARB, "glGetUniformivARB"))
            return false;
        if(!bindExtFunc(cast(void**)&glGetShaderSourceARB, "glGetShaderSourceARB"))
            return false;

        return true;
    }

    bool load_GL_ARB_vertex_shader()
    {
        if(!extIsSupported("GL_ARB_vertex_shader"))
            return false;
        if(!bindExtFunc(cast(void**)&glBindAttribLocationARB, "glBindAttribLocationARB"))
            return false;
        if(!bindExtFunc(cast(void**)&glGetActiveAttribARB, "glGetActiveAttribARB"))
            return false;
        if(!bindExtFunc(cast(void**)&glGetAttribLocationARB, "glGetAttribLocationARB"))
            return false;
        return true;
    }

    bool load_GL_ARB_fragment_shader()
    {
        if(!extIsSupported("GL_ARB_fragment_shader"))
            return false;
        return true;
    }

    bool load_GL_ARB_shading_language_100()
    {
        if(!extIsSupported("GL_ARB_shading_language_100"))
            return false;
        return true;
    }

    bool load_GL_ARB_texture_non_power_of_two()
    {
        if(!extIsSupported("GL_ARB_texture_non_power_of_two"))
            return false;
        return true;
    }

    bool load_GL_ARB_point_sprite()
    {
        if(!extIsSupported("GL_ARB_point_sprite"))
            return false;
        return true;
    }

    bool load_GL_ARB_fragment_program_shadow()
    {
        if(!extIsSupported("GL_ARB_fragment_program_shadow"))
            return false;
        return true;
    }

    bool load_GL_ARB_draw_buffers()
    {
        if(!extIsSupported("GL_ARB_draw_buffers"))
            return false;
        if(!bindExtFunc(cast(void**)&glDrawBuffersARB, "glDrawBuffersARB"))
            return false;
        return true;
    }

    bool load_GL_ARB_texture_rectangle()
    {
        if(!extIsSupported("GL_ARB_texture_rectangle"))
            return false;
        return true;
    }

    bool load_GL_ARB_color_buffer_float()
    {
        if(!extIsSupported("GL_ARB_color_buffer_float"))
            return false;
        if(!bindExtFunc(cast(void**)&glClampColorARB, "glClampColorARB"))
            return false;
        return true;
    }

    bool load_GL_ARB_half_float_pixel()
    {
        if(!extIsSupported("GL_ARB_half_float_pixel"))
            return false;
        return true;
    }

    bool load_GL_ARB_texture_float()
    {
        if(!extIsSupported("GL_ARB_texture_float"))
            return false;
        return true;
    }

    bool load_GL_ARB_pixel_buffer_object()
    {
        if(!extIsSupported("GL_ARB_pixel_buffer_object"))
            return false;
        return true;
    }

    bool load_GL_ARB_depth_buffer_float()
    {
        if(!extIsSupported("GL_ARB_depth_buffer_float"))
            return false;
        return true;
    }

    bool load_GL_ARB_draw_instanced()
    {
        if(!extIsSupported("GL_ARB_draw_instanced"))
            return false;
        if(!bindExtFunc(cast(void**)&glDrawArraysInstancedARB, "glDrawArraysInstancedARB"))
            return false;
        if(!bindExtFunc(cast(void**)&glDrawElementsInstancedARB, "glDrawElementsInstancedARB"))
            return false;
        return true;
    }

    bool load_GL_ARB_framebuffer_object()
    {
        if(!extIsSupported("GL_ARB_framebuffer_object"))
            return false;
        if(!bindExtFunc(cast(void**)&glIsRenderbuffer, "glIsRenderbuffer"))
            return false;
        if(!bindExtFunc(cast(void**)&glBindRenderbuffer, "glBindRenderbuffer"))
            return false;
        if(!bindExtFunc(cast(void**)&glDeleteRenderbuffers, "glDeleteRenderbuffers"))
            return false;
        if(!bindExtFunc(cast(void**)&glGenRenderbuffers, "glGenRenderbuffers"))
            return false;
        if(!bindExtFunc(cast(void**)&glRenderbufferStorage, "glRenderbufferStorage"))
            return false;
        if(!bindExtFunc(cast(void**)&glRenderbufferStorageMultisample, "glRenderbufferStorageMultisample"))
            return false;
        if(!bindExtFunc(cast(void**)&glGetRenderbufferParameteriv, "glGetRenderbufferParameteriv"))
            return false;
        if(!bindExtFunc(cast(void**)&glIsFramebuffer, "glIsFramebuffer"))
            return false;
        if(!bindExtFunc(cast(void**)&glBindFramebuffer, "glBindFramebuffer"))
            return false;
        if(!bindExtFunc(cast(void**)&glDeleteFramebuffers, "glDeleteFramebuffers"))
            return false;
        if(!bindExtFunc(cast(void**)&glGenFramebuffers, "glGenFramebuffers"))
            return false;
        if(!bindExtFunc(cast(void**)&glCheckFramebufferStatus, "glCheckFramebufferStatus"))
            return false;
        if(!bindExtFunc(cast(void**)&glFramebufferTexture1D, "glFramebufferTexture1D"))
            return false;
        if(!bindExtFunc(cast(void**)&glFramebufferTexture2D, "glFramebufferTexture2D"))
            return false;
        if(!bindExtFunc(cast(void**)&glFramebufferTexture3D, "glFramebufferTexture3D"))
            return false;
        if(!bindExtFunc(cast(void**)&glFramebufferTextureLayer, "glFramebufferTextureLayer"))
            return false;
        if(!bindExtFunc(cast(void**)&glFramebufferRenderbuffer, "glFramebufferRenderbuffer"))
            return false;
        if(!bindExtFunc(cast(void**)&glGetFramebufferAttachmentParameteriv, "glGetFramebufferAttachmentParameteriv"))
            return false;
        if(!bindExtFunc(cast(void**)&glBlitFramebuffer, "glBlitFramebuffer"))
            return false;
        if(!bindExtFunc(cast(void**)&glGenerateMipmap, "glGenerateMipmap"))
            return false;
        return true;
    }

    bool load_GL_ARB_framebuffer_sRGB()
    {
        if(!extIsSupported("GL_ARB_framebuffer_sRGB"))
            return false;
        return true;
    }

    bool load_GL_ARB_geometry_shader4()
    {
        if(!extIsSupported("GL_ARB_geometry_shader4"))
            return false;
        if(!bindExtFunc(cast(void**)&glProgramParameteriARB, "glProgramParameteriARB"))
            return false;
        if(!bindExtFunc(cast(void**)&glFramebufferTextureARB, "glFramebufferTextureARB"))
            return false;
        if(!bindExtFunc(cast(void**)&glFramebufferTextureLayerARB, "glFramebufferTextureLayerARB"))
            return false;
        if(!bindExtFunc(cast(void**)&glFramebufferTextureFaceARB, "glFramebufferTextureFaceARB"))
            return false;
        return true;
    }

    bool load_GL_ARB_half_float_vertex()
    {
        if(!extIsSupported("GL_ARB_half_float_vertex"))
            return false;
        return true;
    }

    bool load_GL_ARB_imaging()
    {
        if(!extIsSupported("GL_ARB_imaging"))
            return false;
        if(!bindExtFunc(cast(void**)&glColorTable, "glColorTable"))
            return false;
        if(!bindExtFunc(cast(void**)&glColorSubTable, "glColorSubTable"))
            return false;
        if(!bindExtFunc(cast(void**)&glColorTableParameteriv, "glColorTableParameteriv"))
            return false;
        if(!bindExtFunc(cast(void**)&glColorTableParameterfv, "glColorTableParameterfv"))
            return false;
        if(!bindExtFunc(cast(void**)&glCopyColorSubTable, "glCopyColorSubTable"))
            return false;
        if(!bindExtFunc(cast(void**)&glCopyColorTable, "glCopyColorTable"))
            return false;
        if(!bindExtFunc(cast(void**)&glGetColorTable, "glGetColorTable"))
            return false;
        if(!bindExtFunc(cast(void**)&glGetColorTableParameterfv, "glGetColorTableParameterfv"))
            return false;
        if(!bindExtFunc(cast(void**)&glGetColorTableParameteriv, "glGetColorTableParameteriv"))
            return false;
        if(!bindExtFunc(cast(void**)&glHistogram, "glHistogram"))
            return false;
        if(!bindExtFunc(cast(void**)&glResetHistogram, "glResetHistogram"))
            return false;
        if(!bindExtFunc(cast(void**)&glGetHistogram, "glGetHistogram"))
            return false;
        if(!bindExtFunc(cast(void**)&glGetHistogramParameterfv, "glGetHistogramParameterfv"))
            return false;
        if(!bindExtFunc(cast(void**)&glGetHistogramParameteriv, "glGetHistogramParameteriv"))
            return false;
        if(!bindExtFunc(cast(void**)&glMinmax, "glMinmax"))
            return false;
        if(!bindExtFunc(cast(void**)&glResetMinmax, "glResetMinmax"))
            return false;
        if(!bindExtFunc(cast(void**)&glGetMinmax, "glGetMinmax"))
            return false;
        if(!bindExtFunc(cast(void**)&glGetMinmaxParameterfv, "glGetMinmaxParameterfv"))
            return false;
        if(!bindExtFunc(cast(void**)&glGetMinmaxParameteriv, "glGetMinmaxParameteriv"))
            return false;
        if(!bindExtFunc(cast(void**)&glConvolutionFilter1D, "glConvolutionFilter1D"))
            return false;
        if(!bindExtFunc(cast(void**)&glConvolutionFilter2D, "glConvolutionFilter2D"))
            return false;
        if(!bindExtFunc(cast(void**)&glConvolutionParameterf, "glConvolutionParameterf"))
            return false;
        if(!bindExtFunc(cast(void**)&glConvolutionParameterfv, "glConvolutionParameterfv"))
            return false;
        if(!bindExtFunc(cast(void**)&glConvolutionParameteri, "glConvolutionParameteri"))
            return false;
        if(!bindExtFunc(cast(void**)&glConvolutionParameteriv, "glConvolutionParameteriv"))
            return false;
        if(!bindExtFunc(cast(void**)&glCopyConvolutionFilter1D, "glCopyConvolutionFilter1D"))
            return false;
        if(!bindExtFunc(cast(void**)&glCopyConvolutionFilter2D, "glCopyConvolutionFilter2D"))
            return false;
        if(!bindExtFunc(cast(void**)&glGetConvolutionFilter, "glGetConvolutionFilter"))
            return false;
        if(!bindExtFunc(cast(void**)&glGetConvolutionParameterfv, "glGetConvolutionParameterfv"))
            return false;
        if(!bindExtFunc(cast(void**)&glGetConvolutionParameteriv, "glGetConvolutionParameteriv"))
            return false;
        if(!bindExtFunc(cast(void**)&glSeparableFilter2D, "glSeparableFilter2D"))
            return false;
        if(!bindExtFunc(cast(void**)&glGetSeparableFilter, "glGetSeparableFilter"))
            return false;
        return true;
    }

    bool load_GL_ARB_instanced_arrays()
    {
        if(!extIsSupported("GL_ARB_instanced_arrays"))
            return false;
        if(!bindExtFunc(cast(void**)&glVertexAttribDivisorARB, "glVertexAttribDivisorARB"))
            return false;
        return true;
    }

    bool load_GL_ARB_map_buffer_range()
    {
        if(!extIsSupported("GL_ARB_map_buffer_range"))
            return false;
        if(!bindExtFunc(cast(void**)&glMapBufferRange, "glMapBufferRange"))
            return false;
        if(!bindExtFunc(cast(void**)&glFlushMappedBufferRange, "glFlushMappedBufferRange"))
            return false;
        return true;
    }

    bool load_GL_ARB_texture_buffer_object()
    {
        if(!extIsSupported("GL_ARB_texture_buffer_object"))
            return false;
        if(!bindExtFunc(cast(void**)&glTexBufferARB, "glTexBufferARB"))
            return false;
        return true;
    }

    bool load_GL_ARB_texture_compression_rgtc()
    {
        if(!extIsSupported("GL_ARB_texture_compression_rgtc"))
            return false;
        return true;
    }

    bool load_GL_ARB_teture_rg()
    {
        if(!extIsSupported("GL_ARB_teture_rg"))
            return false;
        return true;
    }

    bool load_GL_ARB_vertex_array_object()
    {
        if(!extIsSupported("GL_ARB_vertex_array_object"))
            return false;
        if(!bindExtFunc(cast(void**)&glBindVertexArray, "glBindVertexArray"))
            return false;
        if(!bindExtFunc(cast(void**)&glDeleteVertexArrays, "glDeleteVertexArrays"))
            return false;
        if(!bindExtFunc(cast(void**)&glGenVertexArrays, "glGenVertexArrays"))
            return false;
        if(!bindExtFunc(cast(void**)&glIsVertexArray, "glIsVertexArray"))
            return false;
        return true;
    }

    bool load_GL_ARB_uniform_buffer_object()
    {
        if(!extIsSupported("GL_ARB_uniform_buffer_object"))
            return false;
        if(!bindExtFunc(cast(void**)&glGetUniformIndicesARB, "glGetUniformIndicesARB"))
            return false;
        if(!bindExtFunc(cast(void**)&glGetActiveUniformsARB, "glGetActiveUniformsARB"))
            return false;
        if(!bindExtFunc(cast(void**)&glGetActiveUniformNameARB, "glGetActiveUniformNameARB"))
            return false;
        if(!bindExtFunc(cast(void**)&glGetUinformBlockIndexARB, "glGetUinformBlockIndexARB"))
            return false;
        if(!bindExtFunc(cast(void**)&glGetActiveUniformBlockivARB, "glGetActiveUniformBlockivARB"))
            return false;
        if(!bindExtFunc(cast(void**)&glGetActiveUniformBlockNameARB, "glGetActiveUniformBlockNameARB"))
            return false;
        if(!bindExtFunc(cast(void**)&glBindBufferRange, "glBindBufferRange"))
            return false;
        if(!bindExtFunc(cast(void**)&glBindBufferBase, "glBindBufferBase"))
            return false;
        if(!bindExtFunc(cast(void**)&glGetIntegeri_v, "glGetIntegeri_v"))
            return false;
        if(!bindExtFunc(cast(void**)&glUniformBlockBindingARB, "glUniformBlockBindingARB"))
            return false;
        return true;
    }
}
