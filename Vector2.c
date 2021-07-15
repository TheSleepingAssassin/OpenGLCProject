#include "Vector2.h"

struct Vector2 Vector2Init(float x, float y)
{
	struct Vector2 vec;

	vec.x = x;
	vec.y = y;

	return vec;
}

void Vector2Set(struct Vector2 inst, struct Vector2 vec)
{
	inst.x = vec.x;
	inst.y = vec.y;
}

struct Vector2 Vector2Add(struct Vector2 inst, struct Vector2 vec)
{
	float x = inst.x += vec.x;
	float y = inst.y += vec.y;

	return Vector2Init(x, y);
}

struct Vector2 Vector2Sub(struct Vector2 inst, struct Vector2 vec)
{
	float x = inst.x -= vec.x;
	float y = inst.y -= vec.y;

	return Vector2Init(x, y);
}
