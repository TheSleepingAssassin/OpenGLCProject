#include "defines.h"
#include <GLFW/glfw3.h>

#include "Vector2.h"

struct Window
{
	GLFWwindow *handle;
};

struct Window WindowCreate(struct Vector2, const char *);
bool WindowShouldClose(struct Window);
