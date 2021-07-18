#include "Camera.h"

void CameraInit(struct Camera *cam, struct Vector3 pos)
{
	cam->pos = pos;
}

void CamSetPos(struct Camera *cam, struct Vector3 pos)
{
	cam->pos = pos;
}

void CamUView(struct Camera *cam)
{
	glm_mat4_identity(cam->view);
	glm_translate(cam->view, (vec3){cam->pos.x, cam->pos.y, cam->pos.z});
	// glm_mat4_copy(CamView, cam->view);
}
