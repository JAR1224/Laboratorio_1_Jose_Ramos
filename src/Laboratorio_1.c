#include <pic14/pic12f683.h>

#define time 1

/* notes
1) quitar tabla cod_7seg y guardar valores en la codificacion de las instrucciones
2) manejar rand en bcd desde el principio
*/

typedef unsigned int word ;
word __at 0x2007 __CONFIG = (_CPD_OFF, _CP_OFF, _BOREN_OFF, _MCLRE_OFF, _PWRTE_OFF, _WDTE_OFF) ;

void send_byte(unsigned int cod_7seg);
unsigned int valido(unsigned int valor);
unsigned int rand_wait();
unsigned int count_1=0;
unsigned int count_2=0;
unsigned int blink=0;

unsigned int banderas = 0b00000000;
unsigned int historial[16]={0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF, \
				0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF};

void main(void)
{
	TRISIO = 0b00001000; //P0,1,2,3,4 como salidas, P5 como entrada
	GPIO = 0b00100000; //Pines empiezan en bajo

	ADCON0=0x00;                // Internal ADC OFF
    	ANSEL=0x00;
	CMCON0 = 0x07;

	unsigned int tx = 0x00;
	
	/*
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
	*/

    	//Loop forever
    	while ( 1 )
    	{

		tx = rand_wait();
		GP4=0;
		if ((tx & 0x0F) == 0x00) {
			send_byte(0b11111100);
		} else if ((tx & 0x0F) == 0x01) {
			send_byte(0b01100000);
		} else if ((tx & 0x0F) == 0x02) {
			send_byte(0b11011010);
		} else if ((tx & 0x0F) == 0x03) {
			send_byte(0b11110010);
		} else if ((tx & 0x0F) == 0x04) {
			send_byte(0b01100110);
		} else if ((tx & 0x0F) == 0x05) {
			send_byte(0b10110110);
		} else if ((tx & 0x0F) == 0x06) {
			send_byte(0b10111110);
		} else if ((tx & 0x0F) == 0x07) {
			send_byte(0b11100000);
		} else if ((tx & 0x0F) == 0x08) {
			send_byte(0b11111110);
		} else if ((tx & 0x0F) == 0x09) {
			send_byte(0b11100110);
		}

		GP4=1;
		if ((tx & 0xF0) == 0x00) {
			send_byte(0b11111100);
		} else if ((tx & 0xF0) == 0x10) {
			send_byte(0b01100000);
		} else if ((tx & 0xF0) == 0x20) {
			send_byte(0b11011010);
		} else if ((tx & 0xF0) == 0x30) {
			send_byte(0b11110010);
		} else if ((tx & 0xF0) == 0x40) {
			send_byte(0b01100110);
		} else if ((tx & 0xF0) == 0x50) {
			send_byte(0b10110110);
		} else if ((tx & 0xF0) == 0x60) {
			send_byte(0b10111110);
		} else if ((tx & 0xF0) == 0x70) {
			send_byte(0b11100000);
		} else if ((tx & 0xF0) == 0x80) {
			send_byte(0b11111110);
		} else if ((tx & 0xF0) == 0x90) {
			send_byte(0b11100110);
		}

		if ( (banderas & 0x02) == 0x02 ) {
				banderas &= 0x11111101;
				historial[0] = 0xFF;
				historial[1] = 0xFF;
				historial[2] = 0xFF;
				historial[3] = 0xFF;
				historial[4] = 0xFF;
				historial[5] = 0xFF;
				historial[6] = 0xFF;
				historial[7] = 0xFF;
				historial[8] = 0xFF;
				historial[9] = 0xFF;
				historial[10] = 0xFF;
				historial[11] = 0xFF;
				historial[12] = 0xFF;
				historial[13] = 0xFF;
				historial[14] = 0xFF;
				historial[14] = 0xFF;
		}


    	}

}


void send_byte(unsigned int cod) {

	for (unsigned int c = 0 ; c < 8 ; c++) {
		GP0=cod & 0x01;
		GP1=1;
		GP1=0;
		cod>>=1;
	}
	GP2=1;
	GP2=0;
}

unsigned int rand_wait() {

	unsigned int rand = 0x00;

	while(1) {

		if ( (rand & 0x0F) < 0x09) {
			rand+=0x01;
		} else if ((rand & 0xF0)>>4 < 9) {
			rand = (rand+0x10) & 0xF0;
		} else {
			rand = 0x00;
		}

		if ( ((banderas & 0x01) == 0x00) &&  (GP3==1) && (valido(rand)==1) ) {
			banderas |= 0x01;
			if ( (banderas & 0x02) == 0x02 ) {
				GP5=1;
				blink=1;
				return 0x99;
			}
			GP5=1;
			blink=0;
			return rand;
		} else if ( ((banderas & 0x01)==0x01) &&  (GP3==0) ) {
			banderas &= 0b11111110;
		}

		count_1+=1;
		if (count_1==0) {
			count_2+=1;
		}
		if (count_2 == time) {
			count_2=0;
			//GP5=~GP5;
			if ( blink == 1 ) {
				GP5=~GP5;
			}
		}
		
	}

}
 
unsigned int valido(unsigned int valor) {
	for (unsigned int c = 0; c < 16; c++) {
		if ( (historial[c] == 0xFF) ) {
			historial[c] = valor;
			return 1;
		} else if ( historial[c] == valor ) {
			return 0;
		}
	}
	banderas |= 0x02;
	return 1;
}

