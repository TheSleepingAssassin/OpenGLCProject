#include "Functions.h"

float mClamp(float p, float x, float y)
{
	if (p > y)
		p = y;
	else if (p < x)
		p = x;

	return p;
}

int Rand(int lower, int upper)
{
	return (rand() % (upper - lower + 1)) + lower;
}
