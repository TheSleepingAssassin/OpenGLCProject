#pragma once
#include "defines.h"
#include "GameObject.h"
#include "Shader.h"
#include "VertexBuffer.h"
#include "IndexBuffer.h"

struct Cube
{
	struct GameObject gameObject;

	unsigned int va;
	struct Shader shader;
	struct VertexBuffer vb;
	struct IndexBuffer ib;
};

void CubeInit(struct Cube *, struct Vector3, struct Vector3, struct Vector3);
void CubeDraw(struct Cube);
