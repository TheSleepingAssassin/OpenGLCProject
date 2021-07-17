#include "Cube.h"

struct Cube CubeInit(struct Cube *ptr, struct Vector3 pos, struct Vector3 rot, struct Vector3 scale)
{
	ptr->gameObject = GameObjectInit(&ptr->gameObject, pos, rot, scale);

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

	ptr->shader = ShaderInit(vSS, fSS);
	ptr->shader.Use(ptr->shader);

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

	glGenVertexArrays(1, &ptr->va);
	glBindVertexArray(ptr->va);
	ptr->vb = VertexBufferInit(sizeof(vertices), vertices);
	glVertexAttribPointer(0, 3, GL_FLOAT, GL_FALSE, 3 * sizeof(float), (void *)0);
	glEnableVertexAttribArray(0);
	ptr->ib = IndexBufferInit(sizeof(indices) / sizeof(indices[0]), indices);
	glBindVertexArray(0);
}
