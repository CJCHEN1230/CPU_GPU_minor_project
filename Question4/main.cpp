#include<stdio.h>
#include<malloc.h>
#include<iostream>
#include "kernel.h"


extern double *d_answer;
extern double *h_answer;

int main()
{



	Allocate_Memory();

	Send_To_Device();

	Launch_hardy_cross();

	Get_From_Memory();

	printf("\nQ01:%f    \nQ03:%f    \nQ12:%f    \nQ16:%f    \nQ24:%f    ", h_answer[0], h_answer[1], h_answer[2], h_answer[3], h_answer[4]);
	printf("\nQ25:%f    \nQ34:%f    \nQ38:%f    \nQ47:%f    \nQ56:%f    ", h_answer[5], h_answer[6], h_answer[7], h_answer[8], h_answer[9]);
	printf("\nQ57:%f    \nQ69:%f    \nQ78:%f    \nQ89:%f     ", h_answer[10], h_answer[11], h_answer[12], h_answer[13]);

	Free_Memory();



	
	
	/*printf("\nQ01:%f    \nQ03:%f    \nQ12:%f    \nQ16:%f    \nQ24:%f    ", Q01, Q03, Q12, Q16, Q24);
	printf("\nQ25:%f    \nQ34:%f    \nQ38:%f    \nQ47:%f    \nQ56:%f    ", Q25, Q34, Q38, Q47, Q56);
	printf("\nQ57:%f    \nQ69:%f    \nQ78:%f    \nQ89:%f     ", Q57, Q69, Q78, Q89);


	printf("\n\n");
	printf("\nHL01:%f    \nHL03:%f    \nHL12:%f    \nHL16:%f    \nHL24:%f    ", Q01*Q01*r01, Q03*Q03*r03, Q12*Q12*r12, Q16*Q16*r16, Q24*Q24*r24);
	printf("\nHL25:%f    \nHL34:%f    \nHL38:%f    \nHL47:%f    \nHL56:%f    ", Q25*Q25*r25, Q34*Q34*r34, Q38*Q38*r38, Q47*Q47*r47, Q56*Q56*r56);
	printf("\nHL57:%f    \nHL69:%f    \nHL78:%f    \nHL89:%f     ", Q57*Q57*r57, Q69*Q69*r69, Q78*Q78*r78, Q89*Q89*r89);*/


	return 0;
}




