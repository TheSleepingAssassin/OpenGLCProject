#include "Camera.h"

struct Camera CameraInit(struct Vector3 pos)
{
	struct Camera cam;

	cam.pos = pos;
	// glm_mat4_copy(CamView, cam.view);
	CamUView(cam);

	return cam;
}

void CamSetPos(struct Camera cam, struct Vector3 pos)
{
	cam.pos = pos;
}

void CamUView(struct Camera cam)
{
	glm_mat4_identity(CamView);
	glm_translate(CamView, (vec3){cam.pos.x, cam.pos.y, cam.pos.z});
	glm_mat4_copy(CamView, cam.view);
}
