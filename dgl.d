module dgl;

version(Windows)
{
	pragma(lib, "lib\\DerelictGL.lib");
	pragma(lib, "lib\\DerelictGLU.lib");
	pragma(lib, "lib\\DerelictSDL.lib");
	pragma(lib, "lib\\DerelictUtil.lib");
}
else
{
	pragma(lib, "lib/libDerelictGL.a");
	pragma(lib, "lib/libDerelictGLU.a");
	pragma(lib, "lib/libDerelictSDL.a");
	pragma(lib, "lib/libDerelictUtil.a");
}

import derelict.sdl.sdl;
//import derelict.sdl.image;
//import derelict.sdl.mixer;
//import derelict.sdl.net;
//import derelict.sdl.ttf;
import derelict.opengl.gl;
import derelict.opengl.glu;
import derelict.util.compat;
import std.stdio;

version(D_Version2) {}
else
{
	alias writefln writeln;
}

void dumpver(string sdlLib, CSDLVERPTR ver)
{
	writefln("%s version: %d.%d.%d", sdlLib, ver.major, ver.minor, ver.patch);
}

void main()
{
	DerelictSDL.load();
	DerelictGL.load();
	DerelictGLU.load();
//	DerelictSDLImage.load();
//	DerelictSDLMixer.load();
//	DerelictSDLNet.load();
//	DerelictSDLttf.load();
	
	if(SDL_Init(SDL_INIT_VIDEO) < 0)
	{
		throw new Exception("Couldn't init SDL: " ~ toDString(SDL_GetError()));
	}	
	scope(exit) 
	{
		if(SDL_Quit !is null)
			SDL_Quit();
	}
	
	SDL_GL_SetAttribute(SDL_GL_BUFFER_SIZE, 32);
	SDL_GL_SetAttribute(SDL_GL_DEPTH_SIZE, 16);
	SDL_GL_SetAttribute(SDL_GL_DOUBLEBUFFER, 1);
	
	if(SDL_SetVideoMode(1024, 768, 0, SDL_OPENGL) == null)
	{
		throw new Exception("Failed to set video mode: " ~ toDString(SDL_GetError()));
	}
	
	CSDLVERPTR sdlver = SDL_Linked_Version();
	dumpver("SDL", sdlver);
/*	
	sdlver = IMG_Linked_Version();
	dumpver("SDL_image", sdlver);
	
	sdlver = Mix_Linked_Version();
	dumpver("SDL_mixer", sdlver);
	
	sdlver = SDLNet_Linked_Version();
	dumpver("SDL_net", sdlver);
	
	sdlver = TTF_Linked_Version();
	dumpver("SDL_ttf", sdlver);
*/	
	GLVersion ver = DerelictGL.loadExtendedVersions(GLVersion.GL21);
	writefln("Max GL version = %s", DerelictGL.versionToString(ver));
	
	string glver = toDString(glGetString(GL_VERSION));
	writefln("GL version string = %s", glver);
	
	string gluver = toDString(gluGetString(GLU_VERSION));
	writefln("GLU version string = %s", gluver);
	
	DerelictGL.loadExtensions();

	writeln("Loaded OpenGL Extensions:");
	string[] extlist = DerelictGL.loadedExtensionNames;
	foreach(s; extlist)
		writefln("\t%s", s);
		
	writeln("Not Loaded OpenGL Extensions:");
	extlist = DerelictGL.notLoadedExtensionNames;
	foreach(s; extlist)
		writefln("\t%s", s);
		
	glClearColor(0.0, 0.0, 1.0, 1.0);
	
	bool running = true;
	
	while(running)
	{
		SDL_Event event;
		while(SDL_PollEvent(&event))
		{
			switch(event.type)
			{
				case SDL_KEYDOWN:
					if(SDLK_ESCAPE == event.key.keysym.sym)
					{
						running = false;
					}
					break;
				case SDL_QUIT:
					running = false;
					break;
				default:
					break;
			
			}
		}
		glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
		SDL_GL_SwapBuffers();
		SDL_Delay(1);
	}
}