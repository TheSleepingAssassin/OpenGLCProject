all:
	make cc build

build:
	gcc Cube.c GameObject.c Functions.o Window.o Camera.o Vector2.o Vector3.o Shader.o VertexBuffer.o IndexBuffer.o main.o glad.o -I.\\include/ -L.\\lib/ -Bstatic -l:libglfw3dll.a -lopengl32 -o out

cc:
	gcc -c Cube.c GameObject.c Functions.c Window.c Camera.c Vector2.c Vector3.c Shader.c VertexBuffer.c IndexBuffer.c main.c -I.\\include/ -L.\\lib/

acc:
	gcc -S Cube.c GameObject.c Functions.c Window.c Camera.c Vector2.c Vector3.c Shader.c VertexBuffer.c IndexBuffer.c main.c -I.\\include -L.\\lib/

run:
	start out

main:
	gcc -c main.c -I.\\include/ -L.\\lib/

Functions:
	gcc -c Functions.c -I.\\include/ -L.\\lib/

Shader:
	gcc -c Shader.c -I.\\include/ -L.\\lib/

VertexBuffer:
	gcc -c VertexBuffer.c -I.\\include/ -L.\\lib/

IndexBuffer:
	gcc -c IndexBuffer.c -I.\\include/ -L.\\lib/

Vector3:
	gcc -c Vector3.c -I.\\include/ -L.\\lib/

Vector2:
	gcc -c Vector2.c -I.\\include/ -L.\\lib/

Camera:
	gcc -c Camera.c -I.\\include/ -L.\\lib/

Window:
	gcc -c Window.c -I.\\include/ -L.\\lib/

GameObject:
	gcc -c GameObject.c -I.\\include -L.\\lib/

Cube:
	gcc -c Cube.c -I.\\include/ -L.\\lib/

glad:
	gcc -c glad.c -I.\\include/ -L.\\lib/

clean:
	del main.o
	del Shader.o
	del VertexBuffer.o
	del IndexBuffer.o
	del Camera.o
