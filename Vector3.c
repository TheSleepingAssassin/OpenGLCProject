#include "Vector3.h"

struct Vector3 Vector3Init(float x, float y, float z)
{
	struct Vector3 ptr;

	ptr.x = x;
	ptr.y = y;
	ptr.z = z;

	return ptr;
};

void VecSet(struct Vector3 inst, struct Vector3 vec)
{
	inst.x = vec.x;
	inst.y = vec.y;
	inst.z = vec.z;
}
