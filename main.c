#define CGLM_ALL_UNALIGNED
#include <stdlib.h>
#include "defines.h"
#include <GLFW/glfw3.h>
#include <stb_image.h>

#include "Camera.h"
#include "Vector3.h"
#include "Vector2.h"
#include "Window.h"
#include "GameObject.h"
#include "Cube.h"

int wWidth = 700, wHeight = 700;
float deltaTime = 0.0f, lastFrame = 0.0f;

void HandleDeltaTime();

struct Camera cam;

int main(int argc, char *argv[])
{
	cam = CameraInit(Vector3Init(0.0f, 0.0f, -10.0f));

	struct Window window = WindowCreate(Vector2Init(700, 700), "Window");

	if (!gladLoadGLLoader((GLADloadproc)glfwGetProcAddress))
		return -1;

	struct Cube cube;
	CubeInit(&cube,
					 Vector3Init(0.0f, 0.0f, 0.0f),
					 Vector3Init(0.0f, 0.0f, 0.0f),
					 Vector3Init(1.0f, 1.0f, 1.0f));

	mat4 proj;
	glm_mat4_identity(proj);
	glm_perspective(glm_rad(90.0f),
									(float)wWidth / (float)wHeight,
									0.1f,
									1000.0f,
									proj);
	cube.shader.SetMat4(cube.shader, proj, "proj");

	while (!WindowShouldClose(window))
	{
		HandleDeltaTime();

		glEnable(GL_DEPTH_TEST);
		glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);

		CamUView(cam);
		CamSetPos(cam, Vector3Init(0.0f, 0.0f, 0.0f));
		cube.shader.SetMat4(cube.shader, CamView, "view");

		GameObjectModelTranslate(&cube.gameObject,
														 Vector3Init(1.0f, 1.0f, 0.0f));

		GameObjectModelRotateEqual(&cube.gameObject,
															 glfwGetTime() * 5.0f,
															 Vector3Init(1.0f, 0.8f, 0.2f));

		cube.shader.SetMat4(cube.shader, cube.gameObject.model, "model");

		cube.shader.Use(cube.shader);
		glBindVertexArray(cube.va);
		glDrawElements(GL_TRIANGLES, 36, GL_UNSIGNED_INT, 0);

		glfwSwapBuffers(window.handle);
		glfwPollEvents();
	}

	glfwTerminate();
	return 0;
}

void HandleDeltaTime()
{
	float currentFrame = glfwGetTime();
	deltaTime = currentFrame - lastFrame;
	lastFrame = currentFrame;
}
