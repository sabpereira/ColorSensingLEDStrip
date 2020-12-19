
/////////////////////////////////////////
//
//       Color Sensing LED Strip 
//
//       Sabrina Pereira 2020
//
/////////////////////////////////////////

#include <SPI.h>
#include <Wire.h>
#include <EEPROM.h>
#include <Adafruit_GFX.h>
#include <Adafruit_SSD1306.h>

#define SCREEN_WIDTH 128 // OLED display width, in pixels
#define SCREEN_HEIGHT 64 // OLED display height, in pixels

// Declaration for an SSD1306 display connected to I2C (SDA, SCL pins)
#define OLED_RESET     -1 // Reset pin # (or -1 if sharing Arduino reset pin)
Adafruit_SSD1306 display(SCREEN_WIDTH, SCREEN_HEIGHT, &Wire, OLED_RESET);

#include <SimpleRotary.h>
// Pin A, Pin B, Button Pin
SimpleRotary rotary(16,15,14);

#include <Adafruit_DotStar.h>
#define NUMPIXELS 20 // Number of LEDs in strip
#define DATAPIN    5
#define CLOCKPIN   4
Adafruit_DotStar strip(NUMPIXELS, DATAPIN, CLOCKPIN, DOTSTAR_BGR);

#include <Adafruit_AS7341.h>
Adafruit_AS7341 as7341;
uint16_t readings[12];


// LED Color components
volatile uint8_t red_component = 0;  
volatile uint8_t green_component = 0;  
volatile uint8_t blue_component = 0;  
uint32_t color = strip.Color(red_component, green_component, blue_component);

// Menu States 
enum State_enum {MAIN, PRESETS, RED_SELECT, GREEN_SELECT, BLUE_SELECT};
uint8_t state = MAIN;
uint8_t prev_state = MAIN;

// Cursor Position for menus
int8_t pos = 0;

// Saved Strings for menus
const char *mainMenuStrings[] = {"Presets", "Color Scan", "RGB Select"};
const char *presetStrings[] = {"Magenta", "Yellow", "Last Color Scan"};

// Variables for rotary encoder readings
uint8_t i; // Turned
uint8_t j; // Pushed



/////////////////////////////////////////
//
//       Setup
//
/////////////////////////////////////////

void setup() {  
  Serial.begin(115200);

  // Wait for communication with the host computer serial monitor
  while (!Serial) {
    delay(1);
  }
  
  if (!as7341.begin()){
    Serial.println("Could not find AS7341");
    while (1) { delay(10); }
  }

  as7341.setATIME(100);
  as7341.setASTEP(999);
  as7341.setGain(AS7341_GAIN_256X);
  as7341.startReading();

  // SSD1306_SWITCHCAPVCC = generate display voltage from 3.3V internally
  if(!display.begin(SSD1306_SWITCHCAPVCC, 0x3C)) { // Address 0x3D for 128x64
    Serial.println(F("SSD1306 failed"));
    for(;;); // Don't proceed, loop forever
  }

  // Set the trigger to be either a HIGH or LOW pin (Default: HIGH)
  // Note this sets all three pins to use the same state.
  rotary.setTrigger(HIGH);

  // Set the debounce delay in ms  (Default: 2)
  rotary.setDebounceDelay(5);

  // Set the error correction delay in ms  (Default: 200)
  rotary.setErrorDelay(50);

  display.display();
  delay(2000); // Pause for 2 seconds

  // Clear the buffer
  display.clearDisplay();
  display.setTextSize(1);      // Normal 1:1 pixel scale
  display.setTextColor(SSD1306_WHITE); // Draw white text
  display.setCursor(1, 0);     // Start at top-left corner
  display.cp437(true);         // Use full 256 char 'Code Page 437' font
  update_main_menu_view(0);

  strip.begin();
  strip.setBrightness(50);
  strip.show(); // Initialize all pixels to 'off'

}


/////////////////////////////////////////
//
//       Main Loop / State Machine
//
/////////////////////////////////////////


void loop() {

  i = rotary.rotate();
  j = rotary.push();
  
  // If CW
  if ( i == 1 ) {
    pos++;
  }

  // If CCW
  if ( i == 2) {
    pos--;
  }

  // If State changes, update correct screen
  if (state != prev_state) {
    pos = 0;

    if (state == MAIN) {
      update_main_menu_view(pos);
    }

    if (state == PRESETS) {
      update_presets_view(pos);
    }

    if (state == RED_SELECT) {
      update_red_select_view(pos);
    }    
    if (state == GREEN_SELECT) {
      update_green_select_view(pos);
    }  
    if (state == BLUE_SELECT) {
      update_blue_select_view(pos);
    }
    prev_state = state;
  }

  // Call State Machine to decide next State
  state_machine_UI(); 
  delay(10);
}



void state_machine_UI(){
// Call the Corresponding State Selecting Functions

switch (state) {     
    case (MAIN):
    {      
      state = main_menu_selection();
      break;
    }
    
    case (PRESETS):
    {      
      state = presets_selection();      
      break;
    }
    
    case (RED_SELECT):
    {      
      state = red_select_selection();      
      break;
    }
    case (GREEN_SELECT): 
    {
      state = green_select_selection();      
      break;
    }
    case (BLUE_SELECT):  
    {
      state = blue_select_selection();      
      break;
    }
  }  
}


/////////////////////////////////////////
//
//       State Selecting Functions
//
/////////////////////////////////////////


uint8_t main_menu_selection() { 

  uint8_t main_menu_len = 2;
  if (pos > main_menu_len) {
  pos = 0;
  }
  else if (pos <= -1) {
  pos = main_menu_len;
  }

  if ( i == 1 || i == 2 || state != prev_state) {
    update_main_menu_view(pos);
//    Serial.println(pos);
  }

  if ( j == 1 ) {
    switch (pos) {
      case (0)://magenta
        return PRESETS;
        break;
      case (1)://Color scan
        Color_scan();
        return MAIN;
        break;
      case (2)://Manual Input
        return RED_SELECT;
        break;
    }
  }  
  return MAIN;
}


uint8_t presets_selection() { 

  uint8_t menu_len = 2;
  if (pos > menu_len) {
  pos = 0;
  }
  else if (pos <= -1) {
  pos = menu_len;
  }

  if ( i == 1 || i == 2 || state != prev_state) {
    update_presets_view(pos);
//    Serial.println(pos);
  }

  if ( j == 1 ) {
    delay(200);
    switch (pos) {
      case (0)://magenta
        Magenta();
        return MAIN;
        break;
      case (1)://yellow
        Yellow();
        return MAIN;
        break;
      case (2)://Color scan
        GetColor();
        return MAIN;
        break;
    }
  }  
  return PRESETS ;
}

uint8_t red_select_selection() {
      if ( i == 1 || i == 2 || state != prev_state) {
        if ( i == 1 ) {
          red_component++;
        }
          
        // If CCW
        if ( i == 2) {
          red_component--;
        }
        
        update_red_select_view(pos);
        Serial.println(pos);
      }

      if ( j == 1) {
        return GREEN_SELECT;
        Serial.println(state);
      } 

      return RED_SELECT;

}

uint8_t green_select_selection() {
      if ( i == 1 || i == 2 || state != prev_state) {
        if ( i == 1 ) {
          green_component++;
        }
          
        // If CCW
        if ( i == 2) {
          green_component--;
        }
        
        update_green_select_view(pos);
        Serial.println(pos);
      }

      if ( j == 1) {
        return BLUE_SELECT;
      } 

      return GREEN_SELECT;

}


uint8_t blue_select_selection() {
      if ( i == 1 || i == 2 || state != prev_state) {
        if ( i == 1 ) {
          blue_component++;
        }
          
        // If CCW
        if ( i == 2) {
          blue_component--;
        }
        
        update_blue_select_view(pos);
        Serial.println(pos);
      }

      if ( j == 1) {
        color = strip.Color(red_component, green_component, blue_component);
        strip.fill(color);
        strip.show();  
        
        return MAIN;
      } 

      return BLUE_SELECT;

}


/////////////////////////////////////////
//
//       View Updating Functions
//
/////////////////////////////////////////

   
void update_main_menu_view(long pos) {  
  Serial.println("update mm");
  display.clearDisplay();

  display.setCursor(2, 2);
  display.println("Main Menu");
  
  for (int i = 0; i < 3; i++) {
    display.setCursor(2, (22 + 8*i));
    display.println(mainMenuStrings[i]);
  }
  
  display.fillRect(0, pos * 8 + 21, 128, 9, SSD1306_INVERSE);
  display.display();
}

void update_presets_view(long pos) {  
//  Serial.println("update mm");
  display.clearDisplay();

  display.setCursor(2, 2);
  display.println("Presets");
  
  for (int i = 0; i < 3; i++) {
    display.setCursor(2, (22 + 8*i));
    display.println(presetStrings[i]);
  }
  
  display.fillRect(0, pos * 8 + 21, 128, 9, SSD1306_INVERSE);
  display.display();
}


void update_red_select_view(long pos) {  
  Serial.println("R");
  display.clearDisplay();
  display.setCursor(2, 2);
  display.println("R Select");
  display.setCursor(SCREEN_WIDTH/2 -1, SCREEN_HEIGHT/2-5);
  display.println(red_component);
  display.setCursor(2, SCREEN_HEIGHT-12);
  display.println("->");
  display.fillRect(0, SCREEN_HEIGHT-12 - 1, 128, 9, SSD1306_INVERSE);
  display.display();
}

void update_green_select_view(long pos) {  
  Serial.println("G");
  display.clearDisplay();
  display.setCursor(2, 2);
  display.println("G Select");
  display.setCursor(SCREEN_WIDTH/2 -1, SCREEN_HEIGHT/2-5);
  display.println(green_component);
  display.setCursor(2, SCREEN_HEIGHT-12);
  display.println("->");
  display.fillRect(0, SCREEN_HEIGHT-12 - 1, 128, 9, SSD1306_INVERSE);
  display.display();
}

void update_blue_select_view(long pos) {  
  Serial.println("B");
  display.clearDisplay();
  display.setCursor(2, 2);
  display.println("B Select");
  display.setCursor(SCREEN_WIDTH/2 -1, SCREEN_HEIGHT/2-5);
  display.println(blue_component);
  display.setCursor(2, SCREEN_HEIGHT-12);
  display.println("->");
  display.fillRect(0, SCREEN_HEIGHT-12 - 1, 128, 9, SSD1306_INVERSE);
  display.display();
}


/////////////////////////////////////////
//
//       LED Color Changing Functions
//
/////////////////////////////////////////

void Magenta() {
  red_component = 255;
  green_component = 0;
  blue_component = 255;
    
  color = strip.Color(red_component, green_component, blue_component);
  strip.fill(color);
  strip.show();    
}

void Yellow() {
  red_component = 255;
  green_component = 255;
  blue_component = 0;
    
  color = strip.Color(red_component, green_component, blue_component);
  strip.fill(color);
  strip.show();   
}

void GetColor() {
  red_component = EEPROM.read(0);
  green_component = EEPROM.read(1);
  blue_component = EEPROM.read(2);

  color = strip.Color(red_component, green_component, blue_component);
  strip.fill(color);
  strip.show(); 
}



void Color_scan(){

  if (!as7341.readAllChannels()){
    Serial.println("Error AS7341 Reading");
    return;
  }

  as7341.setLEDCurrent(10); // 4mA
  as7341.enableLED(true);
  delay(500);
  
  as7341.getAllChannels(readings);  
  delay(500);


  as7341.enableLED(false);

    red_component = 3*map(readings[9],0,65535, 0, 255);
    green_component = map(readings[3],0,65535, 0, 255);
    blue_component = map(readings[1],0,65535, 0, 255);

    Serial.println(red_component);   
    EEPROM.write(0, red_component); 
    Serial.println(green_component);
    EEPROM.write(1, green_component); 
    Serial.println(blue_component);
    EEPROM.write(2, blue_component); 


    
    color = strip.Color(red_component, green_component, blue_component);
    strip.fill(color);
    strip.show();   
  
}
