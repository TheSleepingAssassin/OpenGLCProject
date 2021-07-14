#pragma once

#include "defines.h"

struct IndexBuffer
{
	unsigned int ID;
	int mCount;
	void (*Bind)(struct IndexBuffer);
	void (*Unbind)(struct IndexBuffer);
};

void IBBind(struct IndexBuffer);
void IBUnbind(struct IndexBuffer);

struct IndexBuffer IndexBufferInit(int, const void *);
