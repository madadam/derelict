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
module derelict.sdl.net;

private
{
    import derelict.sdl.sdl;
    import derelict.util.loader;
    import derelict.util.exception;
    import derelict.util.compat;
}

enum : Uint8
{
    SDL_NET_MAJOR_VERSION           = 1,
    SDL_NET_MINOR_VERSION           = 2,
    SDL_NET_PATCHLEVEL              = 7,
}

struct IPaddress
{
    Uint32 host;
    Uint16 port;
}

typedef void* TCPsocket;

enum : uint
{
    INADDR_ANY              = 0x00000000,
    INADDR_NONE             = 0xFFFFFFFF,
    INADDR_BROADCAST        = 0xFFFFFFFF,
    SDLNET_MAX_UDPCHANNELS  = 32,
    SDLNET_MAX_UDPADDRESSES = 4,
}

typedef void* UDPsocket;

struct UDPpacket
{
    int channel;
    Uint8 *data;
    int len;
    int maxlen;
    int status;
    IPaddress address;
}

typedef void* SDLNet_SocketSet;

struct _SDLNet_GenericSocket
{
    int ready;
}
alias _SDLNet_GenericSocket* SDLNet_GenericSocket;

alias SDL_SetError SDLNet_SetError;
alias SDL_GetError SDLNet_GetError;

void SDL_NET_VERSION(SDL_version* X)
{
    X.major = SDL_NET_MAJOR_VERSION;
    X.minor = SDL_NET_MINOR_VERSION;
    X.patch = SDL_NET_PATCHLEVEL;
}

int SDLNet_TCP_AddSocket(SDLNet_SocketSet set, TCPsocket sock)
{
    return SDLNet_AddSocket(set, cast(SDLNet_GenericSocket)sock);
}

int SDLNet_TCP_DelSocket(SDLNet_SocketSet set, TCPsocket sock)
{
    return SDLNet_DelSocket(set, cast(SDLNet_GenericSocket)sock);
}

int SDLNet_UDP_AddSocket(SDLNet_SocketSet set, UDPsocket sock)
{
    return SDLNet_AddSocket(set, cast(SDLNet_GenericSocket)sock);
}

int SDLNet_UDP_DelSocket(SDLNet_SocketSet set, UDPsocket sock)
{
    return SDLNet_DelSocket(set, cast(SDLNet_GenericSocket)sock);
}

bool SDLNet_SocketReady(TCPsocket sock)
{
    return cast(bool)((sock !is null) && (cast(SDLNet_GenericSocket)sock).ready);
}

bool SDLNet_SocketReady(UDPsocket sock)
{
    return cast(bool)((sock !is null) && (cast(SDLNet_GenericSocket)sock).ready);
}

void SDLNet_Write16(Uint16 value, void* areap)
{
    Uint16* areap16 = cast(Uint16*)areap;
    *areap16 = SDL_SwapBE16(value);
}

Uint16 SDLNet_Read16(void *areap)
{
    Uint16* areap16 = cast(Uint16*)areap;
    return SDL_SwapBE16(*areap16);
}

void SDLNet_Write32(Uint32 value, void* areap)
{
    Uint32* areap32 = cast(Uint32*)areap;
    *areap32 = SDL_SwapBE32(value);
}

Uint32 SDLNet_Read32(void* areap)
{
    Uint32* areap32 = cast(Uint32*)areap;
    return SDL_SwapBE32(*areap32);
}

extern(C)
{
    CSDLVERPTR function() SDLNet_Linked_Version;
    int function() SDLNet_Init;
    void function() SDLNet_Quit;
    int function(IPaddress*, in char*, Uint16) SDLNet_ResolveHost;
    CCPTR function(IPaddress*) SDLNet_ResolveIP;
    TCPsocket function(IPaddress*) SDLNet_TCP_Open;
    TCPsocket function(TCPsocket) SDLNet_TCP_Accept;
    IPaddress* function(TCPsocket) SDLNet_TCP_GetPeerAddress;
    int function(TCPsocket,in void*,int) SDLNet_TCP_Send;
    int function(TCPsocket,void*,int) SDLNet_TCP_Recv;
    void function(TCPsocket) SDLNet_TCP_Close;
    UDPpacket* function(int) SDLNet_AllocPacket;
    int function(UDPpacket*) SDLNet_ResizePacket;
    void function(UDPpacket*) SDLNet_FreePacket;
    UDPpacket** function(int,int) SDLNet_AllocPacketV;
    void function(UDPpacket**) SDLNet_FreePacketV;
    UDPsocket function(Uint16) SDLNet_UDP_Open;
    int function(UDPsocket,int,IPaddress*) SDLNet_UDP_Bind;
    void function(UDPsocket,int) SDLNet_UDP_Unbind;
    IPaddress* function(UDPsocket,int) SDLNet_UDP_GetPeerAddress;
    int function(UDPsocket,UDPpacket**,int) SDLNet_UDP_SendV;
    int function(UDPsocket,int,UDPpacket*) SDLNet_UDP_Send;
    int function(UDPsocket,UDPpacket**) SDLNet_UDP_RecvV;
    int function(UDPsocket,UDPpacket*) SDLNet_UDP_Recv;
    void function(UDPsocket) SDLNet_UDP_Close;
    SDLNet_SocketSet function(int) SDLNet_AllocSocketSet;
    int function(SDLNet_SocketSet,SDLNet_GenericSocket) SDLNet_AddSocket;
    int function(SDLNet_SocketSet,SDLNet_GenericSocket) SDLNet_DelSocket;
    int function(SDLNet_SocketSet,Uint32) SDLNet_CheckSockets;
    void function(SDLNet_SocketSet) SDLNet_FreeSocketSet;
}

class DerelictSDLNetLoader : SharedLibLoader
{
public:
    this()
    {
        super(
            "SDL_net.dll",
            "libSDL_net.so, libSDL_net-1.2.so, libSDL_net-1.2.so.0",
            "../Frameworks/SDL_net.framework/SDL_net, /Library/Frameworks/SDL_net.framework/SDL_net, /System/Library/Frameworks/SDL_net.framework/SDL_net"
        );
    }

protected:
    override void loadSymbols()
    {
        if(!DerelictSDL.isLoaded)
        {
            throw new SharedLibLoadException("DerelictSDL must be loaded before attempting to load DerelictSDLNet!");
        }

        bindFunc(cast(void**)&SDLNet_Linked_Version, "SDLNet_Linked_Version");
        bindFunc(cast(void**)&SDLNet_Init, "SDLNet_Init");
        bindFunc(cast(void**)&SDLNet_Quit, "SDLNet_Quit");
        bindFunc(cast(void**)&SDLNet_ResolveHost, "SDLNet_ResolveHost");
        bindFunc(cast(void**)&SDLNet_ResolveIP, "SDLNet_ResolveIP");
        bindFunc(cast(void**)&SDLNet_TCP_Open, "SDLNet_TCP_Open");
        bindFunc(cast(void**)&SDLNet_TCP_Accept, "SDLNet_TCP_Accept");
        bindFunc(cast(void**)&SDLNet_TCP_GetPeerAddress, "SDLNet_TCP_GetPeerAddress");
        bindFunc(cast(void**)&SDLNet_TCP_Send, "SDLNet_TCP_Send");
        bindFunc(cast(void**)&SDLNet_TCP_Recv, "SDLNet_TCP_Recv");
        bindFunc(cast(void**)&SDLNet_TCP_Close, "SDLNet_TCP_Close");
        bindFunc(cast(void**)&SDLNet_AllocPacket, "SDLNet_AllocPacket");
        bindFunc(cast(void**)&SDLNet_ResizePacket, "SDLNet_ResizePacket");
        bindFunc(cast(void**)&SDLNet_FreePacket, "SDLNet_FreePacket");
        bindFunc(cast(void**)&SDLNet_AllocPacketV, "SDLNet_AllocPacketV");
        bindFunc(cast(void**)&SDLNet_FreePacketV, "SDLNet_FreePacketV");
        bindFunc(cast(void**)&SDLNet_UDP_Open, "SDLNet_UDP_Open");
        bindFunc(cast(void**)&SDLNet_UDP_Bind, "SDLNet_UDP_Bind");
        bindFunc(cast(void**)&SDLNet_UDP_Unbind, "SDLNet_UDP_Unbind");
        bindFunc(cast(void**)&SDLNet_UDP_GetPeerAddress, "SDLNet_UDP_GetPeerAddress");
        bindFunc(cast(void**)&SDLNet_UDP_SendV, "SDLNet_UDP_SendV");
        bindFunc(cast(void**)&SDLNet_UDP_Send, "SDLNet_UDP_Send");
        bindFunc(cast(void**)&SDLNet_UDP_RecvV, "SDLNet_UDP_RecvV");
        bindFunc(cast(void**)&SDLNet_UDP_Recv, "SDLNet_UDP_Recv");
        bindFunc(cast(void**)&SDLNet_UDP_Close, "SDLNet_UDP_Close");
        bindFunc(cast(void**)&SDLNet_AllocSocketSet, "SDLNet_AllocSocketSet");
        bindFunc(cast(void**)&SDLNet_AddSocket, "SDLNet_AddSocket");
        bindFunc(cast(void**)&SDLNet_DelSocket, "SDLNet_DelSocket");
        bindFunc(cast(void**)&SDLNet_CheckSockets, "SDLNet_CheckSockets");
        bindFunc(cast(void**)&SDLNet_FreeSocketSet, "SDLNet_FreeSocketSet");
    }
}

DerelictSDLNetLoader DerelictSDLNet;

static this()
{
    DerelictSDLNet = new DerelictSDLNetLoader();
}

static ~this()
{
    DerelictSDLNet.unload();
}