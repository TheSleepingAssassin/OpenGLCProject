#include "Window.h"

struct Window WindowCreate(struct Vector2 size, const char *name)
{
	struct Window ptr;

	if (!glfwInit())
		exit(-1);

	ptr.handle = glfwCreateWindow(size.x, size.y, name, NULL, NULL);

	if (!ptr.handle)
		exit(-1);

	glfwMakeContextCurrent(ptr.handle);

	return ptr;
}

bool WindowShouldClose(struct Window ptr)
{
	return (glfwWindowShouldClose(ptr.handle));
}
