#include "kernel.h"
#include "cuda_runtime.h"

double *d_answer;
double *h_answer;

void Allocate_Memory()
{
	size_t size = N * sizeof(float);
	cudaError_t Error;
	h_a = (float*)malloc(size);
	h_b = (float*)malloc(size);


	Error = cudaMalloc((void**)&d_a, size);

	cudaMalloc((void**)&d_answer, 5*sizeof(double));

	printf("cuda malloc error message is %s", cudaGetErrorString(Error));
}

void Free_Memory()
{
	//if (h_a) free(h_a);
	//if (d_a) cudaFree(d_a);
	//if (h_b) free(h_b);
	//if (d_anew) cudaFree(d_anew);
}
void Send_To_Device()
{
	//size_t size = N * sizeof(float);
	//cudaError_t Error;
	//Error = cudaMemcpy(d_a, h_a, size, cudaMemcpyHostToDevice);
	//printf("\nCUDA error(memcpy h_a->d_a)=%s\n", cudaGetErrorString(Error));
}
void Get_From_Memory()
{
	size_t size = N * sizeof(float);
	cudaError_t Error;
	Error = cudaMemcpy(h_b, d_a, size, cudaMemcpyDeviceToHost);
	Error = cudaMemcpy(h_answer, d_answer, size, cudaMemcpyDeviceToHost);


	printf("\nCUDA error(memcpy d_a->h_b)=%s\n", cudaGetErrorString(Error));
}

__global__ void hardy_cross()
{
	double Q12 = 10;
	double Q23 = 0;
	double Q13 = 0;
	double Q24 = 10;
	double Q34 = 0;

	double r12 = 1;
	double r13 = 5;
	double r23 = 1;
	double r24 = 5;
	double r34 = 1;
	double dQ_1;
	double dQ_2;

	int no_iteraion = 5;
	for (int i = 0; i < no_iteraion; i++)
	{

		dQ_1 = -(r12 *Q12 *Q12 + r23*Q23*Q23 - r13*Q13*Q13) / (2 * r12*Q12 + 2 * r23*Q23 + 2 * r13*Q13);

		dQ_2 = -(r24 *Q24 *Q24 - r34*Q34*Q34 - r23*Q23*Q23) / (2 * r24*Q24 + 2 * r34*Q34 + 2 * r23*Q23);

		Q12 = Q12 + dQ_1;
		Q23 = Q23 + dQ_1 - dQ_2;
		Q13 = Q13 - dQ_1;
		Q24 = Q24 + dQ_2;
		Q34 = Q34 - dQ_2;

	}


	d_answer[0] = Q12;
	d_answer[1] = Q13;
	d_answer[2] = Q23;
	d_answer[3] = Q24;
	d_answer[4] = Q34;
}
void Launch_hardy_cross() 
{
	hardy_cross();
}

