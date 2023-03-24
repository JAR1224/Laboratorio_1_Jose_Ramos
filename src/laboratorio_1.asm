;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.0.0 #11528 (Linux)
;--------------------------------------------------------
; PIC port for the 14-bit core
;--------------------------------------------------------
;	.file	"laboratorio_1.c"
	list	p=12f683
	radix dec
	include "p12f683.inc"
;--------------------------------------------------------
; config word(s)
;--------------------------------------------------------
	__config 0x0
;--------------------------------------------------------
; external declarations
;--------------------------------------------------------
	extern	_ANSEL
	extern	_TRISIO
	extern	_ADCON0
	extern	_CMCON0
	extern	_GPIO
	extern	_GPIObits
	extern	__sdcc_gsinit_startup
;--------------------------------------------------------
; global declarations
;--------------------------------------------------------
	global	_main
	global	_send_byte

	global PSAVE
	global SSAVE
	global WSAVE
	global STK12
	global STK11
	global STK10
	global STK09
	global STK08
	global STK07
	global STK06
	global STK05
	global STK04
	global STK03
	global STK02
	global STK01
	global STK00

sharebank udata_ovr 0x0070
PSAVE	res 1
SSAVE	res 1
WSAVE	res 1
STK12	res 1
STK11	res 1
STK10	res 1
STK09	res 1
STK08	res 1
STK07	res 1
STK06	res 1
STK05	res 1
STK04	res 1
STK03	res 1
STK02	res 1
STK01	res 1
STK00	res 1

;--------------------------------------------------------
; global definitions
;--------------------------------------------------------
;--------------------------------------------------------
; absolute symbol definitions
;--------------------------------------------------------
;--------------------------------------------------------
; compiler-defined variables
;--------------------------------------------------------
UDL_laboratorio_1_0	udata
r0x1019	res	1
r0x101A	res	1
r0x1015	res	1
r0x1014	res	1
r0x1016	res	1
r0x1017	res	1
r0x1018	res	1
_main_cod_7seg_65537_4	res	20
;--------------------------------------------------------
; initialized data
;--------------------------------------------------------
;--------------------------------------------------------
; initialized absolute data
;--------------------------------------------------------
;--------------------------------------------------------
; overlayable items in internal ram 
;--------------------------------------------------------
;	udata_ovr
;--------------------------------------------------------
; reset vector 
;--------------------------------------------------------
STARTUP	code 0x0000
	nop
	pagesel __sdcc_gsinit_startup
	goto	__sdcc_gsinit_startup
;--------------------------------------------------------
; code
;--------------------------------------------------------
code_laboratorio_1	code
;***
;  pBlock Stats: dbName = M
;***
;has an exit
;functions called:
;   _send_byte
;   _send_byte
;3 compiler assigned registers:
;   r0x1019
;   r0x101A
;   STK00
;; Starting pCode block
S_laboratorio_1__main	code
_main:
; 2 exit points
;	.line	10; "laboratorio_1.c"	TRISIO = 0b00001000; //P0,1,2,4,5 como salidas, P3 como entrada
	MOVLW	0x08
	BANKSEL	_TRISIO
	MOVWF	_TRISIO
;	.line	11; "laboratorio_1.c"	GPIO = 0b00010000; //P4 empieza en alto (output_en del shift register)
	MOVLW	0x10
	BANKSEL	_GPIO
	MOVWF	_GPIO
;	.line	13; "laboratorio_1.c"	ADCON0=0x00;                // Internal ADC OFF
	CLRF	_ADCON0
;	.line	14; "laboratorio_1.c"	ANSEL=0x00;
	BANKSEL	_ANSEL
	CLRF	_ANSEL
;	.line	15; "laboratorio_1.c"	CMCON0 = 0x07;
	MOVLW	0x07
	BANKSEL	_CMCON0
	MOVWF	_CMCON0
;;/home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6828: size=1, offset=0, AOP_TYPE(res)=8
;	.line	17; "laboratorio_1.c"	unsigned int cod_7seg[10]={0b11111100,\	//0
	MOVLW	0xfc
	BANKSEL	_main_cod_7seg_65537_4
	MOVWF	(_main_cod_7seg_65537_4 + 0)
;;/home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6828: size=0, offset=1, AOP_TYPE(res)=8
	CLRF	(_main_cod_7seg_65537_4 + 1)
;;/home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6828: size=1, offset=0, AOP_TYPE(res)=8
	MOVLW	0x60
	MOVWF	(_main_cod_7seg_65537_4 + 2)
;;/home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6828: size=0, offset=1, AOP_TYPE(res)=8
	CLRF	(_main_cod_7seg_65537_4 + 3)
;;/home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6828: size=1, offset=0, AOP_TYPE(res)=8
	MOVLW	0xda
	MOVWF	(_main_cod_7seg_65537_4 + 4)
;;/home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6828: size=0, offset=1, AOP_TYPE(res)=8
	CLRF	(_main_cod_7seg_65537_4 + 5)
;;/home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6828: size=1, offset=0, AOP_TYPE(res)=8
	MOVLW	0xf2
	MOVWF	(_main_cod_7seg_65537_4 + 6)
;;/home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6828: size=0, offset=1, AOP_TYPE(res)=8
	CLRF	(_main_cod_7seg_65537_4 + 7)
;;/home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6828: size=1, offset=0, AOP_TYPE(res)=8
	MOVLW	0x66
	MOVWF	(_main_cod_7seg_65537_4 + 8)
;;/home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6828: size=0, offset=1, AOP_TYPE(res)=8
	CLRF	(_main_cod_7seg_65537_4 + 9)
;;/home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6828: size=1, offset=0, AOP_TYPE(res)=8
	MOVLW	0xb6
	MOVWF	(_main_cod_7seg_65537_4 + 10)
;;/home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6828: size=0, offset=1, AOP_TYPE(res)=8
	CLRF	(_main_cod_7seg_65537_4 + 11)
;;/home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6828: size=1, offset=0, AOP_TYPE(res)=8
	MOVLW	0xbe
	MOVWF	(_main_cod_7seg_65537_4 + 12)
;;/home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6828: size=0, offset=1, AOP_TYPE(res)=8
	CLRF	(_main_cod_7seg_65537_4 + 13)
;;/home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6828: size=1, offset=0, AOP_TYPE(res)=8
	MOVLW	0xe0
	MOVWF	(_main_cod_7seg_65537_4 + 14)
;;/home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6828: size=0, offset=1, AOP_TYPE(res)=8
	CLRF	(_main_cod_7seg_65537_4 + 15)
;;/home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6828: size=1, offset=0, AOP_TYPE(res)=8
	MOVLW	0xfe
	MOVWF	(_main_cod_7seg_65537_4 + 16)
;;/home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6828: size=0, offset=1, AOP_TYPE(res)=8
	CLRF	(_main_cod_7seg_65537_4 + 17)
;;/home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6828: size=1, offset=0, AOP_TYPE(res)=8
	MOVLW	0xe6
	MOVWF	(_main_cod_7seg_65537_4 + 18)
;;/home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6828: size=0, offset=1, AOP_TYPE(res)=8
	CLRF	(_main_cod_7seg_65537_4 + 19)
;	.line	35; "laboratorio_1.c"	send_byte(cod_7seg[6]);
	MOVF	(_main_cod_7seg_65537_4 + 12),W
	BANKSEL	r0x1019
	MOVWF	r0x1019
	BANKSEL	_main_cod_7seg_65537_4
	MOVF	(_main_cod_7seg_65537_4 + 13),W
	BANKSEL	r0x101A
	MOVWF	r0x101A
	MOVF	r0x1019,W
	MOVWF	STK00
	MOVF	r0x101A,W
	PAGESEL	_send_byte
	CALL	_send_byte
	PAGESEL	$
_00106_DS_:
;	.line	95; "laboratorio_1.c"	while ( 1 )
	GOTO	_00106_DS_
;	.line	102; "laboratorio_1.c"	}
	RETURN	
; exit point of _main

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;6 compiler assigned registers:
;   r0x1014
;   STK00
;   r0x1015
;   r0x1016
;   r0x1017
;   r0x1018
;; Starting pCode block
S_laboratorio_1__send_byte	code
_send_byte:
; 2 exit points
;	.line	105; "laboratorio_1.c"	void send_byte(unsigned int cod) {
	BANKSEL	r0x1014
	MOVWF	r0x1014
	MOVF	STK00,W
	MOVWF	r0x1015
;	.line	109; "laboratorio_1.c"	for (unsigned int c = 0 ; c < 8 ; c++) {
	CLRF	r0x1016
	CLRF	r0x1017
;;unsigned compare: left < lit(0x8=8), size=2
_00113_DS_:
	MOVLW	0x00
	BANKSEL	r0x1017
	SUBWF	r0x1017,W
	BTFSS	STATUS,2
	GOTO	_00126_DS_
	MOVLW	0x08
	SUBWF	r0x1016,W
_00126_DS_:
	BTFSC	STATUS,0
	GOTO	_00111_DS_
;;genSkipc:3307: created from rifx:0x7ffcee608860
;	.line	110; "laboratorio_1.c"	bit = cod & 0x01;
	BANKSEL	r0x1015
	MOVF	r0x1015,W
	MOVWF	r0x1018
;	.line	111; "laboratorio_1.c"	GP0=bit;
	RRF	r0x1018,W
	BTFSC	STATUS,0
	GOTO	_00001_DS_
	BANKSEL	_GPIObits
	BCF	_GPIObits,0
_00001_DS_:
	BTFSS	STATUS,0
	GOTO	_00002_DS_
	BANKSEL	_GPIObits
	BSF	_GPIObits,0
_00002_DS_:
;	.line	112; "laboratorio_1.c"	GP1=1;
	BANKSEL	_GPIObits
	BSF	_GPIObits,1
;	.line	113; "laboratorio_1.c"	GP1=0;
	BCF	_GPIObits,1
;;shiftRight_Left2ResultLit:5474: shCount=1, size=2, sign=0, same=1, offr=0
;	.line	114; "laboratorio_1.c"	cod>>=1;
	BCF	STATUS,0
	BANKSEL	r0x1014
	RRF	r0x1014,F
	RRF	r0x1015,F
;	.line	109; "laboratorio_1.c"	for (unsigned int c = 0 ; c < 8 ; c++) {
	INCF	r0x1016,F
	BTFSC	STATUS,2
	INCF	r0x1017,F
	GOTO	_00113_DS_
_00111_DS_:
;	.line	116; "laboratorio_1.c"	GP2=1;
	BANKSEL	_GPIObits
	BSF	_GPIObits,2
;	.line	117; "laboratorio_1.c"	GP2=0;
	BCF	_GPIObits,2
;	.line	118; "laboratorio_1.c"	}
	RETURN	
; exit point of _send_byte


;	code size estimation:
;	   82+   18 =   100 instructions (  236 byte)

	end
