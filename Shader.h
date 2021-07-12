#pragma once

#include <stdio.h>
#include "defines.h"

struct Shader
{
	unsigned int ID;
	void (*Use)(struct Shader *);
	void (*Disuse)(struct Shader *);
	void (*SetMat4)(struct Shader *, mat4, const char *);
};

void pUse(struct Shader *);
void pDisuse(struct Shader *);
void pSetMat4(struct Shader *, mat4, const char *);

struct Shader *ShaderInit(const char *vSS, const char *fSS);
