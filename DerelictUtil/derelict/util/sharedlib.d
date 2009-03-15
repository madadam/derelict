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
 * * Neither the names 'Derelict', 'DerelictUtil', nor the names of its contributors
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
module derelict.util.sharedlib;

private
{
    import derelict.util.exception;
    import derelict.util.compat;
}

version(linux)
{
    version = Nix;
}
else version(darwin)
{
    version = Nix;
}
else version(OSX)
{
    version = Nix;
}
else version(Unix)
{
    version = Nix;
}
else version(Posix)
{
    version = Nix;
}

version(Nix)
{
    // for people using DSSS, tell it to link the executable with libdl
    version(build)
    {
        pragma(link, "dl");
    }

    version(Tango)
    {
        private import tango.sys.Common;
    }
    else version(linux)
    {
        private import std.c.linux.linux;
    }
    else
    {
        extern(C)
        {
            /* From <dlfcn.h>
            *  See http://www.opengroup.org/onlinepubs/007908799/xsh/dlsym.html
            */

            const int RTLD_NOW = 2;

            void *dlopen(CCPTR file, int mode);
            int dlclose(void* handle);
            void *dlsym(void* handle, CCPTR name);
            CCPTR dlerror();
        }

        alias void* SharedLibHandle;

        private SharedLibHandle LoadSharedLib(string libName)
        {
            return dlopen(toCString(libName), RTLD_NOW);
        }

        private void UnloadSharedLib(SharedLibHandle hlib)
        {
            dlclose(hlib);
        }

        private void* GetSymbol(SharedLibHandle hlib, string symbolName)
        {
            return dlsym(hlib, toCString(symbolName));
        }

        private string GetErrorStr()
        {
            CCPTR err = dlerror();
            if(err is null)
                return "Uknown Error";

            return toDString(err);
        }
    }
}
else version(Windows)
{
    private import derelict.util.wintypes;
    alias HMODULE SharedLibHandle;

    private SharedLibHandle LoadSharedLib(string libName)
    {
        return LoadLibraryA(toCString(libName));
    }

    private void UnloadSharedLib(SharedLibHandle hlib)
    {
        FreeLibrary(hlib);
    }

    private void* GetSymbol(SharedLibHandle hlib, string symbolName)
    {
        return GetProcAddress(hlib, toCString(symbolName));
    }

    private string GetErrorStr()
    {
        // adapted from Tango

        DWORD errcode = GetLastError();

        LPCSTR msgBuf;
        DWORD i = FormatMessageA(
            FORMAT_MESSAGE_ALLOCATE_BUFFER |
            FORMAT_MESSAGE_FROM_SYSTEM |
            FORMAT_MESSAGE_IGNORE_INSERTS,
            null,
            errcode,
            MAKELANGID(LANG_NEUTRAL, SUBLANG_DEFAULT),
            cast(LPCSTR)&msgBuf,
            0,
            null);

        string text = toDString(msgBuf);
        LocalFree(cast(HLOCAL)msgBuf);

        if(i >= 2)
            i -= 2;
        return text[0 .. i];
    }
}
else
{
    static assert(0, "Derelict does not support this platform.");
}

final class SharedLib
{
public:
    this()
    {
    }

    string name()
    {
        return _name;
    }

    bool isLoaded()
    {
        return (_hlib !is null);
    }

    void load(string[] names)
    {
        if(isLoaded)
            return;

        string[] failedLibs;
        string[] reasons;

        foreach(n; names)
        {
            _hlib = LoadSharedLib(n);
            if(_hlib is null)
            {
                failedLibs ~= n;
                reasons ~= GetErrorStr();
                continue;
            }
            _name = n;
            break;
        }

        if(!isLoaded)
        {
            SharedLibLoadException.throwNew(failedLibs, reasons);
        }
    }

    void* loadSymbol(string symbolName)
    {
        void* sym = GetSymbol(_hlib, symbolName);
        if(sym is null)
            Derelict_HandleMissingSymbol(name, symbolName);

        return sym;
    }

    void unload()
    {
        if(isLoaded)
        {
            UnloadSharedLib(_hlib);
            _hlib = null;
        }
    }

private:
    string _name;
    SharedLibHandle _hlib;
}