#pragma once
#include "defines.h"
#include "Vector3.h"

mat4 ObjectModel;

struct GameObject
{
	struct Vector3 pos;
	struct Vector3 rotAmt;
	float rAmt;
	struct Vector3 rot;
	struct Vector3 scale;

	mat4 model;
};

void GameObjectInit(struct GameObject *, struct Vector3, struct Vector3, struct Vector3);
void GameObjectUModel(struct GameObject *);
void GameObjectModelTranslate(struct GameObject *, struct Vector3);
void GameObjectModelRotate(struct GameObject *, struct Vector3, struct Vector3);
void GameObjectModelRotateX(struct GameObject *ptr, float amt);
void GameObjectModelRotateY(struct GameObject *ptr, float amt);
void GameObjectModelRotateZ(struct GameObject *ptr, float amt);
void GameObjectModelRotateEqual(struct GameObject *, float, struct Vector3);
void GameObjectModelScale(struct GameObject *, struct Vector3);
