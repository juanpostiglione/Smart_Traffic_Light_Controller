# Traffic_Light_Controller

## Overview: 
This repository contains a VHDL project that simulates a traffic light controller. Designed with educational purposes in mind, it models a traffic light system at an intersection, accounting for both regular traffic flow and emergency vehicle precedence.

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

