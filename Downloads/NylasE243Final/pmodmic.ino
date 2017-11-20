/************************************************************************
*
* Test of the Pmod 
*
*************************************************************************
* Description: Pmod_MIC3
* The sound captured by the module is displayed in the serial plotter.
* Code from the adafruit website, modified by Nyla Worker
* 
* Material
* 1. Arduino Uno
* 2. Pmod MIC3
*
* Same shematic as Pmod AD1 setup
************************************************************************/

#define CS 10 // Assignment of the CS pin

#include <SPI.h> // call library

int i;
byte recu[3]; // storage of data of the module
int X;
long somme = 0;

void setup()
{
 Serial.begin(9600); // initialization of serial communication
 SPI.begin(); // initialization of SPI port
 SPI.setDataMode(SPI_MODE0); // configuration of SPI communication in mode 0
 SPI.setClockDivider(SPI_CLOCK_DIV16); // configuration of clock at 1MHz
 pinMode(CS, OUTPUT);
 pinMode(2,OUTPUT);
 pinMode(3,OUTPUT);
 pinMode(4,OUTPUT);
 pinMode(5,OUTPUT);
 pinMode(6,OUTPUT);
 pinMode(7,OUTPUT);
 pinMode(8,OUTPUT);
}

void loop()
{
 digitalWrite(CS, LOW); // activation of CS line
 delayMicroseconds(10);
 for (i=0;i<2;i=i+1)
    {
    recu[i] = SPI.transfer(0); // send 2 data to retrieve the value of the two-byte conversion
    delayMicroseconds(20);
    }
 digitalWrite(CS, HIGH); // deactivation of CS line
 X = recu[1]; // X is on 12 bit format
 X |= (recu[0] << 8);
 
for(int i=0; i<32; i++) // Development of the sound curve
 {
   somme = somme + X;
 }
 
 somme >>= 5;
 Serial.println(somme); // Display in serial plotter
 delay(20);
 // The values here are chosen arbitrarily. 
 // It is better to test the microphone each time before running it
 // The best way of doing so is using the serial plotter to see where the values are.  
 if(somme > 500){
    digitalWrite(2, HIGH);
    Serial.println("This is somme here"); 
    Serial.println(somme);
    Serial.println("It Reached this spot");
    digitalWrite(3, HIGH);
    Serial.println("This is somme here"); 
    Serial.println(somme);
    Serial.println("It Reached this spot");
    }
  else if (somme <490){
    digitalWrite(2, LOW); 
    digitalWrite(3, LOW); 
  }
  if(somme >600 ){
    digitalWrite(4, HIGH);
    Serial.println("This is somme here"); 
    Serial.println(somme);
    Serial.println("It Reached this spot");
    digitalWrite(5, HIGH);
    Serial.println("This is somme here"); 
    Serial.println(somme);
    Serial.println("It Reached this spot");
    }
  else if (somme <590){
    digitalWrite(4, LOW); 
    digitalWrite(5, LOW);
  }
  if(somme > 700){
    digitalWrite(6, HIGH);
    Serial.println("This is somme here"); 
    Serial.println(somme);
    Serial.println("It Reached this spot");
    digitalWrite(7, HIGH);
    Serial.println("This is somme here"); 
    Serial.println(somme);
    Serial.println("It Reached this spot");
    }
  else if (somme <690){
    digitalWrite(6, LOW); 
    digitalWrite(7, LOW); 
  }
 
 
}
