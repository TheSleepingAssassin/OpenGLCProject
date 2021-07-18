#include "VertexBuffer.h"

void VertexBufferInit(struct VertexBuffer *ptr, unsigned int size, const void *data)
{
	ptr->Bind = VBBind;
	ptr->Unbind = VBUnbind;

	glGenBuffers(1, &ptr->ID);
	glBindBuffer(GL_ARRAY_BUFFER, ptr->ID);
	glBufferData(GL_ARRAY_BUFFER, size, data, GL_DYNAMIC_DRAW);
}

void VBBind(struct VertexBuffer *ptr)
{
	glBindBuffer(GL_ARRAY_BUFFER, ptr->ID);
}

void VBUnbind(struct VertexBuffer *ptr)
{
	glBindBuffer(GL_ARRAY_BUFFER, 0);
}
