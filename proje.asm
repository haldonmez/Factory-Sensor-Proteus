
_main:

;proje.c,17 :: 		void main(){
;proje.c,18 :: 		ANSEL=0x07;
	MOVLW      7
	MOVWF      ANSEL+0
;proje.c,19 :: 		ANSELH=0;
	CLRF       ANSELH+0
;proje.c,20 :: 		C1ON_bit=0;
	BCF        C1ON_bit+0, BitPos(C1ON_bit+0)
;proje.c,21 :: 		C2ON_bit=0;
	BCF        C2ON_bit+0, BitPos(C2ON_bit+0)
;proje.c,22 :: 		TRISD=0X00;
	CLRF       TRISD+0
;proje.c,23 :: 		PORTD=0X00;
	CLRF       PORTD+0
;proje.c,24 :: 		TRISE=0X00;
	CLRF       TRISE+0
;proje.c,25 :: 		PORTE=0X00;
	CLRF       PORTE+0
;proje.c,26 :: 		ADC_Init();
	CALL       _ADC_Init+0
;proje.c,27 :: 		Lcd_Init();
	CALL       _Lcd_Init+0
;proje.c,28 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;proje.c,29 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;proje.c,30 :: 		Delay_ms(400);
	MOVLW      5
	MOVWF      R11+0
	MOVLW      15
	MOVWF      R12+0
	MOVLW      241
	MOVWF      R13+0
L_main0:
	DECFSZ     R13+0, 1
	GOTO       L_main0
	DECFSZ     R12+0, 1
	GOTO       L_main0
	DECFSZ     R11+0, 1
	GOTO       L_main0
;proje.c,31 :: 		while(1){
L_main1:
;proje.c,32 :: 		adc_gas = ADC_Read(0);
	CLRF       FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0+0, 0
	MOVWF      _adc_gas+0
	MOVF       R0+1, 0
	MOVWF      _adc_gas+1
;proje.c,33 :: 		adc_value = ADC_Read(1);
	MOVLW      1
	MOVWF      FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0+0, 0
	MOVWF      _adc_value+0
	MOVF       R0+1, 0
	MOVWF      _adc_value+1
;proje.c,34 :: 		adc_sound = ADC_Read(2);
	MOVLW      2
	MOVWF      FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0+0, 0
	MOVWF      FLOC__main+0
	MOVF       R0+1, 0
	MOVWF      FLOC__main+1
	MOVF       FLOC__main+0, 0
	MOVWF      _adc_sound+0
	MOVF       FLOC__main+1, 0
	MOVWF      _adc_sound+1
;proje.c,35 :: 		adc_gas = (adc_gas * 100.0 / 1022.0);
	MOVF       _adc_gas+0, 0
	MOVWF      R0+0
	MOVF       _adc_gas+1, 0
	MOVWF      R0+1
	CALL       _word2double+0
	MOVLW      0
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVLW      72
	MOVWF      R4+2
	MOVLW      133
	MOVWF      R4+3
	CALL       _Mul_32x32_FP+0
	MOVLW      0
	MOVWF      R4+0
	MOVLW      128
	MOVWF      R4+1
	MOVLW      127
	MOVWF      R4+2
	MOVLW      136
	MOVWF      R4+3
	CALL       _Div_32x32_FP+0
	CALL       _double2word+0
	MOVF       R0+0, 0
	MOVWF      _adc_gas+0
	MOVF       R0+1, 0
	MOVWF      _adc_gas+1
;proje.c,36 :: 		adc_sound = (adc_sound * 100.0 / 1022.0);
	MOVF       FLOC__main+0, 0
	MOVWF      R0+0
	MOVF       FLOC__main+1, 0
	MOVWF      R0+1
	CALL       _word2double+0
	MOVLW      0
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVLW      72
	MOVWF      R4+2
	MOVLW      133
	MOVWF      R4+3
	CALL       _Mul_32x32_FP+0
	MOVLW      0
	MOVWF      R4+0
	MOVLW      128
	MOVWF      R4+1
	MOVLW      127
	MOVWF      R4+2
	MOVLW      136
	MOVWF      R4+3
	CALL       _Div_32x32_FP+0
	CALL       _double2word+0
	MOVF       R0+0, 0
	MOVWF      _adc_sound+0
	MOVF       R0+1, 0
	MOVWF      _adc_sound+1
;proje.c,37 :: 		temperature = (adc_value * 5.0 / 1023.0);
	MOVF       _adc_value+0, 0
	MOVWF      R0+0
	MOVF       _adc_value+1, 0
	MOVWF      R0+1
	CALL       _word2double+0
	MOVLW      0
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVLW      32
	MOVWF      R4+2
	MOVLW      129
	MOVWF      R4+3
	CALL       _Mul_32x32_FP+0
	MOVLW      0
	MOVWF      R4+0
	MOVLW      192
	MOVWF      R4+1
	MOVLW      127
	MOVWF      R4+2
	MOVLW      136
	MOVWF      R4+3
	CALL       _Div_32x32_FP+0
	MOVF       R0+0, 0
	MOVWF      _temperature+0
	MOVF       R0+1, 0
	MOVWF      _temperature+1
	MOVF       R0+2, 0
	MOVWF      _temperature+2
	MOVF       R0+3, 0
	MOVWF      _temperature+3
;proje.c,38 :: 		temperature = (temperature) * 100.0;
	MOVLW      0
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVLW      72
	MOVWF      R4+2
	MOVLW      133
	MOVWF      R4+3
	CALL       _Mul_32x32_FP+0
	MOVF       R0+0, 0
	MOVWF      _temperature+0
	MOVF       R0+1, 0
	MOVWF      _temperature+1
	MOVF       R0+2, 0
	MOVWF      _temperature+2
	MOVF       R0+3, 0
	MOVWF      _temperature+3
;proje.c,39 :: 		temp_int = (int)temperature;
	CALL       _double2int+0
	CALL       _int2double+0
	MOVF       R0+0, 0
	MOVWF      _temp_int+0
	MOVF       R0+1, 0
	MOVWF      _temp_int+1
	MOVF       R0+2, 0
	MOVWF      _temp_int+2
	MOVF       R0+3, 0
	MOVWF      _temp_int+3
;proje.c,40 :: 		if(temp_int<70 && adc_gas<70 && adc_sound<70){
	MOVLW      0
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVLW      12
	MOVWF      R4+2
	MOVLW      133
	MOVWF      R4+3
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSC      STATUS+0, 0
	MOVLW      0
	MOVWF      R0+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main5
	MOVLW      0
	SUBWF      _adc_gas+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main20
	MOVLW      70
	SUBWF      _adc_gas+0, 0
L__main20:
	BTFSC      STATUS+0, 0
	GOTO       L_main5
	MOVLW      0
	SUBWF      _adc_sound+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main21
	MOVLW      70
	SUBWF      _adc_sound+0, 0
L__main21:
	BTFSC      STATUS+0, 0
	GOTO       L_main5
L__main18:
;proje.c,41 :: 		PORTD=0X00;
	CLRF       PORTD+0
;proje.c,42 :: 		PORTE=0X01;
	MOVLW      1
	MOVWF      PORTE+0
;proje.c,43 :: 		Lcd_Out(1, 1, "Temperature:");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_proje+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;proje.c,44 :: 		Lcd_Out(2, 10, "   C");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      10
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr2_proje+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;proje.c,45 :: 		Lcd_Chr(2, 10, (int)temperature / 100 + 48); // Display hundreds digit
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      10
	MOVWF      FARG_Lcd_Chr_column+0
	MOVF       _temperature+0, 0
	MOVWF      R0+0
	MOVF       _temperature+1, 0
	MOVWF      R0+1
	MOVF       _temperature+2, 0
	MOVWF      R0+2
	MOVF       _temperature+3, 0
	MOVWF      R0+3
	CALL       _double2int+0
	MOVLW      100
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Div_16x16_S+0
	MOVLW      48
	ADDWF      R0+0, 0
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;proje.c,46 :: 		Lcd_Chr(2, 11, ((int)temperature / 10) % 10 + 48); // Display tens digit
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      11
	MOVWF      FARG_Lcd_Chr_column+0
	MOVF       _temperature+0, 0
	MOVWF      R0+0
	MOVF       _temperature+1, 0
	MOVWF      R0+1
	MOVF       _temperature+2, 0
	MOVWF      R0+2
	MOVF       _temperature+3, 0
	MOVWF      R0+3
	CALL       _double2int+0
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Div_16x16_S+0
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Div_16x16_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVLW      48
	ADDWF      R0+0, 0
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;proje.c,47 :: 		Lcd_Chr(2, 12, (int)temperature % 10 + 48); // Display ones digit
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      12
	MOVWF      FARG_Lcd_Chr_column+0
	MOVF       _temperature+0, 0
	MOVWF      R0+0
	MOVF       _temperature+1, 0
	MOVWF      R0+1
	MOVF       _temperature+2, 0
	MOVWF      R0+2
	MOVF       _temperature+3, 0
	MOVWF      R0+3
	CALL       _double2int+0
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Div_16x16_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVLW      48
	ADDWF      R0+0, 0
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;proje.c,48 :: 		Delay_ms(200);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L_main6:
	DECFSZ     R13+0, 1
	GOTO       L_main6
	DECFSZ     R12+0, 1
	GOTO       L_main6
	DECFSZ     R11+0, 1
	GOTO       L_main6
;proje.c,49 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;proje.c,50 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;proje.c,51 :: 		IntToStr(adc_gas, txt);
	MOVF       _adc_gas+0, 0
	MOVWF      FARG_IntToStr_input+0
	MOVF       _adc_gas+1, 0
	MOVWF      FARG_IntToStr_input+1
	MOVLW      _txt+0
	MOVWF      FARG_IntToStr_output+0
	CALL       _IntToStr+0
;proje.c,52 :: 		Lcd_Cmd(_LCD_CLEAR); // Clear LCD display
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;proje.c,53 :: 		Lcd_Out(1, 1, "Gas Sensor:"); // Display label
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr3_proje+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;proje.c,54 :: 		Lcd_Out(2, 1, txt);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _txt+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;proje.c,55 :: 		Lcd_Out(2, 8, "PPM");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      8
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr4_proje+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;proje.c,56 :: 		Delay_ms(200);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L_main7:
	DECFSZ     R13+0, 1
	GOTO       L_main7
	DECFSZ     R12+0, 1
	GOTO       L_main7
	DECFSZ     R11+0, 1
	GOTO       L_main7
;proje.c,57 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;proje.c,58 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;proje.c,59 :: 		IntToStr(adc_sound, txt1);
	MOVF       _adc_sound+0, 0
	MOVWF      FARG_IntToStr_input+0
	MOVF       _adc_sound+1, 0
	MOVWF      FARG_IntToStr_input+1
	MOVLW      _txt1+0
	MOVWF      FARG_IntToStr_output+0
	CALL       _IntToStr+0
;proje.c,60 :: 		Lcd_Cmd(_LCD_CLEAR); // Clear LCD display
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;proje.c,61 :: 		Lcd_Out(1, 1, "Sound Sensor:"); // Display label
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr5_proje+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;proje.c,62 :: 		Lcd_Out(2, 1, txt1);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _txt1+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;proje.c,63 :: 		Lcd_Out(2, 8, "dB");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      8
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr6_proje+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;proje.c,64 :: 		Delay_ms(200);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L_main8:
	DECFSZ     R13+0, 1
	GOTO       L_main8
	DECFSZ     R12+0, 1
	GOTO       L_main8
	DECFSZ     R11+0, 1
	GOTO       L_main8
;proje.c,65 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;proje.c,66 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;proje.c,69 :: 		}
	GOTO       L_main9
L_main5:
;proje.c,70 :: 		else if(temp_int>=70){
	MOVLW      0
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVLW      12
	MOVWF      R4+2
	MOVLW      133
	MOVWF      R4+3
	MOVF       _temp_int+0, 0
	MOVWF      R0+0
	MOVF       _temp_int+1, 0
	MOVWF      R0+1
	MOVF       _temp_int+2, 0
	MOVWF      R0+2
	MOVF       _temp_int+3, 0
	MOVWF      R0+3
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSS      STATUS+0, 0
	MOVLW      0
	MOVWF      R0+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main10
;proje.c,71 :: 		PORTD=0X01;
	MOVLW      1
	MOVWF      PORTD+0
;proje.c,72 :: 		PORTE=0X02;
	MOVLW      2
	MOVWF      PORTE+0
;proje.c,73 :: 		Lcd_Out(1, 1, "Critical Temp!:");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr7_proje+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;proje.c,74 :: 		Lcd_Out(2, 10, "   C");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      10
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr8_proje+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;proje.c,75 :: 		Lcd_Chr(2, 10, (int)temperature / 100 + 48); // Display hundreds digit
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      10
	MOVWF      FARG_Lcd_Chr_column+0
	MOVF       _temperature+0, 0
	MOVWF      R0+0
	MOVF       _temperature+1, 0
	MOVWF      R0+1
	MOVF       _temperature+2, 0
	MOVWF      R0+2
	MOVF       _temperature+3, 0
	MOVWF      R0+3
	CALL       _double2int+0
	MOVLW      100
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Div_16x16_S+0
	MOVLW      48
	ADDWF      R0+0, 0
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;proje.c,76 :: 		Lcd_Chr(2, 11, ((int)temperature / 10) % 10 + 48); // Display tens digit
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      11
	MOVWF      FARG_Lcd_Chr_column+0
	MOVF       _temperature+0, 0
	MOVWF      R0+0
	MOVF       _temperature+1, 0
	MOVWF      R0+1
	MOVF       _temperature+2, 0
	MOVWF      R0+2
	MOVF       _temperature+3, 0
	MOVWF      R0+3
	CALL       _double2int+0
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Div_16x16_S+0
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Div_16x16_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVLW      48
	ADDWF      R0+0, 0
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;proje.c,77 :: 		Lcd_Chr(2, 12, (int)temperature % 10 + 48); // Display ones digit
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      12
	MOVWF      FARG_Lcd_Chr_column+0
	MOVF       _temperature+0, 0
	MOVWF      R0+0
	MOVF       _temperature+1, 0
	MOVWF      R0+1
	MOVF       _temperature+2, 0
	MOVWF      R0+2
	MOVF       _temperature+3, 0
	MOVWF      R0+3
	CALL       _double2int+0
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Div_16x16_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVLW      48
	ADDWF      R0+0, 0
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;proje.c,78 :: 		delay_ms(200);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L_main11:
	DECFSZ     R13+0, 1
	GOTO       L_main11
	DECFSZ     R12+0, 1
	GOTO       L_main11
	DECFSZ     R11+0, 1
	GOTO       L_main11
;proje.c,79 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;proje.c,80 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;proje.c,81 :: 		}
	GOTO       L_main12
L_main10:
;proje.c,82 :: 		else if(adc_sound>=70){
	MOVLW      0
	SUBWF      _adc_sound+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main22
	MOVLW      70
	SUBWF      _adc_sound+0, 0
L__main22:
	BTFSS      STATUS+0, 0
	GOTO       L_main13
;proje.c,83 :: 		PORTD=0X01;
	MOVLW      1
	MOVWF      PORTD+0
;proje.c,84 :: 		PORTE=0X02;
	MOVLW      2
	MOVWF      PORTE+0
;proje.c,85 :: 		IntToStr(adc_sound, txt1);
	MOVF       _adc_sound+0, 0
	MOVWF      FARG_IntToStr_input+0
	MOVF       _adc_sound+1, 0
	MOVWF      FARG_IntToStr_input+1
	MOVLW      _txt1+0
	MOVWF      FARG_IntToStr_output+0
	CALL       _IntToStr+0
;proje.c,86 :: 		Lcd_Out(1, 1, "Critical Sound!"); // Display label
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr9_proje+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;proje.c,87 :: 		Lcd_Out(2, 1, txt1);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _txt1+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;proje.c,88 :: 		Lcd_Out(2, 2, "dB");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      2
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr10_proje+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;proje.c,89 :: 		delay_ms(200);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L_main14:
	DECFSZ     R13+0, 1
	GOTO       L_main14
	DECFSZ     R12+0, 1
	GOTO       L_main14
	DECFSZ     R11+0, 1
	GOTO       L_main14
;proje.c,90 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;proje.c,91 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;proje.c,92 :: 		}
	GOTO       L_main15
L_main13:
;proje.c,93 :: 		else if(adc_gas>=70){
	MOVLW      0
	SUBWF      _adc_gas+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main23
	MOVLW      70
	SUBWF      _adc_gas+0, 0
L__main23:
	BTFSS      STATUS+0, 0
	GOTO       L_main16
;proje.c,94 :: 		PORTD=0X01;
	MOVLW      1
	MOVWF      PORTD+0
;proje.c,95 :: 		PORTE=0X02;
	MOVLW      2
	MOVWF      PORTE+0
;proje.c,96 :: 		IntToStr(adc_gas, txt);
	MOVF       _adc_gas+0, 0
	MOVWF      FARG_IntToStr_input+0
	MOVF       _adc_gas+1, 0
	MOVWF      FARG_IntToStr_input+1
	MOVLW      _txt+0
	MOVWF      FARG_IntToStr_output+0
	CALL       _IntToStr+0
;proje.c,97 :: 		Lcd_Out(1, 1, "Critical Gas:"); // Display label
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr11_proje+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;proje.c,98 :: 		Lcd_Out(2, 1, txt);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _txt+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;proje.c,99 :: 		Lcd_Out(2, 8, "PPM");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      8
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr12_proje+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;proje.c,100 :: 		delay_ms(200);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L_main17:
	DECFSZ     R13+0, 1
	GOTO       L_main17
	DECFSZ     R12+0, 1
	GOTO       L_main17
	DECFSZ     R11+0, 1
	GOTO       L_main17
;proje.c,101 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;proje.c,102 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;proje.c,103 :: 		}
L_main16:
L_main15:
L_main12:
L_main9:
;proje.c,104 :: 		}
	GOTO       L_main1
;proje.c,105 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
