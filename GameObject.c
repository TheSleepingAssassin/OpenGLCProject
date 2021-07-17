#include "GameObject.h"

struct GameObject GameObjectInit(struct GameObject *ptr, struct Vector3 pos, struct Vector3 rot, struct Vector3 scale)
{
	ptr->pos = pos;
	ptr->rot = rot;
	ptr->scale = scale;
}

void GameObjectModelTranslate(struct GameObject *ptr, struct Vector3 vec)
{
	glm_mat4_identity(ptr->model);
	glm_translate(ptr->model, (vec3){vec.x, vec.y, vec.z});
}

void GameObjectModelRotate(struct GameObject *ptr, struct Vector3 vec, struct Vector3 rot)
{
	glm_mat4_identity(ptr->model);
	glm_rotate(ptr->model, vec.x, (vec3){rot.x, 0.0f, 0.0f});
	glm_rotate(ptr->model, vec.y, (vec3){0.0f, rot.y, 0.0f});
	glm_rotate(ptr->model, vec.z, (vec3){0.0f, 0.0f, rot.z});
}

void GameObjectModelRotateEqual(struct GameObject *ptr, float amt, struct Vector3 rot)
{
	glm_mat4_identity(ptr->model);
	glm_rotate(ptr->model, amt, (vec3){rot.x, rot.y, rot.z});
}

void GameObjectModelScale(struct GameObject *ptr, struct Vector3 vec)
{
	glm_mat4_identity(ptr->model);
	glm_scale(ptr->model, (vec3){vec.x, vec.y, vec.z});
}

void GameObjectUModel(struct GameObject *ptr)
{
	// glm_mat4_identity(ObjectModel);
	glm_mat4_identity(ptr->model);
	glm_translate(ptr->model, (vec3){0.0f, 0.0f, 0.0f});

	// glm_mat4_copy(ObjectModel, ptr->model);
}
