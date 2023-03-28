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
	global	_historial
	global	_banderas
	global	_blink
	global	_count_2
	global	_count_1
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
r0x103E	res	1
r0x103D	res	1
r0x103F	res	1
r0x1040	res	1
r0x1039	res	1
r0x1038	res	1
r0x103A	res	1
r0x103B	res	1
r0x103C	res	1
r0x1032	res	1
r0x1033	res	1
r0x1034	res	1
r0x1035	res	1
r0x1036	res	1
r0x1037	res	1
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
;--------------------------------------------------------
; initialized data
;--------------------------------------------------------

IDD_laboratorio_1_0	idata
_count_1
	db	0x00, 0x00	; 0


IDD_laboratorio_1_1	idata
_count_2
	db	0x00, 0x00	; 0


IDD_laboratorio_1_2	idata
_blink
	db	0x00, 0x00	; 0


IDD_laboratorio_1_3	idata
_banderas
	db	0x00, 0x00	; 0


IDD_laboratorio_1_4	idata
_historial
	db	0xff, 0x00	; 255
	db	0xff, 0x00	; 255
	db	0xff, 0x00	; 255
	db	0xff, 0x00	; 255
	db	0xff, 0x00	; 255
	db	0xff, 0x00	; 255
	db	0xff, 0x00	; 255
	db	0xff, 0x00	; 255
	db	0xff, 0x00	; 255
	db	0xff, 0x00	; 255
	db	0xff, 0x00	; 255
	db	0xff, 0x00	; 255
	db	0xff, 0x00	; 255
	db	0xff, 0x00	; 255
	db	0xff, 0x00	; 255
	db	0xff, 0x00	; 255

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
;   _send_byte
;   _send_byte
;   _send_byte
;   _send_byte
;   _send_byte
;   _send_byte
;   _send_byte
;   _send_byte
;   _send_byte
;   _send_byte
;   _send_byte
;   _send_byte
;   _send_byte
;   _send_byte
;   _send_byte
;   _send_byte
;   _send_byte
;   _send_byte
;   _send_byte
;   _send_byte
;   _rand_wait
;   _send_byte
;   _send_byte
;   _send_byte
;   _send_byte
;   _send_byte
;   _send_byte
;   _send_byte
;   _send_byte
;   _send_byte
;   _send_byte
;   _send_byte
;   _send_byte
;   _send_byte
;   _send_byte
;   _send_byte
;   _send_byte
;   _send_byte
;   _send_byte
;   _send_byte
;   _send_byte
;5 compiler assigned registers:
;   r0x103D
;   STK00
;   r0x103E
;   r0x103F
;   r0x1040
;; Starting pCode block
S_laboratorio_1__main	code
_main:
; 2 exit points
;	.line	26; "laboratorio_1.c"	TRISIO = 0b00001000; //P0,1,2,3,4 como salidas, P5 como entrada
	MOVLW	0x08
	BANKSEL	_TRISIO
	MOVWF	_TRISIO
;	.line	27; "laboratorio_1.c"	GPIO = 0b00000000; //Pines empiezan en bajo
	BANKSEL	_GPIO
	CLRF	_GPIO
;	.line	29; "laboratorio_1.c"	ADCON0=0x00;                // Internal ADC OFF
	CLRF	_ADCON0
;	.line	30; "laboratorio_1.c"	ANSEL=0x00;
	BANKSEL	_ANSEL
	CLRF	_ANSEL
;	.line	31; "laboratorio_1.c"	CMCON0 = 0x07;
	MOVLW	0x07
	BANKSEL	_CMCON0
	MOVWF	_CMCON0
_00166_DS_:
;	.line	52; "laboratorio_1.c"	tx = rand_wait();
	PAGESEL	_rand_wait
	CALL	_rand_wait
	PAGESEL	$
	BANKSEL	r0x103D
	MOVWF	r0x103D
	MOVF	STK00,W
	MOVWF	r0x103E
;	.line	53; "laboratorio_1.c"	GP4=0;
	BANKSEL	_GPIObits
	BCF	_GPIObits,4
;	.line	54; "laboratorio_1.c"	if ((tx & 0x0F) == 0x00) {
	MOVLW	0x0f
	BANKSEL	r0x103E
	ANDWF	r0x103E,W
	MOVWF	r0x103F
	CLRF	r0x1040
	MOVF	r0x103F,W
	BTFSS	STATUS,2
	GOTO	_00132_DS_
;	.line	55; "laboratorio_1.c"	send_byte(0b11111100);
	MOVLW	0xfc
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	_send_byte
	CALL	_send_byte
	PAGESEL	$
	GOTO	_00133_DS_
_00132_DS_:
;	.line	56; "laboratorio_1.c"	} else if ((tx & 0x0F) == 0x01) {
	BANKSEL	r0x103F
	MOVF	r0x103F,W
	XORLW	0x01
	BTFSS	STATUS,2
	GOTO	_00129_DS_
	MOVF	r0x1040,W
	XORLW	0x00
	BTFSS	STATUS,2
	GOTO	_00129_DS_
;	.line	57; "laboratorio_1.c"	send_byte(0b01100000);
	MOVLW	0x60
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	_send_byte
	CALL	_send_byte
	PAGESEL	$
	GOTO	_00133_DS_
_00129_DS_:
;	.line	58; "laboratorio_1.c"	} else if ((tx & 0x0F) == 0x02) {
	BANKSEL	r0x103F
	MOVF	r0x103F,W
	XORLW	0x02
	BTFSS	STATUS,2
	GOTO	_00126_DS_
	MOVF	r0x1040,W
	XORLW	0x00
	BTFSS	STATUS,2
	GOTO	_00126_DS_
;	.line	59; "laboratorio_1.c"	send_byte(0b11011010);
	MOVLW	0xda
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	_send_byte
	CALL	_send_byte
	PAGESEL	$
	GOTO	_00133_DS_
_00126_DS_:
;	.line	60; "laboratorio_1.c"	} else if ((tx & 0x0F) == 0x03) {
	BANKSEL	r0x103F
	MOVF	r0x103F,W
	XORLW	0x03
	BTFSS	STATUS,2
	GOTO	_00123_DS_
	MOVF	r0x1040,W
	XORLW	0x00
	BTFSS	STATUS,2
	GOTO	_00123_DS_
;	.line	61; "laboratorio_1.c"	send_byte(0b11110010);
	MOVLW	0xf2
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	_send_byte
	CALL	_send_byte
	PAGESEL	$
	GOTO	_00133_DS_
_00123_DS_:
;	.line	62; "laboratorio_1.c"	} else if ((tx & 0x0F) == 0x04) {
	BANKSEL	r0x103F
	MOVF	r0x103F,W
	XORLW	0x04
	BTFSS	STATUS,2
	GOTO	_00120_DS_
	MOVF	r0x1040,W
	XORLW	0x00
	BTFSS	STATUS,2
	GOTO	_00120_DS_
;	.line	63; "laboratorio_1.c"	send_byte(0b01100110);
	MOVLW	0x66
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	_send_byte
	CALL	_send_byte
	PAGESEL	$
	GOTO	_00133_DS_
_00120_DS_:
;	.line	64; "laboratorio_1.c"	} else if ((tx & 0x0F) == 0x05) {
	BANKSEL	r0x103F
	MOVF	r0x103F,W
	XORLW	0x05
	BTFSS	STATUS,2
	GOTO	_00117_DS_
	MOVF	r0x1040,W
	XORLW	0x00
	BTFSS	STATUS,2
	GOTO	_00117_DS_
;	.line	65; "laboratorio_1.c"	send_byte(0b10110110);
	MOVLW	0xb6
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	_send_byte
	CALL	_send_byte
	PAGESEL	$
	GOTO	_00133_DS_
_00117_DS_:
;	.line	66; "laboratorio_1.c"	} else if ((tx & 0x0F) == 0x06) {
	BANKSEL	r0x103F
	MOVF	r0x103F,W
	XORLW	0x06
	BTFSS	STATUS,2
	GOTO	_00114_DS_
	MOVF	r0x1040,W
	XORLW	0x00
	BTFSS	STATUS,2
	GOTO	_00114_DS_
;	.line	67; "laboratorio_1.c"	send_byte(0b10111110);
	MOVLW	0xbe
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	_send_byte
	CALL	_send_byte
	PAGESEL	$
	GOTO	_00133_DS_
_00114_DS_:
;	.line	68; "laboratorio_1.c"	} else if ((tx & 0x0F) == 0x07) {
	BANKSEL	r0x103F
	MOVF	r0x103F,W
	XORLW	0x07
	BTFSS	STATUS,2
	GOTO	_00111_DS_
	MOVF	r0x1040,W
	XORLW	0x00
	BTFSS	STATUS,2
	GOTO	_00111_DS_
;	.line	69; "laboratorio_1.c"	send_byte(0b11100000);
	MOVLW	0xe0
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	_send_byte
	CALL	_send_byte
	PAGESEL	$
	GOTO	_00133_DS_
_00111_DS_:
;	.line	70; "laboratorio_1.c"	} else if ((tx & 0x0F) == 0x08) {
	BANKSEL	r0x103F
	MOVF	r0x103F,W
	XORLW	0x08
	BTFSS	STATUS,2
	GOTO	_00108_DS_
	MOVF	r0x1040,W
	XORLW	0x00
	BTFSS	STATUS,2
	GOTO	_00108_DS_
;	.line	71; "laboratorio_1.c"	send_byte(0b11111110);
	MOVLW	0xfe
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	_send_byte
	CALL	_send_byte
	PAGESEL	$
	GOTO	_00133_DS_
_00108_DS_:
;	.line	72; "laboratorio_1.c"	} else if ((tx & 0x0F) == 0x09) {
	BANKSEL	r0x103F
	MOVF	r0x103F,W
	XORLW	0x09
	BTFSS	STATUS,2
	GOTO	_00133_DS_
	MOVF	r0x1040,W
	XORLW	0x00
	BTFSS	STATUS,2
	GOTO	_00133_DS_
;	.line	73; "laboratorio_1.c"	send_byte(0b11100110);
	MOVLW	0xe6
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	_send_byte
	CALL	_send_byte
	PAGESEL	$
_00133_DS_:
;	.line	76; "laboratorio_1.c"	GP4=1;
	BANKSEL	_GPIObits
	BSF	_GPIObits,4
;	.line	77; "laboratorio_1.c"	if ((tx & 0xF0) == 0x00) {
	MOVLW	0xf0
	BANKSEL	r0x103E
	ANDWF	r0x103E,F
	CLRF	r0x103D
	MOVF	r0x103E,W
	BTFSS	STATUS,2
	GOTO	_00161_DS_
;	.line	78; "laboratorio_1.c"	send_byte(0b11111100);
	MOVLW	0xfc
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	_send_byte
	CALL	_send_byte
	PAGESEL	$
	GOTO	_00162_DS_
_00161_DS_:
;	.line	79; "laboratorio_1.c"	} else if ((tx & 0xF0) == 0x10) {
	BANKSEL	r0x103E
	MOVF	r0x103E,W
	XORLW	0x10
	BTFSS	STATUS,2
	GOTO	_00158_DS_
	MOVF	r0x103D,W
	XORLW	0x00
	BTFSS	STATUS,2
	GOTO	_00158_DS_
;	.line	80; "laboratorio_1.c"	send_byte(0b01100000);
	MOVLW	0x60
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	_send_byte
	CALL	_send_byte
	PAGESEL	$
	GOTO	_00162_DS_
_00158_DS_:
;	.line	81; "laboratorio_1.c"	} else if ((tx & 0xF0) == 0x20) {
	BANKSEL	r0x103E
	MOVF	r0x103E,W
	XORLW	0x20
	BTFSS	STATUS,2
	GOTO	_00155_DS_
	MOVF	r0x103D,W
	XORLW	0x00
	BTFSS	STATUS,2
	GOTO	_00155_DS_
;	.line	82; "laboratorio_1.c"	send_byte(0b11011010);
	MOVLW	0xda
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	_send_byte
	CALL	_send_byte
	PAGESEL	$
	GOTO	_00162_DS_
_00155_DS_:
;	.line	83; "laboratorio_1.c"	} else if ((tx & 0xF0) == 0x30) {
	BANKSEL	r0x103E
	MOVF	r0x103E,W
	XORLW	0x30
	BTFSS	STATUS,2
	GOTO	_00152_DS_
	MOVF	r0x103D,W
	XORLW	0x00
	BTFSS	STATUS,2
	GOTO	_00152_DS_
;	.line	84; "laboratorio_1.c"	send_byte(0b11110010);
	MOVLW	0xf2
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	_send_byte
	CALL	_send_byte
	PAGESEL	$
	GOTO	_00162_DS_
_00152_DS_:
;	.line	85; "laboratorio_1.c"	} else if ((tx & 0xF0) == 0x40) {
	BANKSEL	r0x103E
	MOVF	r0x103E,W
	XORLW	0x40
	BTFSS	STATUS,2
	GOTO	_00149_DS_
	MOVF	r0x103D,W
	XORLW	0x00
	BTFSS	STATUS,2
	GOTO	_00149_DS_
;	.line	86; "laboratorio_1.c"	send_byte(0b01100110);
	MOVLW	0x66
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	_send_byte
	CALL	_send_byte
	PAGESEL	$
	GOTO	_00162_DS_
_00149_DS_:
;	.line	87; "laboratorio_1.c"	} else if ((tx & 0xF0) == 0x50) {
	BANKSEL	r0x103E
	MOVF	r0x103E,W
	XORLW	0x50
	BTFSS	STATUS,2
	GOTO	_00146_DS_
	MOVF	r0x103D,W
	XORLW	0x00
	BTFSS	STATUS,2
	GOTO	_00146_DS_
;	.line	88; "laboratorio_1.c"	send_byte(0b10110110);
	MOVLW	0xb6
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	_send_byte
	CALL	_send_byte
	PAGESEL	$
	GOTO	_00162_DS_
_00146_DS_:
;	.line	89; "laboratorio_1.c"	} else if ((tx & 0xF0) == 0x60) {
	BANKSEL	r0x103E
	MOVF	r0x103E,W
	XORLW	0x60
	BTFSS	STATUS,2
	GOTO	_00143_DS_
	MOVF	r0x103D,W
	XORLW	0x00
	BTFSS	STATUS,2
	GOTO	_00143_DS_
;	.line	90; "laboratorio_1.c"	send_byte(0b10111110);
	MOVLW	0xbe
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	_send_byte
	CALL	_send_byte
	PAGESEL	$
	GOTO	_00162_DS_
_00143_DS_:
;	.line	91; "laboratorio_1.c"	} else if ((tx & 0xF0) == 0x70) {
	BANKSEL	r0x103E
	MOVF	r0x103E,W
	XORLW	0x70
	BTFSS	STATUS,2
	GOTO	_00140_DS_
	MOVF	r0x103D,W
	XORLW	0x00
	BTFSS	STATUS,2
	GOTO	_00140_DS_
;	.line	92; "laboratorio_1.c"	send_byte(0b11100000);
	MOVLW	0xe0
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	_send_byte
	CALL	_send_byte
	PAGESEL	$
	GOTO	_00162_DS_
_00140_DS_:
;	.line	93; "laboratorio_1.c"	} else if ((tx & 0xF0) == 0x80) {
	BANKSEL	r0x103E
	MOVF	r0x103E,W
	XORLW	0x80
	BTFSS	STATUS,2
	GOTO	_00137_DS_
	MOVF	r0x103D,W
	XORLW	0x00
	BTFSS	STATUS,2
	GOTO	_00137_DS_
;	.line	94; "laboratorio_1.c"	send_byte(0b11111110);
	MOVLW	0xfe
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	_send_byte
	CALL	_send_byte
	PAGESEL	$
	GOTO	_00162_DS_
_00137_DS_:
;	.line	95; "laboratorio_1.c"	} else if ((tx & 0xF0) == 0x90) {
	BANKSEL	r0x103E
	MOVF	r0x103E,W
	XORLW	0x90
	BTFSS	STATUS,2
	GOTO	_00162_DS_
	MOVF	r0x103D,W
	XORLW	0x00
	BTFSS	STATUS,2
	GOTO	_00162_DS_
;	.line	96; "laboratorio_1.c"	send_byte(0b11100110);
	MOVLW	0xe6
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	_send_byte
	CALL	_send_byte
	PAGESEL	$
_00162_DS_:
;	.line	99; "laboratorio_1.c"	if ( (banderas & 0x02) == 0x02 ) {
	MOVLW	0x02
	BANKSEL	_banderas
	ANDWF	_banderas,W
	BANKSEL	r0x103E
	MOVWF	r0x103E
	CLRF	r0x103D
	MOVF	r0x103E,W
	XORLW	0x02
	BTFSS	STATUS,2
	GOTO	_00166_DS_
	MOVF	r0x103D,W
	XORLW	0x00
	BTFSS	STATUS,2
	GOTO	_00166_DS_
;	.line	100; "laboratorio_1.c"	banderas &= 0x11111101;
	MOVLW	0x01
	BANKSEL	_banderas
	ANDWF	_banderas,F
	MOVLW	0x11
	ANDWF	(_banderas + 1),F
;;/home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6828: size=1, offset=0, AOP_TYPE(res)=8
;	.line	101; "laboratorio_1.c"	historial[0] = 0xFF;
	MOVLW	0xff
	BANKSEL	_historial
	MOVWF	(_historial + 0)
;;/home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6828: size=0, offset=1, AOP_TYPE(res)=8
	CLRF	(_historial + 1)
;;/home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6828: size=1, offset=0, AOP_TYPE(res)=8
;	.line	102; "laboratorio_1.c"	historial[1] = 0xFF;
	MOVLW	0xff
	MOVWF	(_historial + 2)
;;/home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6828: size=0, offset=1, AOP_TYPE(res)=8
	CLRF	(_historial + 3)
;;/home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6828: size=1, offset=0, AOP_TYPE(res)=8
;	.line	103; "laboratorio_1.c"	historial[2] = 0xFF;
	MOVLW	0xff
	MOVWF	(_historial + 4)
;;/home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6828: size=0, offset=1, AOP_TYPE(res)=8
	CLRF	(_historial + 5)
;;/home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6828: size=1, offset=0, AOP_TYPE(res)=8
;	.line	104; "laboratorio_1.c"	historial[3] = 0xFF;
	MOVLW	0xff
	MOVWF	(_historial + 6)
;;/home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6828: size=0, offset=1, AOP_TYPE(res)=8
	CLRF	(_historial + 7)
;;/home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6828: size=1, offset=0, AOP_TYPE(res)=8
;	.line	105; "laboratorio_1.c"	historial[4] = 0xFF;
	MOVLW	0xff
	MOVWF	(_historial + 8)
;;/home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6828: size=0, offset=1, AOP_TYPE(res)=8
	CLRF	(_historial + 9)
;;/home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6828: size=1, offset=0, AOP_TYPE(res)=8
;	.line	106; "laboratorio_1.c"	historial[5] = 0xFF;
	MOVLW	0xff
	MOVWF	(_historial + 10)
;;/home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6828: size=0, offset=1, AOP_TYPE(res)=8
	CLRF	(_historial + 11)
;;/home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6828: size=1, offset=0, AOP_TYPE(res)=8
;	.line	107; "laboratorio_1.c"	historial[6] = 0xFF;
	MOVLW	0xff
	MOVWF	(_historial + 12)
;;/home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6828: size=0, offset=1, AOP_TYPE(res)=8
	CLRF	(_historial + 13)
;;/home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6828: size=1, offset=0, AOP_TYPE(res)=8
;	.line	108; "laboratorio_1.c"	historial[7] = 0xFF;
	MOVLW	0xff
	MOVWF	(_historial + 14)
;;/home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6828: size=0, offset=1, AOP_TYPE(res)=8
	CLRF	(_historial + 15)
;;/home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6828: size=1, offset=0, AOP_TYPE(res)=8
;	.line	109; "laboratorio_1.c"	historial[8] = 0xFF;
	MOVLW	0xff
	MOVWF	(_historial + 16)
;;/home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6828: size=0, offset=1, AOP_TYPE(res)=8
	CLRF	(_historial + 17)
;;/home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6828: size=1, offset=0, AOP_TYPE(res)=8
;	.line	110; "laboratorio_1.c"	historial[9] = 0xFF;
	MOVLW	0xff
	MOVWF	(_historial + 18)
;;/home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6828: size=0, offset=1, AOP_TYPE(res)=8
	CLRF	(_historial + 19)
;;/home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6828: size=1, offset=0, AOP_TYPE(res)=8
;	.line	111; "laboratorio_1.c"	historial[10] = 0xFF;
	MOVLW	0xff
	MOVWF	(_historial + 20)
;;/home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6828: size=0, offset=1, AOP_TYPE(res)=8
	CLRF	(_historial + 21)
;;/home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6828: size=1, offset=0, AOP_TYPE(res)=8
;	.line	112; "laboratorio_1.c"	historial[11] = 0xFF;
	MOVLW	0xff
	MOVWF	(_historial + 22)
;;/home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6828: size=0, offset=1, AOP_TYPE(res)=8
	CLRF	(_historial + 23)
;;/home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6828: size=1, offset=0, AOP_TYPE(res)=8
;	.line	113; "laboratorio_1.c"	historial[12] = 0xFF;
	MOVLW	0xff
	MOVWF	(_historial + 24)
;;/home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6828: size=0, offset=1, AOP_TYPE(res)=8
	CLRF	(_historial + 25)
;;/home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6828: size=1, offset=0, AOP_TYPE(res)=8
;	.line	114; "laboratorio_1.c"	historial[13] = 0xFF;
	MOVLW	0xff
	MOVWF	(_historial + 26)
;;/home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6828: size=0, offset=1, AOP_TYPE(res)=8
	CLRF	(_historial + 27)
;;/home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6828: size=1, offset=0, AOP_TYPE(res)=8
;	.line	115; "laboratorio_1.c"	historial[14] = 0xFF;
	MOVLW	0xff
	MOVWF	(_historial + 28)
;;/home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6828: size=0, offset=1, AOP_TYPE(res)=8
	CLRF	(_historial + 29)
;;/home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6828: size=1, offset=0, AOP_TYPE(res)=8
;	.line	116; "laboratorio_1.c"	historial[14] = 0xFF;
	MOVLW	0xff
	MOVWF	(_historial + 28)
;;/home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6828: size=0, offset=1, AOP_TYPE(res)=8
	CLRF	(_historial + 29)
	GOTO	_00166_DS_
;	.line	122; "laboratorio_1.c"	}
	RETURN	
; exit point of _main

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;11 compiler assigned registers:
;   r0x1028
;   STK00
;   r0x1029
;   r0x102A
;   r0x102B
;   r0x102C
;   r0x102D
;   r0x102E
;   r0x102F
;   r0x1030
;   r0x1031
;; Starting pCode block
S_laboratorio_1__valido	code
_valido:
; 2 exit points
;	.line	181; "laboratorio_1.c"	unsigned int valido(unsigned int valor) {
	BANKSEL	r0x1028
	MOVWF	r0x1028
	MOVF	STK00,W
	MOVWF	r0x1029
;	.line	182; "laboratorio_1.c"	for (unsigned int c = 0; c < 16; c++) {
	CLRF	r0x102A
	CLRF	r0x102B
	CLRF	r0x102C
	CLRF	r0x102D
;;unsigned compare: left < lit(0x10=16), size=2
_00279_DS_:
	MOVLW	0x00
	BANKSEL	r0x102B
	SUBWF	r0x102B,W
	BTFSS	STATUS,2
	GOTO	_00299_DS_
	MOVLW	0x10
	SUBWF	r0x102A,W
_00299_DS_:
	BTFSC	STATUS,0
	GOTO	_00277_DS_
;;genSkipc:3307: created from rifx:0x7ffff174bc40
;	.line	183; "laboratorio_1.c"	if ( (historial[c] == 0xFF) ) {
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
	MOVF	r0x1030,W
	XORLW	0xff
	BTFSS	STATUS,2
	GOTO	_00275_DS_
	MOVF	r0x1031,W
	XORLW	0x00
	BTFSS	STATUS,2
	GOTO	_00275_DS_
;	.line	184; "laboratorio_1.c"	historial[c] = valor;
	MOVF	r0x102E,W
	BANKSEL	FSR
	MOVWF	FSR
	BCF	STATUS,7
	BANKSEL	r0x102F
	BTFSC	r0x102F,0
	BSF	STATUS,7
	MOVF	r0x1029,W
	BANKSEL	INDF
	MOVWF	INDF
	INCF	FSR,F
	BANKSEL	r0x1028
	MOVF	r0x1028,W
	BANKSEL	INDF
	MOVWF	INDF
;	.line	185; "laboratorio_1.c"	return 1;
	MOVLW	0x01
	MOVWF	STK00
	MOVLW	0x00
	GOTO	_00281_DS_
_00275_DS_:
;	.line	186; "laboratorio_1.c"	} else if ( historial[c] == valor ) {
	BANKSEL	r0x1029
	MOVF	r0x1029,W
	XORWF	r0x1030,W
	BTFSS	STATUS,2
	GOTO	_00280_DS_
	MOVF	r0x1028,W
	XORWF	r0x1031,W
	BTFSS	STATUS,2
	GOTO	_00280_DS_
;	.line	187; "laboratorio_1.c"	return 0;
	MOVLW	0x00
	MOVWF	STK00
	MOVLW	0x00
	GOTO	_00281_DS_
_00280_DS_:
;	.line	182; "laboratorio_1.c"	for (unsigned int c = 0; c < 16; c++) {
	MOVLW	0x02
	BANKSEL	r0x102C
	ADDWF	r0x102C,F
	BTFSC	STATUS,0
	INCF	r0x102D,F
	INCF	r0x102A,F
	BTFSC	STATUS,2
	INCF	r0x102B,F
	GOTO	_00279_DS_
_00277_DS_:
;	.line	190; "laboratorio_1.c"	banderas |= 0x02;
	BANKSEL	_banderas
	BSF	_banderas,1
;	.line	191; "laboratorio_1.c"	return 1;
	MOVLW	0x01
	MOVWF	STK00
	MOVLW	0x00
_00281_DS_:
;	.line	192; "laboratorio_1.c"	}
	RETURN	
; exit point of _valido

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _valido
;   _valido
;7 compiler assigned registers:
;   r0x1032
;   r0x1033
;   r0x1034
;   r0x1035
;   r0x1036
;   r0x1037
;   STK00
;; Starting pCode block
S_laboratorio_1__rand_wait	code
_rand_wait:
; 2 exit points
;	.line	139; "laboratorio_1.c"	unsigned int rand = 0x00;
	BANKSEL	r0x1032
	CLRF	r0x1032
	CLRF	r0x1033
_00214_DS_:
;	.line	143; "laboratorio_1.c"	if ( (rand & 0x0F) < 0x09) {
	MOVLW	0x0f
	BANKSEL	r0x1032
	ANDWF	r0x1032,W
	MOVWF	r0x1034
	CLRF	r0x1035
;;unsigned compare: left < lit(0x9=9), size=2
	MOVLW	0x00
	SUBWF	r0x1035,W
	BTFSS	STATUS,2
	GOTO	_00266_DS_
	MOVLW	0x09
	SUBWF	r0x1034,W
_00266_DS_:
	BTFSC	STATUS,0
	GOTO	_00195_DS_
;;genSkipc:3307: created from rifx:0x7ffff174bc40
;	.line	144; "laboratorio_1.c"	rand+=0x01;
	BANKSEL	r0x1032
	INCF	r0x1032,F
	BTFSC	STATUS,2
	INCF	r0x1033,F
	GOTO	_00196_DS_
_00195_DS_:
;	.line	145; "laboratorio_1.c"	} else if ((rand & 0xF0)>>4 < 9) {
	MOVLW	0xf0
	BANKSEL	r0x1032
	ANDWF	r0x1032,W
	MOVWF	r0x1034
	CLRF	r0x1035
	SWAPF	r0x1034,W
	ANDLW	0x0f
	MOVWF	r0x1036
	SWAPF	r0x1035,W
	MOVWF	r0x1037
	ANDLW	0xf0
	IORWF	r0x1036,F
	XORWF	r0x1037,F
;;unsigned compare: left < lit(0x9=9), size=2
	MOVLW	0x00
	SUBWF	r0x1037,W
	BTFSS	STATUS,2
	GOTO	_00267_DS_
	MOVLW	0x09
	SUBWF	r0x1036,W
_00267_DS_:
	BTFSC	STATUS,0
	GOTO	_00192_DS_
;;genSkipc:3307: created from rifx:0x7ffff174bc40
;	.line	146; "laboratorio_1.c"	rand = (rand+0x10) & 0xF0;
	MOVLW	0x10
	BANKSEL	r0x1032
	ADDWF	r0x1032,W
	MOVWF	r0x1034
	CLRF	r0x1035
	RLF	r0x1035,F
	MOVF	r0x1033,W
	ADDWF	r0x1035,F
	MOVLW	0xf0
	ANDWF	r0x1034,W
	MOVWF	r0x1032
	CLRF	r0x1033
	GOTO	_00196_DS_
_00192_DS_:
;	.line	148; "laboratorio_1.c"	rand = 0x00;
	BANKSEL	r0x1032
	CLRF	r0x1032
	CLRF	r0x1033
_00196_DS_:
;	.line	151; "laboratorio_1.c"	if ( ((banderas & 0x01) == 0x00) &&  (GP3==1) && (valido(rand)==1) ) {
	BANKSEL	_banderas
	BTFSC	_banderas,0
	GOTO	_00203_DS_
	BANKSEL	r0x1034
	CLRF	r0x1034
	BANKSEL	_GPIObits
	BTFSS	_GPIObits,3
	GOTO	_00001_DS_
	BANKSEL	r0x1034
	INCF	r0x1034,F
_00001_DS_:
	BANKSEL	r0x1034
	MOVF	r0x1034,W
	XORLW	0x01
	BTFSS	STATUS,2
	GOTO	_00203_DS_
	MOVF	r0x1032,W
	MOVWF	STK00
	MOVF	r0x1033,W
	PAGESEL	_valido
	CALL	_valido
	PAGESEL	$
	BANKSEL	r0x1035
	MOVWF	r0x1035
	MOVF	STK00,W
	MOVWF	r0x1034
	XORLW	0x01
	BTFSS	STATUS,2
	GOTO	_00203_DS_
	MOVF	r0x1035,W
	XORLW	0x00
	BTFSS	STATUS,2
	GOTO	_00203_DS_
;	.line	152; "laboratorio_1.c"	banderas |= 0x01;
	BANKSEL	_banderas
	BSF	_banderas,0
;	.line	153; "laboratorio_1.c"	if ( (banderas & 0x02) == 0x02 ) {
	MOVLW	0x02
	ANDWF	_banderas,W
	BANKSEL	r0x1034
	MOVWF	r0x1034
	CLRF	r0x1035
	MOVF	r0x1034,W
	XORLW	0x02
	BTFSS	STATUS,2
	GOTO	_00198_DS_
	MOVF	r0x1035,W
	XORLW	0x00
	BTFSS	STATUS,2
	GOTO	_00198_DS_
;	.line	154; "laboratorio_1.c"	GP5=0;
	BANKSEL	_GPIObits
	BCF	_GPIObits,5
;	.line	155; "laboratorio_1.c"	blink=1;
	MOVLW	0x01
	BANKSEL	_blink
	MOVWF	_blink
	CLRF	(_blink + 1)
;	.line	156; "laboratorio_1.c"	return 0x11;
	MOVLW	0x11
	MOVWF	STK00
	MOVLW	0x00
	GOTO	_00216_DS_
_00198_DS_:
;	.line	158; "laboratorio_1.c"	GP5=0;
	BANKSEL	_GPIObits
	BCF	_GPIObits,5
;	.line	159; "laboratorio_1.c"	blink=0;
	BANKSEL	_blink
	CLRF	_blink
	CLRF	(_blink + 1)
;	.line	160; "laboratorio_1.c"	return rand;
	BANKSEL	r0x1032
	MOVF	r0x1032,W
	MOVWF	STK00
	MOVF	r0x1033,W
	GOTO	_00216_DS_
_00203_DS_:
;	.line	161; "laboratorio_1.c"	} else if ( ((banderas & 0x01)==0x01) &&  (GP3==0) ) {
	MOVLW	0x01
	BANKSEL	_banderas
	ANDWF	_banderas,W
	BANKSEL	r0x1034
	MOVWF	r0x1034
	CLRF	r0x1035
	MOVF	r0x1034,W
	XORLW	0x01
	BTFSS	STATUS,2
	GOTO	_00204_DS_
	MOVF	r0x1035,W
	XORLW	0x00
	BTFSS	STATUS,2
	GOTO	_00204_DS_
	BANKSEL	_GPIObits
	BTFSC	_GPIObits,3
	GOTO	_00204_DS_
;	.line	162; "laboratorio_1.c"	banderas &= 0b11111110;
	BANKSEL	_banderas
	BCF	_banderas,0
	CLRF	(_banderas + 1)
_00204_DS_:
;	.line	165; "laboratorio_1.c"	count_1+=1;
	BANKSEL	_count_1
	INCF	_count_1,F
	BTFSC	STATUS,2
	INCF	(_count_1 + 1),F
;	.line	166; "laboratorio_1.c"	if (count_1==0) {
	MOVF	(_count_1 + 1),W
	IORWF	_count_1,W
	BTFSS	STATUS,2
	GOTO	_00208_DS_
;	.line	167; "laboratorio_1.c"	count_2+=1;
	BANKSEL	_count_2
	INCF	_count_2,F
	BTFSC	STATUS,2
	INCF	(_count_2 + 1),F
_00208_DS_:
;	.line	169; "laboratorio_1.c"	if (count_2 == time) {
	BANKSEL	_count_2
	MOVF	_count_2,W
	XORLW	0x01
	BTFSS	STATUS,2
	GOTO	_00214_DS_
	MOVF	(_count_2 + 1),W
	XORLW	0x00
	BTFSS	STATUS,2
	GOTO	_00214_DS_
;	.line	170; "laboratorio_1.c"	count_2=0;
	CLRF	_count_2
	CLRF	(_count_2 + 1)
;	.line	172; "laboratorio_1.c"	if ( blink == 1 ) {
	BANKSEL	_blink
	MOVF	_blink,W
	XORLW	0x01
	BTFSS	STATUS,2
	GOTO	_00214_DS_
	MOVF	(_blink + 1),W
	XORLW	0x00
	BTFSS	STATUS,2
	GOTO	_00214_DS_
;	.line	173; "laboratorio_1.c"	GP5=~GP5;
	BANKSEL	r0x1034
	CLRF	r0x1034
	BANKSEL	_GPIObits
	BTFSS	_GPIObits,5
	GOTO	_00002_DS_
	BANKSEL	r0x1034
	INCF	r0x1034,F
_00002_DS_:
	BANKSEL	r0x1034
	COMF	r0x1034,W
	MOVWF	r0x1034
	RRF	r0x1034,W
	BTFSC	STATUS,0
	GOTO	_00003_DS_
	BANKSEL	_GPIObits
	BCF	_GPIObits,5
_00003_DS_:
	BTFSS	STATUS,0
	GOTO	_00004_DS_
	BANKSEL	_GPIObits
	BSF	_GPIObits,5
_00004_DS_:
	GOTO	_00214_DS_
_00216_DS_:
;	.line	179; "laboratorio_1.c"	}
	RETURN	
; exit point of _rand_wait

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;6 compiler assigned registers:
;   r0x1038
;   STK00
;   r0x1039
;   r0x103A
;   r0x103B
;   r0x103C
;; Starting pCode block
S_laboratorio_1__send_byte	code
_send_byte:
; 2 exit points
;	.line	125; "laboratorio_1.c"	void send_byte(unsigned int cod) {
	BANKSEL	r0x1038
	MOVWF	r0x1038
	MOVF	STK00,W
	MOVWF	r0x1039
;	.line	127; "laboratorio_1.c"	for (unsigned int c = 0 ; c < 8 ; c++) {
	CLRF	r0x103A
	CLRF	r0x103B
;;unsigned compare: left < lit(0x8=8), size=2
_00173_DS_:
	MOVLW	0x00
	BANKSEL	r0x103B
	SUBWF	r0x103B,W
	BTFSS	STATUS,2
	GOTO	_00186_DS_
	MOVLW	0x08
	SUBWF	r0x103A,W
_00186_DS_:
	BTFSC	STATUS,0
	GOTO	_00171_DS_
;;genSkipc:3307: created from rifx:0x7ffff174bc40
;	.line	128; "laboratorio_1.c"	GP0=cod & 0x01;
	BANKSEL	r0x1039
	MOVF	r0x1039,W
	MOVWF	r0x103C
	RRF	r0x103C,W
	BTFSC	STATUS,0
	GOTO	_00005_DS_
	BANKSEL	_GPIObits
	BCF	_GPIObits,0
_00005_DS_:
	BTFSS	STATUS,0
	GOTO	_00006_DS_
	BANKSEL	_GPIObits
	BSF	_GPIObits,0
_00006_DS_:
;	.line	129; "laboratorio_1.c"	GP1=1;
	BANKSEL	_GPIObits
	BSF	_GPIObits,1
;	.line	130; "laboratorio_1.c"	GP1=0;
	BCF	_GPIObits,1
;;shiftRight_Left2ResultLit:5474: shCount=1, size=2, sign=0, same=1, offr=0
;	.line	131; "laboratorio_1.c"	cod>>=1;
	BCF	STATUS,0
	BANKSEL	r0x1038
	RRF	r0x1038,F
	RRF	r0x1039,F
;	.line	127; "laboratorio_1.c"	for (unsigned int c = 0 ; c < 8 ; c++) {
	INCF	r0x103A,F
	BTFSC	STATUS,2
	INCF	r0x103B,F
	GOTO	_00173_DS_
_00171_DS_:
;	.line	133; "laboratorio_1.c"	GP2=1;
	BANKSEL	_GPIObits
	BSF	_GPIObits,2
;	.line	134; "laboratorio_1.c"	GP2=0;
	BCF	_GPIObits,2
;	.line	135; "laboratorio_1.c"	}
	RETURN	
; exit point of _send_byte


;	code size estimation:
;	  612+  133 =   745 instructions ( 1756 byte)

	end
