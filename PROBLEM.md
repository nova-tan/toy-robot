Toy Robot Simulator
===================

Description
-----------

- The application is a simulation of a toy robot moving on a square tabletop,
  of dimensions 5 units x 5 units.
- There are no other obstructions on the table surface.
- The robot is free to roam around the surface of the table, but must be
  prevented from falling to destruction. Any movement that would result in the
  robot falling from the table must be prevented, however further valid
  movement commands must still be allowed.

Create an application that can read in commands of the following form:

    PLACE X,Y,F
    MOVE
    LEFT
    RIGHT
    REPORT

- PLACE will put the toy robot on the table in position X,Y and facing NORTH,
  SOUTH, EAST or WEST.
- The origin (0,0) can be considered to be the SOUTH WEST most corner.
- The first valid command to the robot is a PLACE command, after that, any
  sequence of commands may be issued, in any order, including another PLACE
  command. The application should discard all commands in the sequence until
  a valid PLACE command has been executed.
- MOVE will move the toy robot one unit forward in the direction it is
  currently facing.
- LEFT and RIGHT will rotate the robot 90 degrees in the specified direction
  without changing the position of the robot.
- REPORT will announce the X,Y and F of the robot. This can be in any form,
  but standard output is sufficient.

- A robot that is not on the table can choose the ignore the MOVE, LEFT, RIGHT
  and REPORT commands.
- Input can be from a file, or from standard input, as the developer chooses.
- Provide test data to exercise the application.

Constraints
-----------

- The toy robot must not fall off the table during movement. This also
  includes the initial placement of the toy robot.
- Any move that would cause the robot to fall must be ignored.

Example Input and Output
------------------------

### Example a

    PLACE 0,0,NORTH
    MOVE
    REPORT

Expected output:

    0,1,NORTH

### Example b

    PLACE 0,0,NORTH
    LEFT
    REPORT

Expected output:

    0,0,WEST

### Example c

    PLACE 1,2,EAST
    MOVE
    MOVE
    LEFT
    MOVE
    REPORT

Expected output

    3,3,NORTH

Deliverables
------------

The Ruby source files, the test data and any test code.

It is not required to provide any graphical output showing the movement of
the toy robot.

## Extension

The following brief assumes that a working *Toy Robot Simulator* has been completed as part of the REA interview process.

### Pairing interview exercises

#### 1. Extend the Toy Robot with a **PLACE_OBJECT** command that will place an object on the tabletop surface.

When moving the toy robot it should be prevented from bumping into previously placed objects on the tabletop surface.
**PLACE_OBJECT** should place an object in front of the current location of the toy robot.

For example if the toy robot is at location **(0, 0)** and facing **EAST**, an object should be placed in location **(1, 0)**.

#### 2. Extend the Toy Robot with a MAP command.

When issued a map command, the simular should print an ASCII map of the current tabletop that indicates where objects have been placed
The ASCII map of the table top should indicate previously placed objects using the **'X'** character.

For example a table top with objects at locations **(1, 0)** and **(2, 2)** should return:

    00000
    00000
    00X00
    00000
    0X000
