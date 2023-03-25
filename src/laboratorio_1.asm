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
	extern	__mulint
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
	global	_historial
	global	_banderas
	global	_send_byte
	global	_rand_wait
	global	_valido

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
r0x1044	res	1
r0x1043	res	1
r0x1045	res	1
r0x1046	res	1
r0x103F	res	1
r0x103E	res	1
r0x1040	res	1
r0x1041	res	1
r0x1042	res	1
r0x1036	res	1
r0x1037	res	1
r0x1038	res	1
r0x1039	res	1
r0x103B	res	1
r0x103A	res	1
r0x103C	res	1
r0x1027	res	1
r0x1026	res	1
r0x1029	res	1
r0x1028	res	1
r0x102A	res	1
r0x102B	res	1
r0x102C	res	1
r0x102D	res	1
r0x102E	res	1
r0x102F	res	1
r0x1030	res	1
r0x1031	res	1
r0x1032	res	1
r0x1033	res	1
r0x1034	res	1
r0x1035	res	1
_main_cod_7seg_65537_5	res	20
;--------------------------------------------------------
; initialized data
;--------------------------------------------------------

IDD_laboratorio_1_0	idata
_banderas
	db	0x00, 0x00	; 0


IDD_laboratorio_1_1	idata
_historial
	db	0x00, 0x00	; 0
	db	0x00, 0x00	; 0
	db	0x00, 0x00	; 0
	db	0x00, 0x00	; 0
	db	0x00, 0x00	; 0
	db	0x00, 0x00	; 0
	db	0x00, 0x00	; 0
	db	0x00, 0x00	; 0

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
;   _rand_wait
;   __mulint
;   _send_byte
;   _rand_wait
;   __mulint
;   _send_byte
;7 compiler assigned registers:
;   r0x1043
;   STK00
;   r0x1044
;   STK02
;   STK01
;   r0x1045
;   r0x1046
;; Starting pCode block
S_laboratorio_1__main	code
_main:
; 2 exit points
;	.line	15; "laboratorio_1.c"	TRISIO = 0b00101000; //P0,1,2,4 como salidas, P3,5 como entrada
	MOVLW	0x28
	BANKSEL	_TRISIO
	MOVWF	_TRISIO
;	.line	16; "laboratorio_1.c"	GPIO = 0b00000000; //Pines empiezan en bajo
	BANKSEL	_GPIO
	CLRF	_GPIO
;	.line	18; "laboratorio_1.c"	ADCON0=0x00;                // Internal ADC OFF
	CLRF	_ADCON0
;	.line	19; "laboratorio_1.c"	ANSEL=0x00;
	BANKSEL	_ANSEL
	CLRF	_ANSEL
;	.line	20; "laboratorio_1.c"	CMCON0 = 0x07;
	MOVLW	0x07
	BANKSEL	_CMCON0
	MOVWF	_CMCON0
;;/home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6828: size=1, offset=0, AOP_TYPE(res)=8
;	.line	22; "laboratorio_1.c"	unsigned int cod_7seg[10]={0b11111100,\	//0
	MOVLW	0xfc
	BANKSEL	_main_cod_7seg_65537_5
	MOVWF	(_main_cod_7seg_65537_5 + 0)
;;/home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6828: size=0, offset=1, AOP_TYPE(res)=8
	CLRF	(_main_cod_7seg_65537_5 + 1)
;;/home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6828: size=1, offset=0, AOP_TYPE(res)=8
	MOVLW	0x60
	MOVWF	(_main_cod_7seg_65537_5 + 2)
;;/home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6828: size=0, offset=1, AOP_TYPE(res)=8
	CLRF	(_main_cod_7seg_65537_5 + 3)
;;/home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6828: size=1, offset=0, AOP_TYPE(res)=8
	MOVLW	0xda
	MOVWF	(_main_cod_7seg_65537_5 + 4)
;;/home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6828: size=0, offset=1, AOP_TYPE(res)=8
	CLRF	(_main_cod_7seg_65537_5 + 5)
;;/home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6828: size=1, offset=0, AOP_TYPE(res)=8
	MOVLW	0xf2
	MOVWF	(_main_cod_7seg_65537_5 + 6)
;;/home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6828: size=0, offset=1, AOP_TYPE(res)=8
	CLRF	(_main_cod_7seg_65537_5 + 7)
;;/home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6828: size=1, offset=0, AOP_TYPE(res)=8
	MOVLW	0x66
	MOVWF	(_main_cod_7seg_65537_5 + 8)
;;/home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6828: size=0, offset=1, AOP_TYPE(res)=8
	CLRF	(_main_cod_7seg_65537_5 + 9)
;;/home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6828: size=1, offset=0, AOP_TYPE(res)=8
	MOVLW	0xb6
	MOVWF	(_main_cod_7seg_65537_5 + 10)
;;/home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6828: size=0, offset=1, AOP_TYPE(res)=8
	CLRF	(_main_cod_7seg_65537_5 + 11)
;;/home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6828: size=1, offset=0, AOP_TYPE(res)=8
	MOVLW	0xbe
	MOVWF	(_main_cod_7seg_65537_5 + 12)
;;/home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6828: size=0, offset=1, AOP_TYPE(res)=8
	CLRF	(_main_cod_7seg_65537_5 + 13)
;;/home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6828: size=1, offset=0, AOP_TYPE(res)=8
	MOVLW	0xe0
	MOVWF	(_main_cod_7seg_65537_5 + 14)
;;/home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6828: size=0, offset=1, AOP_TYPE(res)=8
	CLRF	(_main_cod_7seg_65537_5 + 15)
;;/home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6828: size=1, offset=0, AOP_TYPE(res)=8
	MOVLW	0xfe
	MOVWF	(_main_cod_7seg_65537_5 + 16)
;;/home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6828: size=0, offset=1, AOP_TYPE(res)=8
	CLRF	(_main_cod_7seg_65537_5 + 17)
;;/home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6828: size=1, offset=0, AOP_TYPE(res)=8
	MOVLW	0xe6
	MOVWF	(_main_cod_7seg_65537_5 + 18)
;;/home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6828: size=0, offset=1, AOP_TYPE(res)=8
	CLRF	(_main_cod_7seg_65537_5 + 19)
_00106_DS_:
;	.line	37; "laboratorio_1.c"	send_byte(cod_7seg[rand_wait() & 0x0F]);
	PAGESEL	_rand_wait
	CALL	_rand_wait
	PAGESEL	$
	BANKSEL	r0x1043
	MOVWF	r0x1043
	MOVF	STK00,W
	MOVWF	r0x1044
	MOVLW	0x0f
	ANDWF	r0x1044,F
	CLRF	r0x1043
	MOVF	r0x1044,W
	MOVWF	STK02
	MOVLW	0x00
	MOVWF	STK01
	MOVLW	0x02
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	__mulint
	CALL	__mulint
	PAGESEL	$
	BANKSEL	r0x1043
	MOVWF	r0x1043
	MOVF	STK00,W
	MOVWF	r0x1044
	ADDLW	(_main_cod_7seg_65537_5 + 0)
	MOVWF	r0x1044
	MOVF	r0x1043,W
	BTFSC	STATUS,0
	INCFSZ	r0x1043,W
	ADDLW	high (_main_cod_7seg_65537_5 + 0)
	MOVWF	r0x1043
	MOVF	r0x1044,W
	BANKSEL	FSR
	MOVWF	FSR
	BCF	STATUS,7
	BANKSEL	r0x1043
	BTFSC	r0x1043,0
	BSF	STATUS,7
	BANKSEL	INDF
	MOVF	INDF,W
	BANKSEL	r0x1045
	MOVWF	r0x1045
	BANKSEL	FSR
	INCF	FSR,F
	MOVF	INDF,W
	BANKSEL	r0x1046
	MOVWF	r0x1046
	MOVF	r0x1045,W
	MOVWF	STK00
	MOVF	r0x1046,W
	PAGESEL	_send_byte
	CALL	_send_byte
	PAGESEL	$
;	.line	38; "laboratorio_1.c"	GP1=1;
	BANKSEL	_GPIObits
	BSF	_GPIObits,1
;	.line	39; "laboratorio_1.c"	GP1=0;
	BCF	_GPIObits,1
;	.line	40; "laboratorio_1.c"	GP1=1;
	BSF	_GPIObits,1
;	.line	41; "laboratorio_1.c"	GP1=0;
	BCF	_GPIObits,1
;	.line	42; "laboratorio_1.c"	GP1=1;
	BSF	_GPIObits,1
;	.line	43; "laboratorio_1.c"	GP1=0;
	BCF	_GPIObits,1
;	.line	44; "laboratorio_1.c"	GP1=1;
	BSF	_GPIObits,1
;	.line	45; "laboratorio_1.c"	GP1=0;
	BCF	_GPIObits,1
;	.line	46; "laboratorio_1.c"	GP1=1;
	BSF	_GPIObits,1
;	.line	47; "laboratorio_1.c"	GP1=0;
	BCF	_GPIObits,1
;	.line	48; "laboratorio_1.c"	GP1=1;
	BSF	_GPIObits,1
;	.line	49; "laboratorio_1.c"	GP1=0;
	BCF	_GPIObits,1
;	.line	50; "laboratorio_1.c"	GP1=1;
	BSF	_GPIObits,1
;	.line	51; "laboratorio_1.c"	GP1=0;
	BCF	_GPIObits,1
;	.line	52; "laboratorio_1.c"	GP1=1;
	BSF	_GPIObits,1
;	.line	53; "laboratorio_1.c"	GP1=0;
	BCF	_GPIObits,1
;	.line	54; "laboratorio_1.c"	GP1=1;
	BSF	_GPIObits,1
;	.line	55; "laboratorio_1.c"	GP1=0;
	BCF	_GPIObits,1
;	.line	56; "laboratorio_1.c"	GP1=1;
	BSF	_GPIObits,1
;	.line	57; "laboratorio_1.c"	GP1=0;
	BCF	_GPIObits,1
;	.line	58; "laboratorio_1.c"	GP1=1;
	BSF	_GPIObits,1
;	.line	59; "laboratorio_1.c"	GP1=0;
	BCF	_GPIObits,1
;	.line	60; "laboratorio_1.c"	GP1=1;
	BSF	_GPIObits,1
;	.line	61; "laboratorio_1.c"	GP1=0;
	BCF	_GPIObits,1
;	.line	62; "laboratorio_1.c"	GP1=1;
	BSF	_GPIObits,1
;	.line	63; "laboratorio_1.c"	GP1=0;
	BCF	_GPIObits,1
;	.line	64; "laboratorio_1.c"	GP1=1;
	BSF	_GPIObits,1
;	.line	65; "laboratorio_1.c"	GP1=0;
	BCF	_GPIObits,1
;	.line	66; "laboratorio_1.c"	GP1=1;
	BSF	_GPIObits,1
;	.line	67; "laboratorio_1.c"	GP1=0;
	BCF	_GPIObits,1
;	.line	68; "laboratorio_1.c"	GP1=1;
	BSF	_GPIObits,1
;	.line	69; "laboratorio_1.c"	GP1=0;
	BCF	_GPIObits,1
;	.line	70; "laboratorio_1.c"	GP1=1;
	BSF	_GPIObits,1
;	.line	71; "laboratorio_1.c"	GP1=0;
	BCF	_GPIObits,1
;	.line	72; "laboratorio_1.c"	GP1=1;
	BSF	_GPIObits,1
;	.line	73; "laboratorio_1.c"	GP1=0;
	BCF	_GPIObits,1
;	.line	74; "laboratorio_1.c"	GP1=1;
	BSF	_GPIObits,1
;	.line	75; "laboratorio_1.c"	GP1=0;
	BCF	_GPIObits,1
;	.line	76; "laboratorio_1.c"	GP1=1;
	BSF	_GPIObits,1
;	.line	77; "laboratorio_1.c"	GP1=0;
	BCF	_GPIObits,1
;	.line	78; "laboratorio_1.c"	GP1=1;
	BSF	_GPIObits,1
;	.line	79; "laboratorio_1.c"	GP1=0;
	BCF	_GPIObits,1
;	.line	80; "laboratorio_1.c"	GP1=1;
	BSF	_GPIObits,1
;	.line	81; "laboratorio_1.c"	GP1=0;
	BCF	_GPIObits,1
;	.line	82; "laboratorio_1.c"	GP1=1;
	BSF	_GPIObits,1
;	.line	83; "laboratorio_1.c"	GP1=0;
	BCF	_GPIObits,1
;	.line	84; "laboratorio_1.c"	GP1=1;
	BSF	_GPIObits,1
;	.line	85; "laboratorio_1.c"	GP1=0;
	BCF	_GPIObits,1
;	.line	86; "laboratorio_1.c"	GP1=1;
	BSF	_GPIObits,1
;	.line	87; "laboratorio_1.c"	GP1=0;
	BCF	_GPIObits,1
;	.line	88; "laboratorio_1.c"	GP1=1;
	BSF	_GPIObits,1
;	.line	89; "laboratorio_1.c"	GP1=0;
	BCF	_GPIObits,1
;	.line	90; "laboratorio_1.c"	GP1=1;
	BSF	_GPIObits,1
;	.line	91; "laboratorio_1.c"	GP1=0;
	BCF	_GPIObits,1
;	.line	92; "laboratorio_1.c"	GP1=1;
	BSF	_GPIObits,1
;	.line	93; "laboratorio_1.c"	GP1=0;
	BCF	_GPIObits,1
;	.line	94; "laboratorio_1.c"	GP1=1;
	BSF	_GPIObits,1
;	.line	95; "laboratorio_1.c"	GP1=0;
	BCF	_GPIObits,1
;	.line	96; "laboratorio_1.c"	GP1=1;
	BSF	_GPIObits,1
;	.line	97; "laboratorio_1.c"	GP1=0;
	BCF	_GPIObits,1
;	.line	98; "laboratorio_1.c"	GP1=1;
	BSF	_GPIObits,1
;	.line	99; "laboratorio_1.c"	GP1=0;
	BCF	_GPIObits,1
;	.line	100; "laboratorio_1.c"	GP1=1;
	BSF	_GPIObits,1
;	.line	101; "laboratorio_1.c"	GP1=0;
	BCF	_GPIObits,1
;	.line	102; "laboratorio_1.c"	GP1=1;
	BSF	_GPIObits,1
;	.line	103; "laboratorio_1.c"	GP1=0;
	BCF	_GPIObits,1
;	.line	104; "laboratorio_1.c"	GP1=1;
	BSF	_GPIObits,1
;	.line	105; "laboratorio_1.c"	GP1=0;
	BCF	_GPIObits,1
;	.line	106; "laboratorio_1.c"	GP1=1;
	BSF	_GPIObits,1
;	.line	107; "laboratorio_1.c"	GP1=0;
	BCF	_GPIObits,1
;	.line	108; "laboratorio_1.c"	GP1=1;
	BSF	_GPIObits,1
;	.line	109; "laboratorio_1.c"	GP1=0;
	BCF	_GPIObits,1
;	.line	110; "laboratorio_1.c"	GP1=1;
	BSF	_GPIObits,1
;	.line	111; "laboratorio_1.c"	GP1=0;
	BCF	_GPIObits,1
;	.line	112; "laboratorio_1.c"	GP1=1;
	BSF	_GPIObits,1
;	.line	113; "laboratorio_1.c"	GP1=0;
	BCF	_GPIObits,1
;	.line	114; "laboratorio_1.c"	GP1=1;
	BSF	_GPIObits,1
;	.line	115; "laboratorio_1.c"	GP1=0;
	BCF	_GPIObits,1
;	.line	116; "laboratorio_1.c"	GP1=1;
	BSF	_GPIObits,1
;	.line	117; "laboratorio_1.c"	GP1=0;
	BCF	_GPIObits,1
;	.line	118; "laboratorio_1.c"	GP1=1;
	BSF	_GPIObits,1
;	.line	119; "laboratorio_1.c"	GP1=0;
	BCF	_GPIObits,1
;	.line	120; "laboratorio_1.c"	GP1=1;
	BSF	_GPIObits,1
;	.line	121; "laboratorio_1.c"	GP1=0;
	BCF	_GPIObits,1
	GOTO	_00106_DS_
;	.line	125; "laboratorio_1.c"	}
	RETURN	
; exit point of _main

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;17 compiler assigned registers:
;   r0x1026
;   STK00
;   r0x1027
;   r0x1028
;   r0x1029
;   r0x102A
;   r0x102B
;   r0x102C
;   r0x102D
;   r0x102E
;   r0x102F
;   r0x1030
;   r0x1031
;   r0x1032
;   r0x1033
;   r0x1034
;   r0x1035
;; Starting pCode block
S_laboratorio_1__valido	code
_valido:
; 2 exit points
;	.line	166; "laboratorio_1.c"	unsigned int valido(unsigned int valor) {
	BANKSEL	r0x1026
	MOVWF	r0x1026
	MOVF	STK00,W
	MOVWF	r0x1027
;	.line	167; "laboratorio_1.c"	for (unsigned int c = 0; c < 8; c++) {
	SWAPF	r0x1026,W
	ANDLW	0xf0
	MOVWF	r0x1028
	SWAPF	r0x1027,W
	MOVWF	r0x1029
	ANDLW	0x0f
	IORWF	r0x1028,F
	XORWF	r0x1029,F
	CLRF	r0x102A
	CLRF	r0x102B
	CLRF	r0x102C
	CLRF	r0x102D
;;unsigned compare: left < lit(0x8=8), size=2
_00197_DS_:
	MOVLW	0x00
	BANKSEL	r0x102B
	SUBWF	r0x102B,W
	BTFSS	STATUS,2
	GOTO	_00221_DS_
	MOVLW	0x08
	SUBWF	r0x102A,W
_00221_DS_:
	BTFSC	STATUS,0
	GOTO	_00195_DS_
;;genSkipc:3307: created from rifx:0x7ffde90cf3e0
;	.line	168; "laboratorio_1.c"	if ( ((historial[c] & 0xF0) == 0x00) ) {
	BANKSEL	r0x102C
	MOVF	r0x102C,W
	ADDLW	(_historial + 0)
	MOVWF	r0x102E
	MOVLW	high (_historial + 0)
	MOVWF	r0x102F
	MOVF	r0x102D,W
	BTFSC	STATUS,0
	INCFSZ	r0x102D,W
	ADDWF	r0x102F,F
	MOVF	r0x102E,W
	BANKSEL	FSR
	MOVWF	FSR
	BCF	STATUS,7
	BANKSEL	r0x102F
	BTFSC	r0x102F,0
	BSF	STATUS,7
	BANKSEL	INDF
	MOVF	INDF,W
	BANKSEL	r0x1030
	MOVWF	r0x1030
	BANKSEL	FSR
	INCF	FSR,F
	MOVF	INDF,W
	BANKSEL	r0x1031
	MOVWF	r0x1031
	MOVLW	0xf0
	ANDWF	r0x1030,W
	MOVWF	r0x1032
	CLRF	r0x1033
	MOVF	r0x1032,W
	BTFSS	STATUS,2
	GOTO	_00193_DS_
;	.line	169; "laboratorio_1.c"	historial[c] |= valor<<4;
	MOVF	r0x1029,W
	IORWF	r0x1030,W
	MOVWF	r0x1034
	MOVF	r0x1028,W
	IORWF	r0x1031,W
	MOVWF	r0x1035
	MOVF	r0x102E,W
	BANKSEL	FSR
	MOVWF	FSR
	BCF	STATUS,7
	BANKSEL	r0x102F
	BTFSC	r0x102F,0
	BSF	STATUS,7
	MOVF	r0x1034,W
	BANKSEL	INDF
	MOVWF	INDF
	INCF	FSR,F
	BANKSEL	r0x1035
	MOVF	r0x1035,W
	BANKSEL	INDF
	MOVWF	INDF
;	.line	170; "laboratorio_1.c"	return 1;
	MOVLW	0x01
	MOVWF	STK00
	MOVLW	0x00
	GOTO	_00199_DS_
_00193_DS_:
;	.line	171; "laboratorio_1.c"	} else if ( ((historial[c] & 0x0F) == 0x00) ) {
	MOVLW	0x0f
	BANKSEL	r0x1030
	ANDWF	r0x1030,W
	MOVWF	r0x1034
	CLRF	r0x1035
	MOVF	r0x1034,W
	BTFSS	STATUS,2
	GOTO	_00190_DS_
;	.line	172; "laboratorio_1.c"	historial[c] |= valor;
	MOVF	r0x1027,W
	IORWF	r0x1030,F
	MOVF	r0x1026,W
	IORWF	r0x1031,F
	MOVF	r0x102E,W
	BANKSEL	FSR
	MOVWF	FSR
	BCF	STATUS,7
	BANKSEL	r0x102F
	BTFSC	r0x102F,0
	BSF	STATUS,7
	MOVF	r0x1030,W
	BANKSEL	INDF
	MOVWF	INDF
	INCF	FSR,F
	BANKSEL	r0x1031
	MOVF	r0x1031,W
	BANKSEL	INDF
	MOVWF	INDF
;	.line	173; "laboratorio_1.c"	return 1;
	MOVLW	0x01
	MOVWF	STK00
	MOVLW	0x00
	GOTO	_00199_DS_
_00190_DS_:
;	.line	174; "laboratorio_1.c"	} else if ( ((historial[c] & 0xF0) == valor<<4) || ((historial[c] & 0x0F) == valor) ) {
	BANKSEL	r0x1029
	MOVF	r0x1029,W
	XORWF	r0x1032,W
	BTFSS	STATUS,2
	GOTO	_00222_DS_
	MOVF	r0x1028,W
	XORWF	r0x1033,W
	BTFSC	STATUS,2
	GOTO	_00186_DS_
_00222_DS_:
	BANKSEL	r0x1027
	MOVF	r0x1027,W
	XORWF	r0x1034,W
	BTFSS	STATUS,2
	GOTO	_00194_DS_
	MOVF	r0x1026,W
	XORWF	r0x1035,W
	BTFSS	STATUS,2
	GOTO	_00194_DS_
_00186_DS_:
;	.line	175; "laboratorio_1.c"	return 0;
	MOVLW	0x00
	MOVWF	STK00
	MOVLW	0x00
	GOTO	_00199_DS_
_00194_DS_:
;	.line	167; "laboratorio_1.c"	for (unsigned int c = 0; c < 8; c++) {
	MOVLW	0x02
	BANKSEL	r0x102C
	ADDWF	r0x102C,F
	BTFSC	STATUS,0
	INCF	r0x102D,F
	INCF	r0x102A,F
	BTFSC	STATUS,2
	INCF	r0x102B,F
	GOTO	_00197_DS_
_00195_DS_:
;	.line	178; "laboratorio_1.c"	banderas |= 0x02;
	BANKSEL	_banderas
	BSF	_banderas,1
;	.line	179; "laboratorio_1.c"	return 1;
	MOVLW	0x01
	MOVWF	STK00
	MOVLW	0x00
_00199_DS_:
;	.line	180; "laboratorio_1.c"	}
	RETURN	
; exit point of _valido

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _valido
;   __mulint
;   __mulint
;   __mulint
;   _valido
;   __mulint
;   __mulint
;   __mulint
;11 compiler assigned registers:
;   r0x1036
;   r0x1037
;   r0x1038
;   STK00
;   r0x1039
;   STK02
;   STK01
;   r0x103A
;   r0x103B
;   r0x103C
;   r0x103D
;; Starting pCode block
S_laboratorio_1__rand_wait	code
_rand_wait:
; 2 exit points
;	.line	147; "laboratorio_1.c"	while(1) {
	BANKSEL	r0x1036
	CLRF	r0x1036
	CLRF	r0x1037
_00143_DS_:
;	.line	149; "laboratorio_1.c"	rand += 1;
	BANKSEL	r0x1036
	INCF	r0x1036,F
	BTFSC	STATUS,2
	INCF	r0x1037,F
;	.line	151; "laboratorio_1.c"	if ( ((banderas & 0x01) == 0x00) &&  (GP3==1) && (rand <= 99) && (valido(rand)==1) ) {
	BANKSEL	_banderas
	BTFSC	_banderas,0
	GOTO	_00137_DS_
	BANKSEL	r0x1038
	CLRF	r0x1038
	BANKSEL	_GPIObits
	BTFSS	_GPIObits,3
	GOTO	_00001_DS_
	BANKSEL	r0x1038
	INCF	r0x1038,F
_00001_DS_:
	BANKSEL	r0x1038
	MOVF	r0x1038,W
	XORLW	0x01
	BTFSS	STATUS,2
	GOTO	_00137_DS_
;;swapping arguments (AOP_TYPEs 1/2)
;;unsigned compare: left >= lit(0x64=100), size=2
	MOVLW	0x00
	SUBWF	r0x1037,W
	BTFSS	STATUS,2
	GOTO	_00181_DS_
	MOVLW	0x64
	SUBWF	r0x1036,W
_00181_DS_:
	BTFSC	STATUS,0
	GOTO	_00137_DS_
;;genSkipc:3307: created from rifx:0x7ffde90cf3e0
	BANKSEL	r0x1036
	MOVF	r0x1036,W
	MOVWF	STK00
	MOVF	r0x1037,W
	PAGESEL	_valido
	CALL	_valido
	PAGESEL	$
	BANKSEL	r0x1039
	MOVWF	r0x1039
	MOVF	STK00,W
	MOVWF	r0x1038
	XORLW	0x01
	BTFSS	STATUS,2
	GOTO	_00137_DS_
	MOVF	r0x1039,W
	XORLW	0x00
	BTFSS	STATUS,2
	GOTO	_00137_DS_
;	.line	152; "laboratorio_1.c"	banderas |= 0x01;
	BANKSEL	_banderas
	BSF	_banderas,0
;	.line	153; "laboratorio_1.c"	if ( banderas & 0x02 == 0x02 ) {
	BTFSS	_banderas,0
	GOTO	_00132_DS_
;	.line	154; "laboratorio_1.c"	return 99;
	MOVLW	0x63
	MOVWF	STK00
	MOVLW	0x00
	GOTO	_00145_DS_
_00132_DS_:
;	.line	156; "laboratorio_1.c"	rand = ((rand & 0x01)*1) + ((rand & 0x01)*2) + ((rand & 0x01)*4) + ((rand & 0x01)*8);
	MOVLW	0x01
	BANKSEL	r0x1036
	ANDWF	r0x1036,W
	MOVWF	r0x1038
	CLRF	r0x1039
	MOVF	r0x1038,W
	MOVWF	STK02
	MOVLW	0x00
	MOVWF	STK01
	MOVLW	0x02
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	__mulint
	CALL	__mulint
	PAGESEL	$
	BANKSEL	r0x103A
	MOVWF	r0x103A
	MOVF	STK00,W
	MOVWF	r0x103B
	ADDWF	r0x1038,W
	MOVWF	r0x103B
	MOVF	r0x1039,W
	BTFSC	STATUS,0
	INCFSZ	r0x1039,W
	ADDWF	r0x103A,F
	MOVF	r0x1038,W
	MOVWF	STK02
	MOVF	r0x1039,W
	MOVWF	STK01
	MOVLW	0x04
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	__mulint
	CALL	__mulint
	PAGESEL	$
	BANKSEL	r0x103C
	MOVWF	r0x103C
	MOVF	STK00,W
;;1	MOVWF	r0x103D
	ADDWF	r0x103B,F
	MOVF	r0x103C,W
	BTFSC	STATUS,0
	INCFSZ	r0x103C,W
	ADDWF	r0x103A,F
	MOVF	r0x1038,W
	MOVWF	STK02
	MOVF	r0x1039,W
	MOVWF	STK01
	MOVLW	0x08
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	__mulint
	CALL	__mulint
	PAGESEL	$
	BANKSEL	r0x1039
	MOVWF	r0x1039
	MOVF	STK00,W
	MOVWF	r0x1038
	ADDWF	r0x103B,F
	MOVF	r0x1039,W
	BTFSC	STATUS,0
	INCFSZ	r0x1039,W
	ADDWF	r0x103A,F
;	.line	157; "laboratorio_1.c"	return rand;
	MOVF	r0x103B,W
	MOVWF	STK00
	MOVF	r0x103A,W
	GOTO	_00145_DS_
_00137_DS_:
;	.line	158; "laboratorio_1.c"	} else if ( ((banderas & 0x01)==0x01) &&  (GP3==0) ) {
	MOVLW	0x01
	BANKSEL	_banderas
	ANDWF	_banderas,W
	BANKSEL	r0x1038
	MOVWF	r0x1038
	CLRF	r0x1039
	MOVF	r0x1038,W
	XORLW	0x01
	BTFSS	STATUS,2
	GOTO	_00143_DS_
	MOVF	r0x1039,W
	XORLW	0x00
	BTFSS	STATUS,2
	GOTO	_00143_DS_
	BANKSEL	_GPIObits
	BTFSC	_GPIObits,3
	GOTO	_00143_DS_
;	.line	159; "laboratorio_1.c"	banderas &= 0xFE;
	BANKSEL	_banderas
	BCF	_banderas,0
	CLRF	(_banderas + 1)
	GOTO	_00143_DS_
_00145_DS_:
;	.line	164; "laboratorio_1.c"	}
	RETURN	
; exit point of _rand_wait

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;6 compiler assigned registers:
;   r0x103E
;   STK00
;   r0x103F
;   r0x1040
;   r0x1041
;   r0x1042
;; Starting pCode block
S_laboratorio_1__send_byte	code
_send_byte:
; 2 exit points
;	.line	128; "laboratorio_1.c"	void send_byte(unsigned int cod) {
	BANKSEL	r0x103E
	MOVWF	r0x103E
	MOVF	STK00,W
	MOVWF	r0x103F
;	.line	132; "laboratorio_1.c"	for (unsigned int c = 0 ; c < 8 ; c++) {
	CLRF	r0x1040
	CLRF	r0x1041
;;unsigned compare: left < lit(0x8=8), size=2
_00113_DS_:
	MOVLW	0x00
	BANKSEL	r0x1041
	SUBWF	r0x1041,W
	BTFSS	STATUS,2
	GOTO	_00126_DS_
	MOVLW	0x08
	SUBWF	r0x1040,W
_00126_DS_:
	BTFSC	STATUS,0
	GOTO	_00111_DS_
;;genSkipc:3307: created from rifx:0x7ffde90cf3e0
;	.line	133; "laboratorio_1.c"	bit = cod & 0x01;
	BANKSEL	r0x103F
	MOVF	r0x103F,W
	MOVWF	r0x1042
;	.line	134; "laboratorio_1.c"	GP0=bit;
	RRF	r0x1042,W
	BTFSC	STATUS,0
	GOTO	_00002_DS_
	BANKSEL	_GPIObits
	BCF	_GPIObits,0
_00002_DS_:
	BTFSS	STATUS,0
	GOTO	_00003_DS_
	BANKSEL	_GPIObits
	BSF	_GPIObits,0
_00003_DS_:
;	.line	135; "laboratorio_1.c"	GP1=1;
	BANKSEL	_GPIObits
	BSF	_GPIObits,1
;	.line	136; "laboratorio_1.c"	GP1=0;
	BCF	_GPIObits,1
;;shiftRight_Left2ResultLit:5474: shCount=1, size=2, sign=0, same=1, offr=0
;	.line	137; "laboratorio_1.c"	cod>>=1;
	BCF	STATUS,0
	BANKSEL	r0x103E
	RRF	r0x103E,F
	RRF	r0x103F,F
;	.line	132; "laboratorio_1.c"	for (unsigned int c = 0 ; c < 8 ; c++) {
	INCF	r0x1040,F
	BTFSC	STATUS,2
	INCF	r0x1041,F
	GOTO	_00113_DS_
_00111_DS_:
;	.line	139; "laboratorio_1.c"	GP2=1;
	BANKSEL	_GPIObits
	BSF	_GPIObits,2
;	.line	140; "laboratorio_1.c"	GP2=0;
	BCF	_GPIObits,2
;	.line	141; "laboratorio_1.c"	}
	RETURN	
; exit point of _send_byte


;	code size estimation:
;	  441+   78 =   519 instructions ( 1194 byte)

	end
