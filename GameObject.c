#include "GameObject.h"

void GameObjectInit(struct GameObject *ptr, struct Vector3 pos, struct Vector3 rot, struct Vector3 scale)
{
	ptr->pos.x = pos.x;
	ptr->pos.y = pos.y;
	ptr->pos.z = pos.z;
	ptr->rot.x = rot.x;
	ptr->rot.y = rot.y;
	ptr->rot.z = rot.z;
	ptr->scale.x = scale.x;
	ptr->scale.y = scale.y;
	ptr->scale.z = scale.z;
	// printf("%f, %f, %f", ptr->scale.x, ptr->scale.y, ptr->scale.z);
}

void GameObjectModelTranslate(struct GameObject *ptr, struct Vector3 vec)
{
	ptr->pos.x = vec.x;
	ptr->pos.y = vec.y;
	ptr->pos.z = vec.z;
	glm_translate(ptr->model, (vec3){ptr->pos.x, ptr->pos.y, ptr->pos.z});
}

void GameObjectModelRotate(struct GameObject *ptr, struct Vector3 vec, struct Vector3 rot)
{
	ptr->rot = rot;
	ptr->rotAmt.x = vec.x;
	ptr->rotAmt.y = vec.y;
	ptr->rotAmt.z = vec.z;
	glm_rotate(ptr->model, ptr->rotAmt.x, (vec3){ptr->rot.x, ptr->rot.y, ptr->rot.z});
	// glm_mat4_identity(ptr->model);
	// glm_rotate(ptr->model, vec.x, (vec3){rot.x, 0.0f, 0.0f});
	// glm_rotate(ptr->model, vec.y, (vec3){0.0f, rot.y, 0.0f});
	// glm_rotate(ptr->model, vec.z, (vec3){0.0f, 0.0f, rot.z});
}

void GameObjectModelRotateX(struct GameObject *ptr, float amt)
{
	ptr->rot.x = amt;
	glm_rotate(ptr->model, ptr->rot.x, (vec3){1.0f, 0.0f, 0.0f});
}

void GameObjectModelRotateY(struct GameObject *ptr, float amt)
{
	ptr->rot.y = amt;
	glm_rotate(ptr->model, ptr->rot.y, (vec3){0.0f, 1.0f, 0.0f});
}

void GameObjectModelRotateZ(struct GameObject *ptr, float amt)
{
	ptr->rot.z = amt;
	glm_rotate(ptr->model, ptr->rot.z, (vec3){0.0f, 0.0f, 1.0f});
}

void GameObjectModelRotateEqual(struct GameObject *ptr, float amt, struct Vector3 rot)
{
	ptr->rot = rot;
	ptr->rotAmt.x = amt;
	ptr->rotAmt.y = amt;
	ptr->rotAmt.z = amt;
	glm_rotate(ptr->model, amt, (vec3){ptr->rot.x, ptr->rot.y, ptr->rot.z});
	// glm_mat4_identity(ptr->model);
	// glm_rotate(ptr->model, amt, (vec3){rot.x, rot.y, rot.z});
}

void GameObjectModelScale(struct GameObject *ptr, struct Vector3 vec)
{
	ptr->scale = vec;
	glm_scale(ptr->model, (vec3){ptr->scale.x, ptr->scale.y, ptr->scale.z});
}

void GameObjectUModel(struct GameObject *ptr)
{
	// glm_mat4_identity(ObjectModel);
	glm_mat4_identity(ptr->model);
	// glm_translate(ptr->model, (vec3){ptr->pos.x, ptr->pos.y, ptr->pos.z});
	// glm_rotate(ptr->model, ptr->rotAmt.x, (vec3){ptr->rot.x, ptr->rot.y, ptr->rot.z});
	// glm_translate(ptr->model, (vec3){ptr->pos.x, ptr->pos.y, ptr->pos.z});
	// glm_rotate(ptr->model, ptr->rotAmt.x, (vec3){ptr->rot.x, 0.0f, 0.0f});
	// glm_rotate(ptr->model, ptr->rotAmt.y, (vec3){0.0f, ptr->rot.y, 0.0f});
	// glm_rotate(ptr->model, ptr->rotAmt.z, (vec3){0.0f, 0.0f, ptr->rot.z});
	// glm_scale(ptr->model, (vec3){ptr->scale.x, ptr->scale.y, ptr->scale.z});

	// glm_mat4_copy(ObjectModel, ptr->model);
}
