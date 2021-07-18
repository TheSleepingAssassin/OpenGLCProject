#pragma once
#include "defines.h"
#include "Vector3.h"

struct Camera
{
	struct Vector3 pos;
	struct Vector3 front;
	struct Vector3 up;

	mat4 view;
};

void CamSetPos(struct Camera *, struct Vector3);
void CamUView(struct Camera *);
void CameraInit(struct Camera *, struct Vector3);
