#include <stdlib.h>
#include <glad/glad.h>
#include <GLFW/glfw3.h>
#include <cglm/cglm.h>

#include "Shader.h"
#include "VertexBuffer.h"
#include "IndexBuffer.h"

int wWidth = 700, wHeight = 700;

int main(int argc, char *argv[])
{
	GLFWwindow *window;

	if (!glfwInit())
		return -1;

	window = glfwCreateWindow(wWidth, wHeight, "Window", NULL, NULL);

	if (!window)
		return -1;

	glfwMakeContextCurrent(window);

	if (!gladLoadGLLoader((GLADloadproc)glfwGetProcAddress))
		return -1;

	const char *vSS =
			"#version 330 core\n"
			"\n"
			"layout (location = 0) in vec3 aPos;\n"
			"\n"
			"void main()\n"
			"{\n"
			"	gl_Position = vec4(aPos, 1.0);\n"
			"};\n\0";

	const char *fSS =
			"#version 330 core\n"
			"\n"
			"layout (location = 0) out vec4 color;\n"
			"\n"
			"void main()\n"
			"{\n"
			"	color = vec4(1.0, 0.0, 0.0, 1.0);\n"
			"};\n\0";

	struct Shader *shader = ShaderInit(vSS, fSS);
	shader->Use(shader);

	// float vertices[] =
	// 		{-0.5f, 0.5f, 0.0f,
	// 		 0.5f, 0.5f, 0.0f,
	// 		 -0.5f, -0.5f, 0.0f,
	// 		 0.5f, 0.5f, 0.0f,
	// 		 -0.5f, -0.5f, 0.0f,
	// 		 0.5f, -0.5f, 0.0f};

	float vertices[] =
			{-0.5f, 0.5f, -0.5f,
			 0.5f, 0.5f, -0.5f,
			 -0.5f, -0.5f, -0.5f,
			 0.5f, -0.5f, -0.5f,

			 -0.5f, 0.5f, 0.5f,
			 0.5f, 0.5f, 0.5f,
			 -0.5f, -0.5f, 0.5f,
			 0.5f, -0.5f, 0.5f};

	unsigned int indices[] =
			{0, 1, 2,
			 1, 2, 3,

			 0, 4, 6,
			 0, 6, 2,

			 1, 5, 7,
			 1, 7, 3,

			 0, 1, 4,
			 1, 4, 5,

			 2, 3, 6,
			 3, 6, 7,

			 4, 5, 6,
			 5, 6, 7};

	unsigned int va;
	glGenVertexArrays(1, &va);
	glBindVertexArray(va);
	struct VertexBuffer *vb = VertexBufferInit(sizeof(vertices), vertices);
	glVertexAttribPointer(0, 3, GL_FLOAT, GL_FALSE, 3 * sizeof(float), (void *)0);
	glEnableVertexAttribArray(0);
	struct IndexBuffer *ib = IndexBufferInit(sizeof(indices) / sizeof(indices[0]), indices);
	glBindVertexArray(0);

	while (!glfwWindowShouldClose(window))
	{
		glClear(GL_COLOR_BUFFER_BIT);

		shader->Use(shader);
		glBindVertexArray(va);
		glDrawElements(GL_TRIANGLES, 36, GL_UNSIGNED_INT, 0);

		glfwSwapBuffers(window);
		glfwPollEvents();
	}

	glfwTerminate();
	return 0;
}
