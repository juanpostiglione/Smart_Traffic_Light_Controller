# Traffic_Light_Controller

## Overview: 
This repository contains a VHDL project that simulates a traffic light controller. This kind of traffic light controller, which includes functionality to detect the presence of emergency vehicles and alter the normal operation cycle of traffic signals, can be considered a "smart" traffic system. The incorporation of sensors and logic to prioritize emergency vehicles is an innovative feature that is becoming more common in modern traffic systems.

## Description:
The core of the traffic light controller is a state machine that navigates through a series of states to control the lights according to a set of defined rules. The FSM logic takes into account the following sequence:

1) Normal Operation: The green light on University Avenue stays on for five cycles unless interrupted by an emergency vehicle on 17th Street (EV signal is high), which causes an immediate transition to yellow.
2) Car Waiting: After five green cycles, if a car is waiting (CW signal is high), the light transitions to yellow; otherwise, it cycles back to green.
3) Yellow Phase: The yellow light remains active for two cycles before switching to red.
4) Red Phase: The red light is on for four cycles.
5) Emergency Override: If an emergency vehicle is detected, the red light stays on until the vehicle clears the intersection.
The VHDL design strictly adheres to these operational stages, ensuring that:

- Only one light is active at any time.
- There is always one light on.
- The presence of emergency vehicles is given priority in the state transitions.

## Algorithmic State Machine Chart
This chart describes the behavior above.

![Untitled Diagram drawio-2](https://github.com/juanpostiglione/Traffic_Light_Controller/assets/128395993/fe934bad-983b-4945-97ce-36491a40fb6d)

## Truth State Table
This table describes the ASM Chart above, with all the cases and stages.
<img width="959" alt="Screenshot 2024-03-27 at 6 25 01 PM" src="https://github.com/juanpostiglione/Traffic_Light_Controller/assets/128395993/3ca65e7f-9422-438b-93f3-4e635e59a09a">

## Simulations
Included are simulation files from Intel Quartus Prime that detail the state machine's reaction to a series of input events, showcasing how the controller manages state transitions. The simulation verifies the proper function of the controller under different scenarios, including emergency vehicle interruptions.

<img width="967" alt="Screenshot 2024-03-27 at 6 32 51 PM" src="https://github.com/juanpostiglione/Traffic_Light_Controller/assets/128395993/08c17812-acee-4ff5-a207-d30bd447044d">
<img width="967" alt="Screenshot 2024-03-27 at 6 32 27 PM" src="https://github.com/juanpostiglione/Traffic_Light_Controller/assets/128395993/9724befd-f317-4be0-8ebc-dd9cdb13da35">
<img width="955" alt="Screenshot 2024-03-27 at 6 31 57 PM" src="https://github.com/juanpostiglione/Traffic_Light_Controller/assets/128395993/074729f6-8996-4186-a976-394211df2798">
<img width="952" alt="Screenshot 2024-03-27 at 6 31 25 PM" src="https://github.com/juanpostiglione/Traffic_Light_Controller/assets/128395993/ea4984cb-5f09-485b-8543-39bef84459b2">

## Circuit Design
This design features a smart traffic light control system utilizing VHDL for combinational logic and D flip-flops to handle state transitions. Inputs include signals for emergency vehicles (EV) and waiting cars (CW), which are processed to determine the traffic light's next state. This state is then captured by D flip-flops with each clock pulse and fed back as the current state for continuous operation. The outputs control the Green, Yellow, and Red traffic lights, adapting in real-time to traffic conditions. The design ensures efficient traffic flow and emergency vehicle prioritization, all within a cyclical logic framework.

<img width="1256" alt="Screenshot 2024-03-27 at 11 13 53 PM" src="https://github.com/juanpostiglione/Traffic_Light_Controller/assets/128395993/07129523-2716-4eda-91b0-8b8bebc744ee">

