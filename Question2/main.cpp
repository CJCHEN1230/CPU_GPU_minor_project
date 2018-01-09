#include<stdio.h>
#include<malloc.h>
#include"kernel.h"
#include<iostream>

extern double *d_answer;
extern double *h_answer;
extern double *hb_answer;


int main()
{
	Allocate_Memory();

	Send_To_Device();

	Launch_hardy_cross();

	Get_From_Memory();

	printf("\nQ12:%f    \nQ13:%f    \nQ23:%f    \nQ24:%f    \nQ34:%f    ", hb_answer[0], hb_answer[1], hb_answer[2], hb_answer[3], hb_answer[4]);

	Free_Memory();
	
	return 0;
}




