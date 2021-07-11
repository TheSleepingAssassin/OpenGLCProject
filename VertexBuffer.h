#pragma once

#include "defines.h"

struct VertexBuffer
{
	unsigned int ID;
	void (*Bind)(struct VertexBuffer *);
	void (*Unbind)(struct VertexBuffer *);
};

void VBBind(struct VertexBuffer *);
void VBUnbind(struct VertexBuffer *);

struct VertexBuffer *VertexBufferInit(unsigned int, const void *);
