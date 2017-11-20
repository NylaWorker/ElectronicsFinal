This is Nyla Worker's final project for electronics.

Here is the file description for the folders and file:

ClkDivider Test and its copy are just an attempt to trying to fix my clocking issue. 

gitPMODMic3 is code taken from github that I tried using and modifiying. This proved fruitless. 

LEDandClock is the very basic code where all the pins of the LED board are connected to the FPGA and with the exception of OE and the clock all the other inputs are connected to switches of the FPGA board. 


Use3vOutput was just an exploration of how the PMOD pins worked. 


LEDCllkWithDiftimes contains code that controls the LED board with a nice periodical function. As it is set up right now, there is a red undertone moving up and and down vertically. 

LEDMatrixSimple (ledWorkingModule is its predecessor) contains the code that runs the LED board entirely with buttons. 

Ledwithwavefunctionality explores a different way of setting up the colors of the LEDs.

math is a library I tried to use to get sine waves to show in the board. This din't work.

PMODmictrial, spiMoudle and mspi is code that I tried to modigy and run in order to control the LEDs. 


Lastly we have the arduino code from adafruit that runs the microphone and the modification done by me that outputs to the LED matrix board, with if statements. 


