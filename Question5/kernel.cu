#include <math.h>
#include <stdio.h>
#include<iostream>
using namespace std;
int main()
{
	//r value
	double r01=  1;
	double r24 = 1;	
	double r57 = 1;
	double r16 = 5;
	double r25 = 1;
	double r78 = 2;
	double r12 = 1;
	double r56 = 3;
	double r89 = 3;
	double r03 = 5;
	double r3e = 1;
	double r69 = 3;
	double r34 = 3;
	double r47 = 1;
	double r8a = 1;
	double rab = 3;
	double rad = 2;
	double reb = 2;
	double rbc = 2;
	double rdc = 1;
	double rdg = 5;
	double r9g = 1;
	double rgh = 1;
	double ref = 5;
	double rcf = 2;
	double rfh = 2;
	double rS0 = 1;
	double rEA = 1;
	double rEB = 1;


	//Q flow rate

	double Qin = 2.09457;

	double Q01 = Qin / 2.0;
	double Q24 = Qin / 8.0;
	double Q57 = Qin / 8.0;
	double Q16 = Qin / 4.0;
	double Q25 = Qin / 8.0;
	double Q78 = Qin / 4.0;
	double Q12 = Qin / 4.0;
	double Q56 = 0;
	double Q89 = 0;
	double Q03 = Qin / 2.0;
	double Q3e = Qin / 2.0;
	double Q69 = Qin / 4.0;
	double Q34 = 0;
	double Q47 = Qin / 8.0;
	double Q8a = Qin / 4.0;
	double Qab = Qin / 8.0;
	double Qad = Qin / 8.0;
	double Qeb = 0;
	double Qbc = Qin / 8.0;
	double Qdc = 0;
	double Qdg = Qin / 8.0;
	double Q9g = 0;
	double Qgh = Qin / 8.0;
	double Qef = Qin / 2.0;
	double Qcf = Qin / 8.0;
	double Qfh = Qin * 5.0 / 8.0;
	double QS0 = Qin;
	double QEA = Qin / 4.0;
	double QEB = Qin * 3.0 / 4.0;



	double dQ_1 = 0;
	double dQ_2 = 0;
	double dQ_3 = 0;
	double dQ_4 = 0;
	double dQ_5 = 0;
	double dQ_6 = 0;
	double dQ_7 = 0;
	double dQ_8 = 0;
	double dQ_9 = 0;
	double ds1 = 0;
	double ds2 = 0;

	int c01 = 1;
	int c24 = 1;
	int c57 = 1;
	int c16 = 1;
	int c25 = 1;
	int c78 = 1;
	int c12 = 1;
	int c56 = 1;
	int c89 = 1;
	int c03 = 1;
	int c3e = 1;
	int c69 = 1;
	int c34 = 1;
	int c47 = 1;

	int c8a = 1;
	int cab = 1;
	int cad = 1;
	int ceb = 1;
	int cbc = 1;
	int cdc = 1;
	int cdg = 1;
	int c9g = 1;
	int cgh = 1;
	int cef = 1;
	int ccf = 1;
	int cfh = 1;

	int cS0 = 1;
	int cEA = 1;
	int cEB = 1;


	int no_iteraion = 10000;
	


	for (int i = 0; i < no_iteraion; i++)
	{		
		c01 = Q01 >= 0 ? 1 : -1;
		c24 = Q24 >= 0 ? 1 : -1;
		c57 = Q57 >= 0 ? 1 : -1;
		c16 = Q16 >= 0 ? 1 : -1;
		c25 = Q25 >= 0 ? 1 : -1;
		c78 = Q78 >= 0 ? 1 : -1;
		c12 = Q12 >= 0 ? 1 : -1;
		c56 = Q56 >= 0 ? 1 : -1;
		c89 = Q89 >= 0 ? 1 : -1;
		c03 = Q03 >= 0 ? 1 : -1;
		c3e = Q3e >= 0 ? 1 : -1;
		c69 = Q69 >= 0 ? 1 : -1;
		c34 = Q34 >= 0 ? 1 : -1;
		c47 = Q47 >= 0 ? 1 : -1;

		c8a = Q8a >= 0 ? 1 : -1;
		cab = Qab >= 0 ? 1 : -1;
		cad = Qad >= 0 ? 1 : -1;
		ceb = Qeb >= 0 ? 1 : -1;
		cbc = Qbc >= 0 ? 1 : -1;
		cdc = Qdc >= 0 ? 1 : -1;
		cdg = Qdg >= 0 ? 1 : -1;
		c9g = Q9g >= 0 ? 1 : -1;
		cgh = Qgh >= 0 ? 1 : -1;
		cef = Qef >= 0 ? 1 : -1;
		ccf = Qcf >= 0 ? 1 : -1;
		cfh = Qfh >= 0 ? 1 : -1;

		cS0 = QS0 >= 0 ? 1 : -1;
		cEA = QEA >= 0 ? 1 : -1;
		cEB = QEB >= 0 ? 1 : -1;

		 dQ_1 = -(c01*r01 *Q01 *Q01 + c12*r12*Q12*Q12 + c24*r24*Q24*Q24 - c34*r34*Q34*Q34 - c03*r03*Q03*Q03)
			 / (2 * r01*fabs(Q01) + 2 * r12*fabs(Q12) + 2 * r24*fabs(Q24) + 2 * r34*fabs(Q34) + 2 * r03*fabs(Q03));

		 dQ_2 = -(c16*r16 *Q16 *Q16 - c56*r56*Q56*Q56 - c25*r25*Q25*Q25 - c12*r12*Q12*Q12)
			 / (2 * r16*fabs(Q16) + 2 * r56*fabs(Q56) + 2 * r25*fabs(Q25) + 2 * r12*fabs(Q12));

		 dQ_3 = -(c25*r25 *Q25 *Q25 + c57*r57*Q57*Q57 - c47*r47*Q47*Q47 - c24*r24*Q24*Q24)
			 / (2 * r25*fabs(Q25) + 2 * r57*fabs(Q57) + 2 * r47*fabs(Q47) + 2 * r24*fabs(Q24));

		 dQ_4 = -(c34*r34 *Q34 *Q34 + c47*r47*Q47*Q47 + c78*r78*Q78*Q78 + c8a*r8a*Q8a*Q8a + cab*rab*Qab*Qab - ceb*reb*Qeb*Qeb - c3e*r3e*Q3e*Q3e)
			 / (2 * r34*fabs(Q34) + 2 * r47*fabs(Q47) + 2 * r78*fabs(Q78) + 2 * r8a*fabs(Q8a) + 2 * rab*fabs(Qab) + 2 * reb*fabs(Qeb) + 2 * r3e*fabs(Q3e));

		 dQ_5 = -(c56*r56 *Q56 *Q56 + c69*r69*Q69*Q69 - c89*r89*Q89*Q89 - c78*r78*Q78*Q78 - c57*r57*Q57*Q57)
			 / (2 * r56*fabs(Q56) + 2 * r12*fabs(Q12) + 2 * r89*fabs(Q89) + 2 * r78*fabs(Q78) + 2 * r57*fabs(Q57));

		 dQ_6 = -(c89*r89*Q89*Q89 - c9g*r9g*Q9g*Q9g - cdg*rdg*Qdg*Qdg - cad*rad*Qad*Qad - c8a*r8a*Q8a*Q8a)
			 / (2 * r89*fabs(Q89) + 2 * r9g*fabs(Q9g) + 2 * rdg*fabs(Qdg) + 2 * rad*fabs(Qad) + 2 * r8a*fabs(Q8a));

		 dQ_7 = -(cad*rad *Qad *Qad + cdc*rdc*Qdc*Qdc - cbc*rbc*Qbc*Qbc - cab*rab*Qab*Qab)
			 / (2 * rad*fabs(Qad) + 2 * rdc*fabs(Qdc) + 2 * rbc*fabs(Qbc) + 2 * rab*fabs(Qab));

		 dQ_8 = -(ceb*reb *Qeb *Qeb + cbc*rbc*Qbc*Qbc + ccf*rcf*Qcf*Qcf - cef*ref*Qef*Qef)
			 / (2 * reb*fabs(Qeb) + 2 * rbc*fabs(Qbc) + 2 * rcf*fabs(Qcf) + 2 * ref*fabs(Qef));

		 dQ_9 = -(cdg*rdg *Qdg *Qdg + cgh*rgh*Qgh*Qgh - cfh*rfh*Qfh*Qfh - ccf*rcf*Qcf*Qcf - cdc*rdc*Qdc*Qdc)
			 / (2 * rdg*fabs(Qdg) + 2 * rgh*fabs(Qgh) + 2 * rfh*fabs(Qfh) + 2 * rcf*fabs(Qcf) + 2 * rdc*fabs(Qdc));

		 ds1 = -(-10 + cS0*rS0 *QS0 *QS0 +c01*r01 *Q01 *Q01 + c16*r16*Q16*Q16 + c69*r69*Q69*Q69 + cEA*rEA*QEA*QEA)
			 / (2 * rS0*fabs(QS0) + 2 * r01*fabs(Q01) + 2 * r16*fabs(Q16) + 2 * r69*fabs(Q69) + 2 * rEA*fabs(QEA));

		 ds2 = -(-10 + cS0*rS0 *QS0 *QS0 + c03*r03 *Q03 *Q03 + c3e*r3e*Q3e*Q3e + cef*ref*Qef*Qef + cfh*rfh*Qfh*Qfh + cEB*rEB*QEB*QEB)
			 / (2 * rS0*fabs(QS0) + 2 * r03*fabs(Q03) + 2 * r3e*fabs(Q3e) + 2 * ref*fabs(Qef) + 2 * rfh*fabs(Qfh) + 2 * rEB*fabs(QEB));

		 Q01 = Q01 + dQ_1 + ds1;
		 Q24 = Q24 + dQ_1 - dQ_3;
		 Q57 = Q57 + dQ_3 - dQ_5;
		 Q16 = Q16 + dQ_2 + ds1;
		 Q25 = Q25 - dQ_2 + dQ_3;
		 Q78 = Q78 + dQ_4 - dQ_5;		 
		 Q12 = Q12 + dQ_1 - dQ_2;
		 Q56 = Q56 - dQ_2 + dQ_5;
		 Q89 = Q89 - dQ_5 + dQ_6;
		 Q03 = Q03 - dQ_1 + ds2;
		 Q3e = Q3e - dQ_4 + ds2;;
		 Q69 = Q69 + dQ_5 + ds1;
		 Q34 = Q34 - dQ_1 + dQ_4;
		 Q47 = Q47 - dQ_3 + dQ_4;
		 

		 Q8a = Q8a +dQ_4 - dQ_6;
		 Qab = Qab + dQ_4 - dQ_7;
		 Qad = Qad + dQ_7 - dQ_6;
		 Qeb = Qeb - dQ_4 + dQ_8;
		 Qbc = Qbc - dQ_7 + dQ_8;
		 Qdc = Qdc + dQ_7 - dQ_9;
		 Qdg = Qdg - dQ_6 + dQ_9;
		 Q9g = Q9g - dQ_6;
		 Qgh = Qgh + dQ_9;
		 Qef = Qef - dQ_8 + ds2;
		 Qcf = Qcf + dQ_8 - dQ_9;
		 Qfh = Qfh - dQ_9 + ds2;
		 QS0 = QS0 + ds1 + ds2;
		 QEA = QEA + ds1;
		 QEB = QEB + ds2;


	}
	
	double P01 = c01*r01* Q01*Q01;
	double P24 = c24*r24*Q24*Q24;
	double P57 = c57*r57*Q57*Q57;
	double P16 = c16*r16*Q16*Q16;
	double P25 = c25*r25*Q25*Q25;
	double P78 = c78*r78*Q78*Q78;
	double P12 = c12*r12*Q12*Q12;
	double P56 = c56*r56*Q56*Q56;
	double P89 = c89*r89*Q89*Q89;
	double P03 = c03*r03*Q03*Q03;
	double P3e = c3e*r3e*Q3e*Q3e;
	double P69 = c69*r69*Q69*Q69;
	double P34 = c34*r34*Q34*Q34;
	double P47 = c47*r47*Q47*Q47;


	double P8a = c8a*r8a*Q8a*Q8a;
	double Pab = cab*rab*Qab*Qab;
	double Pad = cad*rad*Qad*Qad;
	double Peb = ceb*reb*Qeb*Qeb;
	double Pbc = cbc*rbc*Qbc*Qbc;
	double Pdc = cdc*rdc*Qdc*Qdc;
	double Pdg = cdg*rdg*Qdg*Qdg;
	double P9g = c9g*r9g*Q9g*Q9g;
	double Pgh = cgh*rgh*Qgh*Qgh;
	double Pef = cef*ref*Qef*Qef;
	double Pcf = ccf*rcf*Qcf*Qcf;
	double Pfh = cfh*rfh*Qfh*Qfh;
	double PS0 = cS0*rS0*QS0*QS0;
	double PEA = cEA*rEA*QEA*QEA;
	double PEB = cEB*rEB*QEB*QEB;


	std::cout << P01 + P12 + P24 - P34 - P03<<endl;
	std::cout << P16 - P56 - P25 - P12 << endl;
	std::cout << P25 + P57 - P47 - P24 << endl;
	std::cout << P34 + P47 + P78 + P8a + Pab - Peb - P3e << endl;
	std::cout << P56 + P69 - P78 - P89 - P57 << endl;
	std::cout << P89 - P9g - Pdg - Pad -P8a<< endl;
	std::cout << Pad + Pdc - Pbc - Pab << endl;
	std::cout << Peb + Pbc + Pcf - Pef << endl;
	std::cout << Pdg + Pgh - Pfh - Pcf - Pdc << endl;
	std::cout << -10 + PS0 + P01 + P16 + P69 + PEA << endl;
	std::cout << -10 + PS0 + P03 + P3e + Pef + Pfh + PEB << endl;

	return 0;
}

