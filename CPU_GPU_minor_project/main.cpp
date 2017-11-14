#include<stdio.h>
#include<malloc.h>
#include"kernel.h"
#include<iostream>

extern double *d_answer;
extern double *h_answer;
extern double *hb_answer;

void hardy_cross()
{
	double Q12 = 5;
	double Q13 = 5;
	double Q23 = 0;
	double Q24 = 5;
	double Q34 = 5;

	double r12 = 5;
	double r13 = 1;
	double r23 = 2.111;
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
	printf("\nQ12:%f    \nQ13:%f    \nQ23:%f    \nQ24:%f    \nQ34:%f    ", Q12, Q13, Q23, Q24, Q34);

}






int main()
{
	Allocate_Memory();

	Send_To_Device();

	Launch_hardy_cross();

	Get_From_Memory();
	
	Free_Memory();

	//printf("\nQ12:%f    \nQ13:%f    \nQ23:%f    \nQ24:%f    \nQ34:%f    ", hb_answer[0], hb_answer[1], hb_answer[2], hb_answer[3], hb_answer[4]);

	hardy_cross();
	system("Pause");
	return 0;
}




