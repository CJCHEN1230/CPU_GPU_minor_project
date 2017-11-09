#include "kernel.h"
#include "cuda_runtime.h"
#include<math.h>

double *d_answer;
double *h_answer;
double *hb_answer;

void Allocate_Memory()
{

	cudaError_t Error;
	size_t size = 5 * sizeof(double);
	h_answer = (double*)malloc(size);
	hb_answer = (double*)malloc(size);
	Error=cudaMalloc((void**)&d_answer, size);


	printf("cuda malloc error message is %s", cudaGetErrorString(Error));
}

void Free_Memory()
{
	if (h_answer) free(h_answer);
	if (d_answer) cudaFree(d_answer);
}
void Send_To_Device()
{
	size_t size = 5 * sizeof(double);
	cudaError_t Error;
	Error = cudaMemcpy(d_answer, h_answer, size, cudaMemcpyHostToDevice);
	printf("\nCUDA error(memcpy h_answer->d_answer)=%s\n", cudaGetErrorString(Error));
}
void Get_From_Memory()
{
	size_t size = 5 * sizeof(double);
	cudaError_t Error;	
	Error = cudaMemcpy(hb_answer, d_answer, size, cudaMemcpyDeviceToHost);
	printf("\nCUDA error(memcpy d_answer->h_answer)=%s\n", cudaGetErrorString(Error));
}

__global__ void hardy_cross(double * вь_a)
{
	double Q12 = 10;
	double Q13 = 0;
	double Q23 = 0;
	double Q24 = 10;
	double Q34 = 0;

	double r12 = 5;
	double r13 = 1;
	double r23 = 1;
	double r24 = 1;
	double r34 = 5;
	double dQ_1;
	double dQ_2;

	int c12 = 0;
	int c13 = 0;
	int c23 = 0;
	int c24 = 0;
	int c34 = 0;


	int no_iteraion = 5;

	for (int i = 0; i < no_iteraion; i++)
	{
		if (Q12 != 0)
			c12 = Q12 / fabs(Q12);
		if (Q13 != 0)
			c13 = Q13 / fabs(Q13);
		if (Q23 != 0)
			c23 = Q23 / fabs(Q23);
		if (Q24 != 0)
			c24 = Q24 / fabs(Q24);
		if (Q34 != 0)
			c34 = Q34 / fabs(Q34);



		dQ_1 = -(c12*r12 *Q12 *Q12 + c23*r23*Q23*Q23 - c13*r13*Q13*Q13) / (2 * r12*fabs(Q12) + 2 * r23*fabs(Q23) + 2 * r13*fabs(Q13));

		dQ_2 = -(c24*r24 *Q24 *Q24 - c23*r23*Q23*Q23 - c34*r34*Q34*Q34) / (2 * r24*fabs(Q24) + 2 * r23*fabs(Q23) + 2 * r34*fabs(Q34));

		Q12 = Q12 + dQ_1;
		Q23 = Q23 + dQ_1 - dQ_2;
		Q13 = Q13 - dQ_1;
		Q24 = Q24 + dQ_2;
		Q34 = Q34 - dQ_2;

	}
	
	

	вь_a[0] = Q12;
	вь_a[1] = Q13;
	вь_a[2] = Q23;
	вь_a[3] = Q24;
	вь_a[4] = Q34;
	


}
void Launch_hardy_cross() 
{
	hardy_cross << <1, 1 >> > (d_answer);
}

