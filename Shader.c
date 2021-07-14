#include "Shader.h"

unsigned int CompileShader(unsigned int type, const char *source)
{
	unsigned int ID = glCreateShader(type);
	glShaderSource(ID, 1, &source, NULL);
	glCompileShader(ID);

	int success;
	char infoLog[512];
	glGetShaderiv(ID, GL_COMPILE_STATUS, &success);
	if (!success)
	{
		glGetShaderInfoLog(ID, 512, NULL, infoLog);

		printf("ERROR::SHADER::VERTEX::COMPILATION::FAILED");
		printf(infoLog);

		return 0;
	}

	return ID;
}

unsigned int CreateShader(const char *vSS, const char *fSS)
{
	int success;
	char infoLog[512];
	unsigned int ID = glCreateProgram();
	unsigned int vS = CompileShader(GL_VERTEX_SHADER, vSS);
	unsigned int fS = CompileShader(GL_FRAGMENT_SHADER, fSS);
	glAttachShader(ID, vS);
	glAttachShader(ID, fS);
	glLinkProgram(ID);

	glGetProgramiv(ID, GL_LINK_STATUS, &success);
	if (!success)
	{
		glGetProgramInfoLog(ID, 512, NULL, infoLog);

		printf("ERROR::SHADER::PROGRAM::LINKING::FAILED");
		printf(infoLog);
	}
	glDeleteShader(vS);
	glDeleteShader(fS);

	return ID;
}

struct Shader ShaderInit(const char *vSS, const char *fSS)
{
	struct Shader ptr;

	ptr.Use = pUse;
	ptr.Disuse = pDisuse;
	ptr.SetMat4 = pSetMat4;

	ptr.ID = CreateShader(vSS, fSS);

	return ptr;
}

void pUse(struct Shader inst)
{
	glUseProgram(inst.ID);
}

void pDisuse(struct Shader inst)
{
	glUseProgram(0);
}

void pSetMat4(struct Shader inst, mat4 mat, const char *name)
{
	int loc = glGetUniformLocation(inst.ID, name);
	glUniformMatrix4fv(loc, 1, GL_FALSE, &mat[0][0]);
}
