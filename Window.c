#include "Window.h"

struct Window window;

static void size_callback(GLFWwindow *handle, int width, int height)
{
	glViewport(0, 0, width, height);
	window.size = Vector2Init(width, height);
}

static void cursor_callback(GLFWwindow *handle, double xp, double yp)
{
	struct Vector2 p = Vector2Init(xp, yp);

	window.mouse.delta = Vector2Sub(p, window.mouse.pos);
	window.mouse.delta.x = mClamp(window.mouse.delta.x, -100.0f, 100.0f);
	window.mouse.delta.y = mClamp(window.mouse.delta.y, -100.0f, 100.0f);

	window.mouse.pos = p;
}

static void key_callback(GLFWwindow *handle, int key, int scanCode, int actions, int mods)
{
	if (key = 0)
		return;

	switch (actions)
	{
	case GLFW_PRESS:
		window.keyboard.keys[key].down = true;
		break;
	case GLFW_RELEASE:
		window.keyboard.keys[key].down = false;
		break;
	default:
		break;
	}
}

static void mouse_callback(GLFWwindow *handle, int button, int actions, int mods)
{
	if (button < 0)
		return;

	switch (actions)
	{
	case GLFW_PRESS:
		window.mouse.buttons[button].down = true;
	case GLFW_RELEASE:
		window.mouse.buttons[button].down = false;
	default:
		break;
	}
}

static void error_callback(int code, const char *description)
{
	fprintf(stderr, "GLFW error %d: %s\n", code, description);
}

void WindowCreate(FWindow init, FWindow destroy, FWindow tick, FWindow update, FWindow render)
{
	window.init = init;
	window.destroy = destroy;
	window.tick = tick;
	window.update = update;
	window.render = render;

	// window.lastFrame = NOW();
	// window.lastSecond = NOW();

	glfwSetErrorCallback(error_callback);

	if (!glfwInit())
	{
		fprintf(stderr, "%s", "error Init GLFW\n");
		exit(1);
	}

	glfwWindowHint(GLFW_CONTEXT_VERSION_MAJOR, 3);
	glfwWindowHint(GLFW_CONTEXT_VERSION_MINOR, 3);
	glfwWindowHint(GLFW_OPENGL_PROFILE, GLFW_OPENGL_CORE_PROFILE);
	glfwWindowHint(GLFW_OPENGL_FORWARD_COMPAT, GL_TRUE);

	window.size = Vector2Init(700, 700);
	window.handle = glfwCreateWindow(window.size.x, window.size.y, "Window", NULL, NULL);

	if (!window.handle)
	{
		fprintf(stderr, "%s", "Error GLFW Window Init");
		glfwTerminate();
		exit(1);
	}

	glfwSwapInterval(1);
}

static void button_array_tick(int n, struct Button *buttons)
{
	for (int i = 0; i < n; i++)
	{
		buttons[i].pressedTick = buttons[i].down && !buttons[i].lastTick;
		buttons[i].lastTick = buttons[i].down;
	}
}

static void button_array_update(int n, struct Button *buttons)
{
	for (int i = 0; i < n; i++)
	{
		buttons[i].pressed = buttons[i].down && !buttons[i].last;
		buttons[i].last = buttons[i].down;
	}
}

static void _init()
{
	window.init();
}

static void _destroy()
{
	window.destroy();
	glfwTerminate();
}

static void _tick()
{
	// window.ticks++;
	button_array_tick(GLFW_MOUSE_BUTTON_LAST, window.mouse.buttons);
	button_array_tick(GLFW_KEY_LAST, window.keyboard.keys);
	window.tick();
}

static void _update()
{
	button_array_update(GLFW_MOUSE_BUTTON_LAST, window.mouse.buttons);
	button_array_update(GLFW_KEY_LAST, window.keyboard.keys);
	window.update();

	window.mouse.delta = Vector2Init(0.0f, 0.0);
}

static void _render()
{
	// window.frames++;
	window.render();
}

void window_loop()
{
	_init();

	while (!glfwWindowShouldClose(window.handle))
	{
		// const int now = NOW();

		// window.frameDelta = now - window.lastFrame;
		// window.lastFrame = now;

		// if (now - window.lastSecond > NS_PER_SECOND)
		// {
		// 	window.fps = window.frames;
		// 	window.tps = window.ticks;
		// 	window.frames = 0;
		// 	window.ticks = 0;
		// 	window.lastSecond = now;

		// 	printf("FPS: %lld | TPS: %lld\n", window.fps, window.tps);
		// }

		// // tick processing
		// const int NS_PER_TICK = (NS_PER_SECOND / 60);
		// int tick_time = window.frameDelta + window.tickRemainder;
		// while (tick_time > NS_PER_TICK)
		// {
		// 	_tick();
		// 	tick_time -= NS_PER_TICK;
		// }
		// window.tickRemainder = max(tick_time, 0);

		_update();
		_render();
		glfwSwapBuffers(window.handle);
		glfwPollEvents();
	}

	_destroy();
	exit(0);
}

void mouse_set_grabbed(bool grabbed)
{
	glfwSetInputMode(window.handle, GLFW_CURSOR, grabbed ? GLFW_CURSOR_DISABLED : GLFW_CURSOR_NORMAL);
}

bool mouse_get_grabbed()
{
	return glfwGetInputMode(window.handle, GLFW_CURSOR) == GLFW_CURSOR_DISABLED;
}
