// Test.cpp : 定義主控台應用程式的進入點。
//

#include "stdafx.h"
#include <math.h>

int main()
{
	double Q12 = 0;
	double Q13 = 10;
	double Q23 = -3.333333;
	double Q24 = 3.333333;
	double Q34 = 6.666667;

	double r12 = 5;
	double r13 = 1;
	double r23 = 10;
	double r24 = 1;
	double r34 = 5;
	double dQ_1;
	double dQ_2;
	double dr23 = 0;


	int c12 = 0;
	int c13 = 0;
	int c23 = 0;
	int c24 = 0;
	int c34 = 0;



	int no_iteraion = 200;

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
		//r23 = (c13*r13*Q13*Q13 - c12*r12*Q12*Q12) / c23 / Q23 / Q23;


		Q12 = Q12 + dQ_2;
		Q13 = Q13 - dQ_2;

		Q24 = Q24 + dQ_2;
		Q34 = Q34 - dQ_2;

		r23 = (c13*r13*Q13*Q13 - c12*r12*Q12*Q12) / c23 / Q23 / Q23;

	}


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

		//dQ_2 = -(c24*r24 *Q24 *Q24 - c23*r23*Q23*Q23 - c34*r34*Q34*Q34) / (2 * r24*fabs(Q24) + 2 * r23*fabs(Q23) + 2 * r34*fabs(Q34));
		//r23 = (c13*r13*Q13*Q13 - c12*r12*Q12*Q12) / c23 / Q23 / Q23;


		Q12 = Q12 + dQ_1;
		Q13 = Q13 - dQ_1;

		Q24 = Q24 + dQ_1;
		Q34 = Q34 - dQ_1;

		r23 = (c13*r13*Q13*Q13 - c12*r12*Q12*Q12) / c23 / Q23 / Q23;

	}


    return 0;
}

