#include "defines.h"
#include <GLFW/glfw3.h>
#include "Functions.h"
#include "Vector2.h"

struct Button
{
	bool down, last, lastTick, pressed, pressedTick;
};

struct Mouse
{
	struct Button buttons[GLFW_MOUSE_BUTTON_LAST];
	struct Vector2 pos, delta;
};

struct Keyboard
{
	struct Button keys[GLFW_KEY_LAST];
};

typedef void (*FWindow)();

struct Window
{
	GLFWwindow *handle;
	struct Vector2 size;
	FWindow init, destroy, tick, update, render;
	struct Mouse mouse;
	struct Keyboard keyboard;

	int lastSecond;
	int frames, fps, lastFrame, frameDelta;
	int ticks, tps, tickRemainder;
};

extern struct Window window;

void WindowCreate(FWindow init, FWindow destroy, FWindow tick, FWindow update, FWindow render);
void WindowLoop();
void mouseSetGrabbed(bool grabbed);
bool mouseGetGrabbed();
