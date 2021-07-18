#include "IndexBuffer.h"

void IndexBufferInit(struct IndexBuffer *ptr, int count, const void *data)
{
	ptr->Bind = IBBind;
	ptr->Unbind = IBUnbind;

	glGenBuffers(1, &ptr->ID);
	glBindBuffer(GL_ELEMENT_ARRAY_BUFFER, ptr->ID);
	ptr->mCount = count;
	glBufferData(GL_ELEMENT_ARRAY_BUFFER, count * sizeof(unsigned int), data, GL_DYNAMIC_DRAW);
}

void IBBind(struct IndexBuffer *ptr)
{
	glBindBuffer(GL_ELEMENT_ARRAY_BUFFER, ptr->ID);
}

void IBUnbind(struct IndexBuffer *ptr)
{
	glBindBuffer(GL_ELEMENT_ARRAY_BUFFER, 0);
}
