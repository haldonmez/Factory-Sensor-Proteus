#line 1 "C:/Users/halil/Desktop/Proje_Start/proje.c"
sbit LCD_RS at RB2_bit;
sbit LCD_EN at RB5_bit;
sbit LCD_D4 at RD4_bit;
sbit LCD_D5 at RD5_bit;
sbit LCD_D6 at RD6_bit;
sbit LCD_D7 at RD7_bit;
sbit LCD_RS_Direction at TRISB2_bit;
sbit LCD_EN_Direction at TRISB5_bit;
sbit LCD_D4_Direction at TRISD4_bit;
sbit LCD_D5_Direction at TRISD5_bit;
sbit LCD_D6_Direction at TRISD6_bit;
sbit LCD_D7_Direction at TRISD7_bit;
char i;
unsigned int adc_value, adc_gas, adc_sound;
float temperature, temp_int;
char txt[6], txt1[6];
void main(){
ANSEL=0x07;
ANSELH=0;
C1ON_bit=0;
C2ON_bit=0;
TRISD=0X00;
PORTD=0X00;
TRISE=0X00;
PORTE=0X00;
ADC_Init();
Lcd_Init();
Lcd_Cmd(_LCD_CLEAR);
Lcd_Cmd(_LCD_CURSOR_OFF);
Delay_ms(400);
while(1){
 adc_gas = ADC_Read(0);
 adc_value = ADC_Read(1);
 adc_sound = ADC_Read(2);
 adc_gas = (adc_gas * 100.0 / 1022.0);
 adc_sound = (adc_sound * 100.0 / 1022.0);
 temperature = (adc_value * 5.0 / 1023.0);
 temperature = (temperature) * 100.0;
 temp_int = (int)temperature;
 if(temp_int<70 && adc_gas<70 && adc_sound<70){
 PORTD=0X00;
 PORTE=0X01;
 Lcd_Out(1, 1, "Temperature:");
 Lcd_Out(2, 10, "   C");
 Lcd_Chr(2, 10, (int)temperature / 100 + 48);
 Lcd_Chr(2, 11, ((int)temperature / 10) % 10 + 48);
 Lcd_Chr(2, 12, (int)temperature % 10 + 48);
 Delay_ms(200);
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Cmd(_LCD_CURSOR_OFF);
 IntToStr(adc_gas, txt);
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Out(1, 1, "Gas Sensor:");
 Lcd_Out(2, 1, txt);
 Lcd_Out(2, 8, "PPM");
 Delay_ms(200);
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Cmd(_LCD_CURSOR_OFF);
 IntToStr(adc_sound, txt1);
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Out(1, 1, "Sound Sensor:");
 Lcd_Out(2, 1, txt1);
 Lcd_Out(2, 8, "dB");
 Delay_ms(200);
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Cmd(_LCD_CURSOR_OFF);


 }
 else if(temp_int>=70){
 PORTD=0X01;
 PORTE=0X02;
 Lcd_Out(1, 1, "Critical Temp!:");
 Lcd_Out(2, 10, "   C");
 Lcd_Chr(2, 10, (int)temperature / 100 + 48);
 Lcd_Chr(2, 11, ((int)temperature / 10) % 10 + 48);
 Lcd_Chr(2, 12, (int)temperature % 10 + 48);
 delay_ms(200);
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Cmd(_LCD_CURSOR_OFF);
 }
 else if(adc_sound>=70){
 PORTD=0X01;
 PORTE=0X02;
 IntToStr(adc_sound, txt1);
 Lcd_Out(1, 1, "Critical Sound!");
 Lcd_Out(2, 1, txt1);
 Lcd_Out(2, 2, "dB");
 delay_ms(200);
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Cmd(_LCD_CURSOR_OFF);
 }
 else if(adc_gas>=70){
 PORTD=0X01;
 PORTE=0X02;
 IntToStr(adc_gas, txt);
 Lcd_Out(1, 1, "Critical Gas:");
 Lcd_Out(2, 1, txt);
 Lcd_Out(2, 8, "PPM");
 delay_ms(200);
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Cmd(_LCD_CURSOR_OFF);
 }
}
}
