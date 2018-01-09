#include <math.h>
#include <stdio.h>
int main()
{
	double Q12 = 5;
	double Q13 = 5;
	double Q23 = -5;
	double Q24 = 10;
	double Q34 = 0;

	double r12 = 5;
	double r13 = 1;
	//double r23 = 20;
	double r24 = 1;
	double r34 = 5;

	double dQ_1 = 0;
	double dQ_2 = 0;
	double dr23 = 0;


	int c12 = 1;
	int c13 = 1;
	int c23 = 1;
	int c24 = 1;
	int c34 = 1;


	int no_iteraion = 100000;
	//for (int j=0;j<5001;j+=10)
	//{
	//	double r23 = j*0.01;

	//	printf("\n\nj:%d    ", j);
	//	printf("\nr23 input:%f    ", r23);
	//	for (int i = 0; i < no_iteraion; i++)
	//	{
	//		c12 = Q12 > 0 ? 1 : -1;
	//		c13 = Q13 > 0 ? 1 : -1;
	//		c23 = Q23 > 0 ? 1 : -1;
	//		c24 = Q24 > 0 ? 1 : -1;
	//		c34 = Q34 > 0 ? 1 : -1;

	//		dQ_2 = -(c24*r24 *Q24 *Q24 - c23*r23*Q23*Q23 - c34*r34*Q34*Q34) / (2 * r24*fabs(Q24) + 2 * r23*fabs(Q23) + 2 * r34*fabs(Q34));
	//		r23 = fabs((c13*r13*Q13*Q13 - c12*r12*Q12*Q12) / c23 / Q23 / Q23);


	//		Q12 = Q12 + dQ_2;
	//		Q13 = Q13 - dQ_2;

	//		Q24 = Q24 + dQ_2;
	//		Q34 = Q34 - dQ_2;			
	//	}		
	//	//printf("\nr23 output:%f    ", r23);
	//	//printf("\nQ12:%f    \nQ13:%f    \nQ23:%f    \nQ24:%f    \nQ34:%f    ", Q12, Q13, Q23, Q24, Q34);
	//	//printf("\nP12:%f    \nP13:%f    \nP23:%f    \nP24:%f    \nP34:%f    ", r12*Q12*Q12, r13*Q13*Q13, r23*Q23*Q23, r24*Q24*Q24, r34*Q34*Q34);
	//}
	
	{
		Q12 = 5;
		Q13 = 5;
		Q23 = -5;
		Q24 = 10;
		Q34 = 0;

		r12 =10;
		r13 = 1;
		r24 = 1;
		r34 = 10;

		dQ_1 = 0;
		dQ_2 = 0;
		dr23 = 0;

		double r23 =10;

		
		printf("\n\n\nr23 input:%f    ", r23);
		for (int i = 0; i < no_iteraion; i++)
		{
			c12 = Q12 > 0 ? 1 : -1;
			c13 = Q13 > 0 ? 1 : -1;
			c23 = Q23 > 0 ? 1 : -1;
			c24 = Q24 > 0 ? 1 : -1;
			c34 = Q34 > 0 ? 1 : -1;

			dQ_2 = -(c24*r24 *Q24 *Q24 - c23*r23*Q23*Q23 - c34*r34*Q34*Q34) / (2 * r24*fabs(Q24) + 2 * r23*fabs(Q23) + 2 * r34*fabs(Q34));
			r23 = fabs((c13*r13*Q13*Q13 - c12*r12*Q12*Q12) / c23 / Q23 / Q23);


			Q12 = Q12 + dQ_2;
			Q13 = Q13 - dQ_2;

			Q24 = Q24 + dQ_2;
			Q34 = Q34 - dQ_2;
		}
		printf("\nr23 output:%f    ", r23);
		printf("\nQ12:%f    \nQ13:%f    \nQ23:%f    \nQ24:%f    \nQ34:%f    ", Q12, Q13, Q23, Q24, Q34);
		printf("\nP12:%f    \nP13:%f    \nP23:%f    \nP24:%f    \nP34:%f    ", r12*Q12*Q12, r13*Q13*Q13, r23*Q23*Q23, r24*Q24*Q24, r34*Q34*Q34);
	}


	return 0;
}

