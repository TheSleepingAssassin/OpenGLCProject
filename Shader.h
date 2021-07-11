#pragma once

#include <stdio.h>
#include "defines.h"

struct Shader
{
	unsigned int ID;
	void (*Use)(struct Shader *);
	void (*Disuse)(struct Shader *);
};

void pUse(struct Shader *);
void pDisuse(struct Shader *);

struct Shader *ShaderInit(const char *vSS, const char *fSS);
