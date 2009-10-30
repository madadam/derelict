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
module derelict.util.compat;

version(D_Version2)
{
	mixin("alias const(char)* CCPTR;");
}
else
{
	alias char* CCPTR;
}

version(Tango)
{
    private
    {
        import tango.stdc.string;
        import tango.stdc.stringz;        
        import tango.text.Util;
        import tango.core.Version;
    }
    
    alias char[] string;
}
else
{
    private
    {
	    version(D_Version2)
	    {
		    import std.conv;
	    }
        import std.string;
        import std.c.string;
    }
}

CCPTR toCString(string str)
{
    return toStringz(str);
}

string toDString(CCPTR cstr)
{
    version(Tango)
    {
	    return fromStringz(cstr);
    }
    else
    {
	    version(D_Version2)
	    {
	    	mixin("return to!string(cstr);");
    	}
    	else
    	{
        	return toString(cstr);
    	}
    }
}

int findStr(string str, string match)
{
    version(Tango)
    {
        int i = locatePattern(str, match);
        return (i == str.length) ? -1 : i;
    }
    else
    {
	    version(D_Version2)
	    {
		    mixin("return indexOf(str, match);");
	    }
	    else
	    {
        	return find(str, match);
    	}
    }
}

string[] splitStr(string str, string delim)
{
    return split(str, delim);
}

string stripWhiteSpace(string str)
{
    version(Tango)
    {
        return trim(str);
    }
    else
    {
        return strip(str);
    }
}

