#include <pic14/pic12f675.h>

typedef unsigned int word ;
word __at 0x2007 __CONFIG = (_FOSC_INTRCIO, _CPD_OFF, _CP_OFF, _BOREN_OFF, _MCLRE_OFF, _PWRTE_OFF, _WDTE_OFF) ;

void delay (unsigned int tiempo);

void main(void)
{
	//GPIO0=0x07;
	TRISIO = 0b00000000; //Poner todos los pines como salidas
	GPIO = 0b00010111; //Poner pines en alto

	//GPIO0=0x00;                        // make all GPIO port output
    	//TRISIO=0x00;                     // TRISIO direction as output
	ADCON0=0x00;                // Internal ADC OFF
    	ANSEL=0x00;
	CMCON = 0x7;
	//GPIO1=1;
 
	unsigned int time = 100;



	//delay(time);
	//delay(time); 
	//GPIO = GPIO | 0b00000010;

    	//Loop forever
    	while ( 1 )
    	{

		delay(time);
		delay(time);
		//GPIO0=1;
		//delay(time);
		//delay(time);
		GPIO1=1;
		delay(time);
		delay(time);
		//GPIO0=0;
		//delay(time);
		//delay(time);
		GPIO1=0;
    	}

	//GPIO = GPIO | 0b00000010;

}


void delay(unsigned int tiempo)
{
	unsigned int i;
	unsigned int j;

	for(i=0;i<tiempo;i++)
	  for(j=0;j<1275;j++);
}