# Single-Cycle-MIPS-Processor
## Introduction :
In this project, you are required to implement a 32-bit single-cycle microarchitecture MIPS processor based on Harvard Architecture. The single-cycle microarchitecture executes an entire instruction in one cycle. In other words instruction fetch, instruction decode, execute, write back, and program counter update occurs within a single clock cycle.
## Objective  :
Referring to figure one, you are required to write the RTL Verilog files for all sub-modules of the MIPS processor (e.g. Register File, Instruction Memory, etc.). Then, implementing the top module of the MIPS processor. Finally, you will configure this processor on Cyclone® IV FPGA device.
![image](https://user-images.githubusercontent.com/82510750/157867565-066f0412-304c-4fe9-a7b4-102e4f9c5aa8.png)
## Top_Module View :
![image](https://user-images.githubusercontent.com/82510750/157869058-734efa55-eaf3-473f-8c92-df1c9dc5a876.png)
![n1](https://user-images.githubusercontent.com/82510750/157869226-b63db45b-742f-4185-838f-07693d03966f.PNG)
## Mips block design :
![n2](https://user-images.githubusercontent.com/82510750/157869323-4b0f4356-029a-4ebd-bf02-0b1f68047fcf.PNG)
## Datapath block design :
![datapath](https://user-images.githubusercontent.com/82510750/157869760-fa4ea8ea-fe16-411d-80a2-816aca76ab32.PNG)
## Testing block through the fpga
![confg through fpga](https://user-images.githubusercontent.com/82510750/157870141-d9e25d71-d001-45f6-9b88-fb0f7338b4b1.PNG)

# Simulation Results 
- Calculating  the GCD of two Numbers **(120 , 180)**
![N5](https://user-images.githubusercontent.com/82510750/157871019-d4c1edac-85b1-44fb-a8e3-6912050fcf1e.PNG)
- Calculating  the Factorial of a given Number **!7**
![Test_case 2](https://user-images.githubusercontent.com/82510750/157871318-799ce9cb-ab4f-4643-93bb-6bdd7993566d.PNG)
- find fibonacci sequence
![Test_case 3](https://user-images.githubusercontent.com/82510750/157871715-782cb09e-7a88-4ee0-a156-c9666d68f0b3.PNG)



