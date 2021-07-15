#pragma once
struct Vector2
{
	float x;
	float y;
};

void Vector2Set(struct Vector2, struct Vector2);
struct Vector2 Vector2Add(struct Vector2, struct Vector2);
struct Vector2 Vector2Sub(struct Vector2, struct Vector2);
struct Vector2 Vector2Init(float, float);
