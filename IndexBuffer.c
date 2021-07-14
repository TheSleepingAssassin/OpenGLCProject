#include "IndexBuffer.h"

struct IndexBuffer IndexBufferInit(int count, const void *data)
{
	struct IndexBuffer ptr;

	ptr.Bind = IBBind;
	ptr.Unbind = IBUnbind;

	glGenBuffers(1, &ptr.ID);
	glBindBuffer(GL_ELEMENT_ARRAY_BUFFER, ptr.ID);
	ptr.mCount = count;
	glBufferData(GL_ELEMENT_ARRAY_BUFFER, count * sizeof(unsigned int), data, GL_STATIC_DRAW);

	return ptr;
}

void IBBind(struct IndexBuffer inst)
{
	glBindBuffer(GL_ELEMENT_ARRAY_BUFFER, inst.ID);
}

void IBUnbind(struct IndexBuffer inst)
{
	glBindBuffer(GL_ELEMENT_ARRAY_BUFFER, 0);
}
