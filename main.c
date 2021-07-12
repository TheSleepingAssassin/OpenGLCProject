#define CGLM_ALL_UNALIGNED
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
			"uniform mat4 proj;\n"
			"uniform mat4 view;\n"
			"uniform mat4 model;\n"
			"\n"
			"void main()\n"
			"{\n"
			"	gl_Position = proj * view * model * vec4(aPos, 1.0);\n"
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

	mat4 proj;
	glm_mat4_identity(proj);
	glm_perspective(glm_rad(90.0f), (float)wWidth / (float)wHeight, 0.1f, 1000.0f, proj);
	shader->SetMat4(shader, proj, "proj");

	while (!glfwWindowShouldClose(window))
	{
		glClear(GL_COLOR_BUFFER_BIT);

		mat4 view;
		glm_mat4_identity(view);
		glm_translate(view, (vec3){0.0f, 0.0f, -10.0f});
		shader->SetMat4(shader, view, "view");

		mat4 model;
		glm_mat4_identity(model);
		glm_translate(model, (vec3){0.0f, 0.0f, 0.0f});
		glm_rotate(model, glfwGetTime() * 5.0f, (vec3){1.0f, 0.8f, 0.2f});
		shader->SetMat4(shader, model, "model");

		shader->Use(shader);
		glBindVertexArray(va);
		glDrawElements(GL_TRIANGLES, 36, GL_UNSIGNED_INT, 0);

		glfwSwapBuffers(window);
		glfwPollEvents();
	}

	glfwTerminate();
	return 0;
}
