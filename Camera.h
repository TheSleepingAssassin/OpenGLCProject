#pragma once
#include "defines.h"
#include "Vector3.h"

mat4 CamView;

struct Camera
{
	struct Vector3 pos;
	struct Vector3 front;
	struct Vector3 up;

	mat4 view;
};

void CamSetPos(struct Camera, struct Vector3 pos);
void CamUView(struct Camera);
struct Camera CameraInit(struct Vector3);
