// Ava Fritz
// 07/04/2023
// This program takes in a temperature in Celsius and converts to Fahrenheit
// References to module 5 lecture C (poly.s) 
// Compile with "make celToFah"
// Run with "./celToFah"

.text
.global main
main:

    // push the stack
    SUB sp, sp, #4
    STR lr, [sp]

    // prompt the user and read in temperature in Celsius
    LDR r0, =prompt
    BL printf
    LDR r0, =formatString
    LDR r1, =tempCel
    BL scanf

    // load the temperature in Celsius to r0
    LDR r0, =tempCel
    LDR r0, [r0]

    // store 9 in r1, multiply r0 and r1, and store result in r0
    MOV r1, #9
    MUL r0, r0, r1

    // store 5 in r1, divide r0 by r1, and store result in r0
    MOV r1, #5
    BL __aeabi_idiv

    // store 32 in r1, add r0 and r1, and store result in r0
    MOV r1, #32
    ADD r0, r0, r1


    // move r0 to r1, output result in r0
    MOV r1, r0
    LDR r0, =output
    BL printf
  
    // pop the stack
    LDR lr, [sp]
    ADD sp, sp, #4
    MOV pc, lr

.data
    output: .asciz "\nThe temperature in Fahrenheit is %d\n"
    prompt: .asciz "Enter temperature in Celsius: "
    tempCel: .word 0
    formatString: .asciz "%d"
