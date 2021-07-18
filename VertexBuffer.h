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

void VertexBufferInit(struct VertexBuffer *ptr, unsigned int, const void *);
