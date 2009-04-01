module dgl;

pragma(lib, "lib\\DerelictGL.lib");
pragma(lib, "lib\\DerelictGLU.lib");
pragma(lib, "lib\\DerelictSDL.lib");
pragma(lib, "lib\\DerelictUtil.lib");

import derelict.sdl.sdl;
import derelict.opengl.gl;
import derelict.opengl.glu;
import std.string;
import std.stdio;

void main()
{
	DerelictSDL.load();
	DerelictGL.load();
	DerelictGLU.load();
	
	if(SDL_Init(SDL_INIT_VIDEO) < 0)
	{
		throw new Exception("Couldn't init SDL: " ~ .toString(SDL_GetError()));
	}	
	scope(exit) SDL_Quit();
	
	SDL_GL_SetAttribute(SDL_GL_BUFFER_SIZE, 32);
	SDL_GL_SetAttribute(SDL_GL_DEPTH_SIZE, 16);
	SDL_GL_SetAttribute(SDL_GL_DOUBLEBUFFER, 1);
	
	if(SDL_SetVideoMode(1024, 768, 0, SDL_OPENGL) == null)
	{
		throw new Exception("Failed to set video mode: " ~ toString(SDL_GetError()));
	}
	
	GLVersion ver = DerelictGL.loadExtendedVersions(GLVersion.GL21);
	writefln("Max GL version = %d", ver);
	char[] gluver = toString(gluGetString(GLU_VERSION));
	writefln("GLU version string = %s", gluver);
	
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