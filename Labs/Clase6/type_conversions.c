float conv1(float x) {
	return 3*x;
}

float conv2(float x) {
	return 3.0*x;
}

float conv3(float x) {
	return 3.0f*x;
}

// gcc-8 -O1 -S type_conversions.c
