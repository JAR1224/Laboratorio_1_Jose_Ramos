#include <pic14/pic12f683.h>

/* notes
1) quitar tabla cod_7seg y guardar valores en la codificacion de las instrucciones
2) manejar rand en bcd desde el principio
*/

typedef unsigned int word ;
word __at 0x2007 __CONFIG = (_CPD_OFF, _CP_OFF, _BOREN_OFF, _MCLRE_OFF, _PWRTE_OFF, _WDTE_OFF) ;

void send_byte(unsigned int cod_7seg);
unsigned int valido(unsigned int valor);
unsigned int rand_wait();

unsigned int banderas = 0b00000000;
unsigned int historial[8]={0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00};

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

    	//Loop forever
    	while ( 1 )
    	{

		send_byte(cod_7seg[rand_wait() & 0x0F]);

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

unsigned int rand_wait() {

	unsigned int rand = 0;

	while(1) {

		rand += 1;

		if ( ((banderas & 0x01) == 0x00) &&  (GP3==1) && (rand <= 99) && (valido(rand)==1) ) {
			banderas |= 0x01;
			if ( banderas & 0x02 == 0x02 ) {
				return 99;
			}
			rand = ((rand & 0x01)*1) + ((rand & 0x01)*2) + ((rand & 0x01)*4) + ((rand & 0x01)*8);
			return rand;
		} else if ( ((banderas & 0x01)==0x01) &&  (GP3==0) ) {
			banderas &= 0xFE;
		}
		
	}

}
 
unsigned int valido(unsigned int valor) {
	for (unsigned int c = 0; c < 8; c++) {
		if ( ((historial[c] & 0xF0) == 0x00) ) {
			historial[c] |= valor<<4;
			return 1;
		} else if ( ((historial[c] & 0x0F) == 0x00) ) {
			historial[c] |= valor;
			return 1;
		} else if ( ((historial[c] & 0xF0) == valor<<4) || ((historial[c] & 0x0F) == valor) ) {
			return 0;
		}
	}
	banderas |= 0x02;
	return 1;
}

