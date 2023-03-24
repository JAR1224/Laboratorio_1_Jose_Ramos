#include <pic14/pic12f683.h>

typedef unsigned int word ;
word __at 0x2007 __CONFIG = (_CPD_OFF, _CP_OFF, _BOREN_OFF, _MCLRE_OFF, _PWRTE_OFF, _WDTE_OFF) ;

void send_byte(unsigned int cod_7seg);

unsigned int wait();

unsigned int banderas=0b00000000;

void main(void)
{
	TRISIO = 0b00101000; //P0,1,2,4 como salidas, P3,5 como entrada
	GPIO = 0b00000000; //Pines empiezan en bajo

	ADCON0=0x00;                // Internal ADC OFF
    	ANSEL=0x00;
	CMCON0 = 0x07;
	
	unsigned int cod_7seg[10]={0b11111100,\	//0
				0b01100000,\ 	//1
				0b11011010,\	//2
				0b11110010,\	//3
				0b01100110,\	//4
				0b10110110,\	//5
				0b10111110,\	//6
				0b11100000,\	//7
				0b11111110,\	//8
				0b11100110};	//9
	

	//send_byte(cod_7seg[0]);
	//send_byte(cod_7seg[1]);
	//send_byte(cod_7seg[2]);
	//send_byte(cod_7seg[3]);
	//send_byte(cod_7seg[4]);
	//send_byte(cod_7seg[5]);
	//send_byte(cod_7seg[6]);
	//send_byte(cod_7seg[7]);
	//send_byte(cod_7seg[8]);
	//send_byte(cod_7seg[9]);

	//GPIO0=0;

	//GPIO1=1;
	//delay(time);
	//GPIO1=0;

	//GPIO0=0;

	//GPIO1=1;
	//delay(time);
	//GPIO1=0;

	//GPIO0=1;

	//GPIO1=1;
	//delay(time);
	//GPIO1=0;

	//GPIO0=1;

	//GPIO1=1;
	//delay(time);
	//GPIO1=0;

	//GPIO0=0;

	//GPIO1=1;
	//delay(time);
	//GPIO1=0;

	//GPIO0=0;

	//GPIO1=1;
	//delay(time);
	//GPIO1=0;

	//GPIO0=1;

	//GPIO1=1;
	//delay(time);
	//GPIO1=0;

	//GPIO0=1;

	//GPIO1=1;
	//delay(time);
	//GPIO1=0;

	//--
	//GPIO2=1;
	//GPIO2=0;

	//GPIO = GPIO | 0b00000010;

    	//Loop forever
    	while ( 1 )
    	{

		send_byte(wait() & 0x07);

    	}


}


void send_byte(unsigned int cod) {

	unsigned int bit;

	for (unsigned int c = 0 ; c < 8 ; c++) {
		bit = cod & 0x01;
		GP0=bit;
		GP1=1;
		GP1=0;
		cod>>=1;
	}
	GP2=1;
	GP2=0;
}

unsigned int wait() {

	unsigned int rand = 0;
	while(1) {
		if ( (banderas==0x00) &&  (GP3==1) ) {
			banderas = 0x01;
			GP4=GP3;
			return rand;
		} else if ( (banderas==0x01) &&  (GP3==0) ) {
			banderas = 0x00;
			GP4=GP3;
		}
		rand+=1;
		
	}

}