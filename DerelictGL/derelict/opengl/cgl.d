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
module derelict.opengl.cgl;

// Original version: 2008-04-03 by Hugues De Keyzer

// Original C headers:
//     OpenGL.h
//     CGLTypes.h
//     CGLCurrent.h
// from /System/Library/Frameworks/OpenGL.framework/Headers from Mac OS X 10.4

version(darwin)
{
    version = CGL;
}
else version(OSX)
{
    version = CGL;
}

version (CGL)
{

    private
    {
        import derelict.opengl.gltypes;
        import derelict.util.compat;
        import derelict.util.loader;
    }

    /*
    ** CGLContext structure.
    */
    struct _CGLContextObject {}

    struct _CGLPixelFormatObject {}
    struct _CGLRendererInfoObject {}
    struct _CGLPBufferObject {}

    /*
    ** CGL opaque data.
    */
    typedef _CGLContextObject*              CGLContextObj;
    typedef _CGLPixelFormatObject*          CGLPixelFormatObj;
    typedef _CGLRendererInfoObject*         CGLRendererInfoObj;
    typedef _CGLPBufferObject*              CGLPBufferObj;

    /*
    ** Attribute names for CGLChoosePixelFormat and CGLDescribePixelFormat.
    */
    enum CGLPixelFormatAttribute
    {
        kCGLPFAAllRenderers       =   1,    /* choose from all available renderers          */
        kCGLPFADoubleBuffer       =   5,    /* choose a double buffered pixel format        */
        kCGLPFAStereo             =   6,    /* stereo buffering supported                   */
        kCGLPFAAuxBuffers         =   7,    /* number of aux buffers                        */
        kCGLPFAColorSize          =   8,    /* number of color buffer bits                  */
        kCGLPFAAlphaSize          =  11,    /* number of alpha component bits               */
        kCGLPFADepthSize          =  12,    /* number of depth buffer bits                  */
        kCGLPFAStencilSize        =  13,    /* number of stencil buffer bits                */
        kCGLPFAAccumSize          =  14,    /* number of accum buffer bits                  */
        kCGLPFAMinimumPolicy      =  51,    /* never choose smaller buffers than requested  */
        kCGLPFAMaximumPolicy      =  52,    /* choose largest buffers of type requested     */
        kCGLPFAOffScreen          =  53,    /* choose an off-screen capable renderer        */
        kCGLPFAFullScreen         =  54,    /* choose a full-screen capable renderer        */
        kCGLPFASampleBuffers      =  55,    /* number of multi sample buffers               */
        kCGLPFASamples            =  56,    /* number of samples per multi sample buffer    */
        kCGLPFAAuxDepthStencil    =  57,    /* each aux buffer has its own depth stencil    */
        kCGLPFAColorFloat         =  58,    /* color buffers store floating point pixels    */
        kCGLPFAMultisample        =  59,    /* choose multisampling                         */
        kCGLPFASupersample        =  60,    /* choose supersampling                         */
        kCGLPFASampleAlpha        =  61,    /* request alpha filtering                      */

        kCGLPFARendererID         =  70,    /* request renderer by ID                       */
        kCGLPFASingleRenderer     =  71,    /* choose a single renderer for all screens     */
        kCGLPFANoRecovery         =  72,    /* disable all failure recovery systems         */
        kCGLPFAAccelerated        =  73,    /* choose a hardware accelerated renderer       */
        kCGLPFAClosestPolicy      =  74,    /* choose the closest color buffer to request   */
        kCGLPFARobust             =  75,    /* renderer does not need failure recovery      */
        kCGLPFABackingStore       =  76,    /* back buffer contents are valid after swap    */
        kCGLPFAMPSafe             =  78,    /* renderer is multi-processor safe             */
        kCGLPFAWindow             =  80,    /* can be used to render to an onscreen window  */
        kCGLPFAMultiScreen        =  81,    /* single window can span multiple screens      */
        kCGLPFACompliant          =  83,    /* renderer is opengl compliant                 */
        kCGLPFADisplayMask        =  84,    /* mask limiting supported displays             */
        kCGLPFAPBuffer            =  90,    /* can be used to render to a pbuffer           */
        kCGLPFARemotePBuffer      =  91,    /* can be used to render offline to a pbuffer   */
        kCGLPFAVirtualScreenCount = 128     /* number of virtual screens in this format     */
    }

    /*
    ** Property names for CGLDescribeRenderer.
    */
    enum CGLRendererProperty
    {
        kCGLRPOffScreen           =  53,
        kCGLRPFullScreen          =  54,
        kCGLRPRendererID          =  70,
        kCGLRPAccelerated         =  73,
        kCGLRPRobust              =  75,
        kCGLRPBackingStore        =  76,
        kCGLRPMPSafe              =  78,
        kCGLRPWindow              =  80,
        kCGLRPMultiScreen         =  81,
        kCGLRPCompliant           =  83,
        kCGLRPDisplayMask         =  84,
        kCGLRPBufferModes         = 100,    /* a bitfield of supported buffer modes          */
        kCGLRPColorModes          = 103,    /* a bitfield of supported color buffer formats  */
        kCGLRPAccumModes          = 104,    /* a bitfield of supported accum buffer formats  */
        kCGLRPDepthModes          = 105,    /* a bitfield of supported depth buffer depths   */
        kCGLRPStencilModes        = 106,    /* a bitfield of supported stencil buffer depths */
        kCGLRPMaxAuxBuffers       = 107,    /* maximum number of auxilliary buffers          */
        kCGLRPMaxSampleBuffers    = 108,    /* maximum number of sample buffers              */
        kCGLRPMaxSamples          = 109,    /* maximum number of samples                     */
        kCGLRPSampleModes         = 110,    /* a bitfield of supported sample modes          */
        kCGLRPSampleAlpha         = 111,    /* support for alpha sampling                    */
        kCGLRPVideoMemory         = 120,    /* total video memory                            */
        kCGLRPTextureMemory       = 121,    /* video memory useable for texture storage      */
        kCGLRPGPUVertProcCapable  = 122,    /* renderer capable of GPU vertex processing     */
        kCGLRPGPUFragProcCapable  = 123,    /* renderer capable of GPU fragment processing   */
        kCGLRPRendererCount       = 128     /* the number of renderers in this renderer info */
    }

    /*
    ** Enable names for CGLEnable, CGLDisable, and CGLIsEnabled.
    */
    enum CGLContextEnable
    {
        kCGLCESwapRectangle    = 201,   /* Enable or disable the swap rectangle          */
        kCGLCESwapLimit        = 203,   /* Enable or disable the swap async limit        */
        kCGLCERasterization    = 221,   /* Enable or disable all rasterization           */
        kCGLCEStateValidation  = 301,   /* Validate state for multi-screen functionality */
        kCGLCESurfaceBackingSize = 305, /* Enable or disable surface backing size override */
        kCGLCEDisplayListOptimization = 307,  /* Ability to turn off display list optimizer */
        kCGLCEMPEngine = 313            /* Enable or disable multi-threaded GL engine    */
    }

    /*
    ** Parameter names for CGLSetParameter and CGLGetParameter.
    */
    enum CGLContextParameter
    {
        kCGLCPSwapRectangle     = 200,  /* 4 params.  Set or get the swap rectangle {x, y, w, h}  */
        kCGLCPSwapInterval      = 222,  /* 1 param.   0 -> Don't sync, n -> Sync every n retrace  */
        kCGLCPDispatchTableSize = 224,  /* 1 param.   Get the dispatch table size                 */
        /* Note: kCGLCPClientStorage is always a pointer-sized parameter, even though the API claims GLint. */
        kCGLCPClientStorage     = 226,  /* 1 param.   Context specific generic storage            */
        kCGLCPSurfaceTexture    = 228,  /* 3 params.  SID, target, internal_format                */
    /*  - Used by AGL - */
    /*  AGL_STATE_VALIDATION     230    */
    /*  AGL_BUFFER_NAME          231    */
    /*  AGL_ORDER_CONTEXT_TO_FRONT  232 */
    /*  AGL_CONTEXT_SURFACE_ID   233    */
    /*  AGL_CONTEXT_DISPLAY_ID   234    */
        kCGLCPSurfaceOrder      = 235,  /* 1 param.   1 -> Above window, -1 -> Below Window       */
        kCGLCPSurfaceOpacity    = 236,  /* 1 param.   1 -> Surface is opaque (default), 0 -> non-opaque */
    /*  - Used by AGL - */
    /*  AGL_CLIP_REGION          254   */
    /*  AGL_FS_CAPTURE_SINGLE    255   */
        kCGLCPSurfaceBackingSize = 304,     /* 2 params.   Width/height of surface backing size     */
    /* AGL_SURFACE_VOLATILE      306    */
        kCGLCPSurfaceSurfaceVolatile = 306, /* 1 param.   Surface volatile state                    */
        kCGLCPReclaimResources       = 308, /* 0 params.  */
        kCGLCPCurrentRendererID      = 309, /* 1 param.   Retrieves the current renderer ID         */
        kCGLCPGPUVertexProcessing    = 310, /* 1 param.   Currently processing vertices with GPU (get) */
        kCGLCPGPUFragmentProcessing  = 311, /* 1 param.   Currently processing fragments with GPU (get) */
    }

    /*
    ** Option names for CGLSetOption and CGLGetOption.
    */
    enum CGLGlobalOption
    {
        kCGLGOFormatCacheSize  = 501,   /* Set the size of the pixel format cache        */
        kCGLGOClearFormatCache = 502,   /* Reset the pixel format cache if true          */
        kCGLGORetainRenderers  = 503,   /* Whether to retain loaded renderers in memory  */
        kCGLGOResetLibrary     = 504,   /* *** DEPRECATED in MacOS X 10.4 ***            */
                                        /* Do a soft reset of the CGL library if true    */
        kCGLGOUseErrorHandler  = 505,   /* Call the Core Graphics handler on CGL errors  */
    }

    /*
    ** Error return values from CGLGetError.
    */
    enum CGLError
    {
        kCGLNoError            = 0,     /* no error */
        kCGLBadAttribute       = 10000, /* invalid pixel format attribute  */
        kCGLBadProperty        = 10001, /* invalid renderer property       */
        kCGLBadPixelFormat     = 10002, /* invalid pixel format            */
        kCGLBadRendererInfo    = 10003, /* invalid renderer info           */
        kCGLBadContext         = 10004, /* invalid context                 */
        kCGLBadDrawable        = 10005, /* invalid drawable                */
        kCGLBadDisplay         = 10006, /* invalid graphics device         */
        kCGLBadState           = 10007, /* invalid context state           */
        kCGLBadValue           = 10008, /* invalid numerical value         */
        kCGLBadMatch           = 10009, /* invalid share context           */
        kCGLBadEnumeration     = 10010, /* invalid enumerant               */
        kCGLBadOffScreen       = 10011, /* invalid offscreen drawable      */
        kCGLBadFullScreen      = 10012, /* invalid offscreen drawable      */
        kCGLBadWindow          = 10013, /* invalid window                  */
        kCGLBadAddress         = 10014, /* invalid pointer                 */
        kCGLBadCodeModule      = 10015, /* invalid code module             */
        kCGLBadAlloc           = 10016, /* invalid memory allocation       */
        kCGLBadConnection      = 10017  /* invalid CoreGraphics connection */
    }


    extern (C)
    {

        mixin(gsharedString!() ~"
        /*
        ** Pixel format functions
        */
        CGLError function(CGLPixelFormatAttribute*, CGLPixelFormatObj*, int*) CGLChoosePixelFormat;
        CGLError function(CGLPixelFormatObj) CGLDestroyPixelFormat;
        CGLError function(CGLPixelFormatObj, int, CGLPixelFormatAttribute, int*) CGLDescribePixelFormat;

        /*
        ** Renderer information functions
        */
        CGLError function(uint, CGLRendererInfoObj*, int*) CGLQueryRendererInfo;
        CGLError function(CGLRendererInfoObj) CGLDestroyRendererInfo;
        CGLError function(CGLRendererInfoObj, int, CGLRendererProperty, int*) CGLDescribeRenderer;

        /*
        ** Context functions
        */
        CGLError function(CGLPixelFormatObj, CGLContextObj, CGLContextObj*) CGLCreateContext;
        CGLError function(CGLContextObj) CGLDestroyContext;
        CGLError function(CGLContextObj, CGLContextObj, uint) CGLCopyContext;

        /*
        ** PBuffer functions
        */
        // FIXME
        // These functions use the AVAILABLE_MAC_OS_X_VERSION_10_3_AND_LATER macro. See
        // <AvailabilityMacros.h>.
        version (Mac_OS_X_10_3_and_later)
        {
        CGLError function(int, int, uint, uint, int, CGLPBufferObj*) CGLCreatePBuffer;
        CGLError function(CGLPBufferObj) CGLDestroyPBuffer;
        CGLError function(CGLPBufferObj, int*, int*, uint*, uint*, int*) CGLDescribePBuffer;
        CGLError function(CGLContextObj, CGLPBufferObj, uint) CGLTexImagePBuffer;
        }

        /*
        ** Drawable Functions
        */
        CGLError function(CGLContextObj, int, int, int, void*) CGLSetOffScreen;
        CGLError function(CGLContextObj, int*, int*, int*, void **baseaddr) CGLGetOffScreen;
        CGLError function(CGLContextObj) CGLSetFullScreen;

        version (Mac_OS_X_10_3_and_later)
        {
        CGLError function(CGLContextObj, CGLPBufferObj, uint, int, int) CGLSetPBuffer;
        CGLError function(CGLContextObj, CGLPBufferObj*, uint*, int*, int*) CGLGetPBuffer;
        }

        CGLError function(CGLContextObj) CGLClearDrawable;
        CGLError function(CGLContextObj) CGLFlushDrawable;

        /*
        ** Per context enables and parameters
        */
        CGLError function(CGLContextObj, CGLContextEnable) CGLEnable;
        CGLError function(CGLContextObj, CGLContextEnable) CGLDisable;
        CGLError function(CGLContextObj, CGLContextEnable, int*) CGLIsEnabled;
        CGLError function(CGLContextObj, CGLContextParameter, int*) CGLSetParameter;
        CGLError function(CGLContextObj, CGLContextParameter, int*) CGLGetParameter;

        /*
        ** Virtual screen functions
        */
        CGLError function(CGLContextObj, int) CGLSetVirtualScreen;
        CGLError function(CGLContextObj, int*) CGLGetVirtualScreen;

        /*
        ** Global library options
        */
        CGLError function(CGLGlobalOption, int) CGLSetOption;
        CGLError function(CGLGlobalOption, int*) CGLGetOption;

        /*
        ** Locking functions
        */
        version (Mac_OS_X_10_4_and_later)
        {
        CGLError function(CGLContextObj) CGLLockContext;
        CGLError function(CGLContextObj) CGLUnlockContext;
        }

        /*
        ** Version numbers
        */
        void function(int*, int*) CGLGetVersion;

        /*
        ** Convert an error code to a string
        */
        char* function(CGLError) CGLErrorString;

        /*
        ** Current context functions
        */
        CGLError function(CGLContextObj) CGLSetCurrentContext;
        CGLContextObj function() CGLGetCurrentContext;");
    }

    package
    {
        void loadPlatformGL(void delegate(void**, string) bindFunc)
        {
            bindFunc(cast(void**)&CGLSetCurrentContext, "CGLSetCurrentContext");
            bindFunc(cast(void**)&CGLGetCurrentContext, "CGLGetCurrentContext");
            /*
            ** Pixel format functions
            */
            bindFunc(cast(void**)&CGLChoosePixelFormat, "CGLChoosePixelFormat");
            bindFunc(cast(void**)&CGLDestroyPixelFormat, "CGLDestroyPixelFormat");
            bindFunc(cast(void**)&CGLDescribePixelFormat, "CGLDescribePixelFormat");

            /*
            ** Renderer information functions
            */
            bindFunc(cast(void**)&CGLQueryRendererInfo, "CGLQueryRendererInfo");
            bindFunc(cast(void**)&CGLDestroyRendererInfo, "CGLDestroyRendererInfo");
            bindFunc(cast(void**)&CGLDescribeRenderer, "CGLDescribeRenderer");

            /*
            ** Context functions
            */
            bindFunc(cast(void**)&CGLCreateContext, "CGLCreateContext");
            bindFunc(cast(void**)&CGLDestroyContext, "CGLDestroyContext");
            bindFunc(cast(void**)&CGLCopyContext, "CGLCopyContext");

            /*
            ** PBuffer functions
            */
            // FIXME
            // These functions use the AVAILABLE_MAC_OS_X_VERSION_10_3_AND_LATER macro. See
            // <AvailabilityMacros.h>.
            version (Mac_OS_X_10_3_and_later)
            {
                bindFunc(cast(void**)&CGLCreatePBuffer, "CGLCreatePBuffer");

                bindFunc(cast(void**)&CGLDestroyPBuffer, "CGLDestroyPBuffer");

                bindFunc(cast(void**)&CGLDescribePBuffer, "CGLDescribePBuffer");

                bindFunc(cast(void**)&CGLTexImagePBuffer, "CGLTexImagePBuffer");
            }

            /*
            ** Drawable Functions
            */
            bindFunc(cast(void**)&CGLSetOffScreen, "CGLSetOffScreen");
            bindFunc(cast(void**)&CGLGetOffScreen, "CGLGetOffScreen");
            bindFunc(cast(void**)&CGLSetFullScreen, "CGLSetFullScreen");

            version (Mac_OS_X_10_3_and_later)
            {
                bindFunc(cast(void**)&CGLSetPBuffer, "CGLSetPBuffer");

                bindFunc(cast(void**)&CGLGetPBuffer, "CGLGetPBuffer");
            }

            bindFunc(cast(void**)&CGLClearDrawable, "CGLClearDrawable");
            bindFunc(cast(void**)&CGLFlushDrawable, "CGLFlushDrawable");

            /*
            ** Per context enables and parameters
            */
            bindFunc(cast(void**)&CGLEnable, "CGLEnable");
            bindFunc(cast(void**)&CGLDisable, "CGLDisable");
            bindFunc(cast(void**)&CGLIsEnabled, "CGLIsEnabled");
            bindFunc(cast(void**)&CGLSetParameter, "CGLSetParameter");
            bindFunc(cast(void**)&CGLGetParameter, "CGLGetParameter");

            /*
            ** Virtual screen functions
            */
            bindFunc(cast(void**)&CGLSetVirtualScreen, "CGLSetVirtualScreen");
            bindFunc(cast(void**)&CGLGetVirtualScreen, "CGLGetVirtualScreen");

            /*
            ** Global library options
            */
            bindFunc(cast(void**)&CGLSetOption, "CGLSetOption");
            bindFunc(cast(void**)&CGLGetOption, "CGLGetOption");

            /*
            ** Locking functions
            */
            version (Mac_OS_X_10_4_and_later)
            {
                bindFunc(cast(void**)&CGLLockContext, "CGLLockContext");

                bindFunc(cast(void**)&CGLUnlockContext, "CGLUnlockContext");
            }

            /*
            ** Version numbers
            */
            bindFunc(cast(void**)&CGLGetVersion, "CGLGetVersion");

            /*
            ** Convert an error code to a string
            */
            bindFunc(cast(void**)&CGLErrorString, "CGLErrorString");

            /*
            ** Current context functions
            */
            bindFunc(cast(void**)&CGLSetCurrentContext, "CGLSetCurrentContext");
            bindFunc(cast(void**)&CGLGetCurrentContext, "CGLGetCurrentContext");
        }

    }
}// version(CGL)
