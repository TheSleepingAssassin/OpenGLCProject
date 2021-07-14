#pragma once
#include "defines.h"

struct Vector3
{
	float x;
	float y;
	float z;

	void (*Set)(struct Vector3 *, struct Vector3 *);
};

void pSet(struct Vector3 *, struct Vector3 *);

struct Vector3 *Vector3Init(float, float, float);
