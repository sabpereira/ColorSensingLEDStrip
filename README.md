# Color Sensing LED Strip

This repository conatins the documentation and relevant files for the Color Sensing LED Strip controller. 

## Project Overview
The Color Sensing LED Strip controller enables the user to set the color of a DotStar LEDs strip by choosing to scan a light source of a desired color to replicate (such as from a phone), select the desired RGB values, or choose from a preset selection of colors, including the last color scanned. Please review the video below or [click here]( https://youtu.be/J2j3cKCgywg) for a demo of the controller in action.


[![Color Sensing LED Strip Demo](http://img.youtube.com/vi/J2j3cKCgywg/0.jpg)](http://www.youtube.com/watch?v=J2j3cKCgywg "Color Sensing LED Strip Demo")

The user interface displays text and menus OLED ".96 display, with selections made through the use of a rotary encoder. 

## Hardware

The relevant Kicad files and bill of materials can be found in the `\hardware` folder of this repository.

### Schematic 

The folowing schematic each of the components used in the controller and how they connect. The Arduino Nano is connected to the color spectrometer and LCD screen via I2C. 

 ![](/images/Schematic_v1.1.png)
 
 
### PCB Layout

The PCB layout was planned out for user convenience. The power supply is connected on the left, with the LEDs connected on the right for ease of setup wherever the LEDs are intented to be placed. The LCD screen and rotary encoder are placed towards the bottom of the board for easy access by the user, while the color spectrometer is placed high on the board such that the LCD screen is still visible while the scan is taking place.

 ![](/images/PCB_v1.0.png)
 

  
  


<!---

The display is divided into two sections. The top section is the DisplaySpace. Here is where menus, message boxes, configuration screens, and the application's main displays are shown.

Displayed on the screen's bottom line is the ButtonBar. Mounted just below the LCD are two push buttons. The function of these buttons change, so the ButtonBar is used to label what the push buttons do. Typically the left button will be labeled Select and the right one Back.

Two more buttons are used, one to go Up and the other to go Down. These are mounted to the right side of the LCD.

## 


•	A title, summary and detailed description of your project.
•	Visuals: Schematics, PCB layout screenshot, Photos, Possibly a video.
•	C source code.
•	Parts list with costs and suppliers.
•	Github repository with all code and KiCad files.


 -->
