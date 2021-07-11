#include "VertexBuffer.h"

struct VertexBuffer *VertexBufferInit(unsigned int size, const void *data)
{
	struct VertexBuffer *ptr = (struct VertexBuffer *)malloc(sizeof(struct VertexBuffer *));

	ptr->Bind = VBBind;
	ptr->Unbind = VBUnbind;

	glGenBuffers(1, &ptr->ID);
	glBindBuffer(GL_ARRAY_BUFFER, ptr->ID);
	glBufferData(GL_ARRAY_BUFFER, size, data, GL_STATIC_DRAW);

	return ptr;
}

void VBBind(struct VertexBuffer *inst)
{
	glBindBuffer(GL_ARRAY_BUFFER, inst->ID);
}

void VBUnbind(struct VertexBuffer *inst)
{
	glBindBuffer(GL_ARRAY_BUFFER, 0);
}
