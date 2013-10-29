#include <SPI.h>
#include <SD.h>
#include <TFT.h>

#define sd_cs  4
#define lcd_cs 10
#define dc     9
#define rst    8  

TFT TFTscreen = TFT(lcd_cs, dc, rst);
PImage face1;
PImage face2;

void setup() {
  TFTscreen.begin();
  TFTscreen.background(128, 230, 209);
    
  SD.begin(sd_cs);

  face1 = TFTscreen.loadImage("bmo1.bmp");
  face2 = TFTscreen.loadImage("bmo2.bmp");
}

void loop() {

  TFTscreen.image(face1, 0, 0);
  delay(1000);

  TFTscreen.image(face2, 0, 0);  
  delay(1000);
}
