# Color Sensing LED Strip

This repository conatins the documentation and relevant files for the Color Sensing LED Strip controller. 

<img src="/images/controller.jpg" alt="drawing" width="500"/>


## Overview
The Color Sensing LED Strip controller enables the user to set the color of an LED strip by choosing to scan a light source of a desired color to replicate (such as from a phone), select the desired RGB values, or choose from a preset selection of colors, including the last color scanned. Please review the video below or [click here]( https://youtu.be/J2j3cKCgywg) for a demo of the controller in action.


[![Color Sensing LED Strip Demo](http://img.youtube.com/vi/J2j3cKCgywg/0.jpg)](http://www.youtube.com/watch?v=J2j3cKCgywg "Color Sensing LED Strip Demo")

The user interface displays text and menus OLED ".96 display, with selections made through the use of a rotary encoder. The color spectrometer Adafruit AS7341 is used to scan the desired color. Adafruit DotStars are used for the LEDs.

## User Interface 

The Color Sensing LED Strip experiments with various methods of user input with only a rotary encoder and a button as input. The original concept for the user interface can be viewed and interacted with in `User Experience.pptx`. The actual implemented UI is a simplified version of the original concept. The PCB layout was also designed with the user experience in mind, as will be explained in the relevant section.



## Hardware

The relevant Kicad files and bill of materials can be found in the `hardware/` folder of this repository.

### Schematic 

The folowing schematic each of the components used in the controller and how they connect. The Arduino Nano communicates with the color spectrometer and LCD screen via I2C. 


<img src="/images/Schematic_v1.1.png" alt="drawing" width="600"/>

 
### PCB Layout

The PCB layout was planned out for user convenience. The power supply is connected on the left, with the LEDs connected on the right for ease of setup wherever the LEDs are intented to be placed. The LCD screen and rotary encoder are placed towards the bottom of the board for easy access by the user, while the color spectrometer is placed high on the board such that the LCD screen is still visible while the scan is taking place.

 ![](/images/PCB_v1.0.png)
 

## Software 

Source code can be found in the `src/` folder of this repository. 


