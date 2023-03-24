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
	global	_banderas
	global	_send_byte
	global	_wait

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
r0x1020	res	1
r0x101F	res	1
r0x101B	res	1
r0x101A	res	1
r0x101C	res	1
r0x101D	res	1
r0x101E	res	1
r0x1016	res	1
r0x1017	res	1
r0x1018	res	1
r0x1019	res	1
_main_cod_7seg_65537_4	res	20
;--------------------------------------------------------
; initialized data
;--------------------------------------------------------

IDD_laboratorio_1_0	idata
_banderas
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
;   _wait
;   _send_byte
;   _wait
;   _send_byte
;3 compiler assigned registers:
;   r0x101F
;   STK00
;   r0x1020
;; Starting pCode block
S_laboratorio_1__main	code
_main:
; 2 exit points
;	.line	14; "laboratorio_1.c"	TRISIO = 0b00101000; //P0,1,2,4 como salidas, P3,5 como entrada
	MOVLW	0x28
	BANKSEL	_TRISIO
	MOVWF	_TRISIO
;	.line	15; "laboratorio_1.c"	GPIO = 0b00000000; //Pines empiezan en bajo
	BANKSEL	_GPIO
	CLRF	_GPIO
;	.line	17; "laboratorio_1.c"	ADCON0=0x00;                // Internal ADC OFF
	CLRF	_ADCON0
;	.line	18; "laboratorio_1.c"	ANSEL=0x00;
	BANKSEL	_ANSEL
	CLRF	_ANSEL
;	.line	19; "laboratorio_1.c"	CMCON0 = 0x07;
	MOVLW	0x07
	BANKSEL	_CMCON0
	MOVWF	_CMCON0
;;/home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6828: size=1, offset=0, AOP_TYPE(res)=8
;	.line	21; "laboratorio_1.c"	unsigned int cod_7seg[10]={0b11111100,\	//0
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
_00106_DS_:
;	.line	102; "laboratorio_1.c"	send_byte(wait() & 0x07);
	PAGESEL	_wait
	CALL	_wait
	PAGESEL	$
	BANKSEL	r0x101F
	MOVWF	r0x101F
	MOVF	STK00,W
	MOVWF	r0x1020
	MOVLW	0x07
	ANDWF	r0x1020,F
	CLRF	r0x101F
	MOVF	r0x1020,W
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	_send_byte
	CALL	_send_byte
	PAGESEL	$
	GOTO	_00106_DS_
;	.line	107; "laboratorio_1.c"	}
	RETURN	
; exit point of _main

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;5 compiler assigned registers:
;   r0x1016
;   r0x1017
;   r0x1018
;   r0x1019
;   STK00
;; Starting pCode block
S_laboratorio_1__wait	code
_wait:
; 2 exit points
;	.line	128; "laboratorio_1.c"	while(1) {
	BANKSEL	r0x1016
	CLRF	r0x1016
	CLRF	r0x1017
_00139_DS_:
;	.line	129; "laboratorio_1.c"	if ( (banderas==0x00) &&  (GP3==1) ) {
	BANKSEL	_banderas
	MOVF	(_banderas + 1),W
	IORWF	_banderas,W
	BTFSS	STATUS,2
	GOTO	_00135_DS_
	BANKSEL	r0x1018
	CLRF	r0x1018
	BANKSEL	_GPIObits
	BTFSS	_GPIObits,3
	GOTO	_00001_DS_
	BANKSEL	r0x1018
	INCF	r0x1018,F
_00001_DS_:
	BANKSEL	r0x1018
	MOVF	r0x1018,W
	XORLW	0x01
	BTFSS	STATUS,2
	GOTO	_00135_DS_
;	.line	130; "laboratorio_1.c"	banderas = 0x01;
	MOVLW	0x01
	BANKSEL	_banderas
	MOVWF	_banderas
	CLRF	(_banderas + 1)
;	.line	131; "laboratorio_1.c"	GP4=GP3;
	BANKSEL	r0x1018
	CLRF	r0x1018
	BANKSEL	_GPIObits
	BTFSS	_GPIObits,3
	GOTO	_00002_DS_
	BANKSEL	r0x1018
	INCF	r0x1018,F
_00002_DS_:
	BANKSEL	r0x1018
	MOVF	r0x1018,W
	MOVWF	r0x1019
	RRF	r0x1019,W
	BTFSC	STATUS,0
	GOTO	_00003_DS_
	BANKSEL	_GPIObits
	BCF	_GPIObits,4
_00003_DS_:
	BTFSS	STATUS,0
	GOTO	_00004_DS_
	BANKSEL	_GPIObits
	BSF	_GPIObits,4
_00004_DS_:
;	.line	132; "laboratorio_1.c"	return rand;
	BANKSEL	r0x1016
	MOVF	r0x1016,W
	MOVWF	STK00
	MOVF	r0x1017,W
	GOTO	_00141_DS_
_00135_DS_:
;	.line	133; "laboratorio_1.c"	} else if ( (banderas==0x01) &&  (GP3==0) ) {
	BANKSEL	_banderas
	MOVF	_banderas,W
	XORLW	0x01
	BTFSS	STATUS,2
	GOTO	_00007_DS_
	MOVF	(_banderas + 1),W
	XORLW	0x00
	BTFSS	STATUS,2
	GOTO	_00007_DS_
	BANKSEL	_GPIObits
	BTFSC	_GPIObits,3
	GOTO	_00007_DS_
;	.line	134; "laboratorio_1.c"	banderas = 0x00;
	BANKSEL	_banderas
	CLRF	_banderas
	CLRF	(_banderas + 1)
;	.line	135; "laboratorio_1.c"	GP4=GP3;
	BANKSEL	r0x1018
	CLRF	r0x1018
	BANKSEL	_GPIObits
	BTFSS	_GPIObits,3
	GOTO	_00005_DS_
	BANKSEL	r0x1018
	INCF	r0x1018,F
_00005_DS_:
	BANKSEL	r0x1018
	MOVF	r0x1018,W
	MOVWF	r0x1019
	RRF	r0x1019,W
	BTFSC	STATUS,0
	GOTO	_00006_DS_
	BANKSEL	_GPIObits
	BCF	_GPIObits,4
_00006_DS_:
	BTFSS	STATUS,0
	GOTO	_00007_DS_
	BANKSEL	_GPIObits
	BSF	_GPIObits,4
_00007_DS_:
;	.line	137; "laboratorio_1.c"	rand+=1;
	BANKSEL	r0x1016
	INCF	r0x1016,F
	BTFSC	STATUS,2
	INCF	r0x1017,F
	GOTO	_00139_DS_
_00141_DS_:
;	.line	141; "laboratorio_1.c"	}
	RETURN	
; exit point of _wait

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;6 compiler assigned registers:
;   r0x101A
;   STK00
;   r0x101B
;   r0x101C
;   r0x101D
;   r0x101E
;; Starting pCode block
S_laboratorio_1__send_byte	code
_send_byte:
; 2 exit points
;	.line	110; "laboratorio_1.c"	void send_byte(unsigned int cod) {
	BANKSEL	r0x101A
	MOVWF	r0x101A
	MOVF	STK00,W
	MOVWF	r0x101B
;	.line	114; "laboratorio_1.c"	for (unsigned int c = 0 ; c < 8 ; c++) {
	CLRF	r0x101C
	CLRF	r0x101D
;;unsigned compare: left < lit(0x8=8), size=2
_00113_DS_:
	MOVLW	0x00
	BANKSEL	r0x101D
	SUBWF	r0x101D,W
	BTFSS	STATUS,2
	GOTO	_00126_DS_
	MOVLW	0x08
	SUBWF	r0x101C,W
_00126_DS_:
	BTFSC	STATUS,0
	GOTO	_00111_DS_
;;genSkipc:3307: created from rifx:0x7ffd9a71bd50
;	.line	115; "laboratorio_1.c"	bit = cod & 0x01;
	BANKSEL	r0x101B
	MOVF	r0x101B,W
	MOVWF	r0x101E
;	.line	116; "laboratorio_1.c"	GP0=bit;
	RRF	r0x101E,W
	BTFSC	STATUS,0
	GOTO	_00008_DS_
	BANKSEL	_GPIObits
	BCF	_GPIObits,0
_00008_DS_:
	BTFSS	STATUS,0
	GOTO	_00009_DS_
	BANKSEL	_GPIObits
	BSF	_GPIObits,0
_00009_DS_:
;	.line	117; "laboratorio_1.c"	GP1=1;
	BANKSEL	_GPIObits
	BSF	_GPIObits,1
;	.line	118; "laboratorio_1.c"	GP1=0;
	BCF	_GPIObits,1
;;shiftRight_Left2ResultLit:5474: shCount=1, size=2, sign=0, same=1, offr=0
;	.line	119; "laboratorio_1.c"	cod>>=1;
	BCF	STATUS,0
	BANKSEL	r0x101A
	RRF	r0x101A,F
	RRF	r0x101B,F
;	.line	114; "laboratorio_1.c"	for (unsigned int c = 0 ; c < 8 ; c++) {
	INCF	r0x101C,F
	BTFSC	STATUS,2
	INCF	r0x101D,F
	GOTO	_00113_DS_
_00111_DS_:
;	.line	121; "laboratorio_1.c"	GP2=1;
	BANKSEL	_GPIObits
	BSF	_GPIObits,2
;	.line	122; "laboratorio_1.c"	GP2=0;
	BCF	_GPIObits,2
;	.line	123; "laboratorio_1.c"	}
	RETURN	
; exit point of _send_byte


;	code size estimation:
;	  148+   42 =   190 instructions (  464 byte)

	end
