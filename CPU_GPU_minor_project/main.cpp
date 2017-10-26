#include<stdio.h>
#include<malloc.h>
#include"kernel.h"
#include<iostream>

extern float *h_a;
extern float *h_b;
extern float *d_a;
extern double *h_answer;

void hardy_cross(double * answer);
int main()
{
	Allocate_Memory();

	Send_To_Device();

	Launch_hardy_cross();

	Get_From_Memory();

	for (i = 0; i < N; i++)
	{
		//printf("²Ä%d­Ó ­È¬O%f", i, h_b);
	}

	Free_Memory();


	double *answer = (double*)malloc(sizeof(double) * 5);

	
	hardy_cross(answer);



	printf("\nQ12:%f    \nQ13:%f    \nQ23:%f    \nQ24:%f    \nQ34:%f    ", answer[0], answer[1], answer[2], answer[3], answer[4]);



	system("Pause");
	return 0;
}




void hardy_cross(double * answer)
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


	answer[0] = Q12;
	answer[1] = Q13;
	answer[2] = Q23;
	answer[3] = Q24;
	answer[4] = Q34;
}