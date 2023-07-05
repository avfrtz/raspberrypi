// Ava Fritz
// 07/04/2023
// This program takes in a temperature in Fahrenheit and converts to Celsius
// References to module 5 lecture c (poly.s)
// Compile with "make fahToCel"
// Run with "./fahToCel"

.text
.global main
main:

    // push the stack
    SUB sp, sp, #4
    STR lr, [sp]

    // prompt the user and read in temperature in Fahrenheit
    LDR r0, =prompt
    BL printf
    LDR r0, =formatString
    LDR r1, =tempFah
    BL scanf

    // load the temperature in Fahrenheit to r0
    LDR r0, =tempFah
    LDR r0, [r0]

    // store 32 in r1, subtract r1 from r0, and store result in r0
    MOV r1, #32
    SUB r0, r0, r1

    // store 5 in r1, multiply r0 and r1, and store result in r0
    MOV r1, #5
    MUL r0, r0, r1

    // store 9 in r1, divide r0 by r1, and store result in r0
    MOV r1, #9
    BL __aeabi_idiv

    // move r0 to r1, output result in r0
    MOV r1, r0
    LDR r0, =output
    BL printf
  
    // pop the stack
    LDR lr, [sp]
    ADD sp, sp, #4
    MOV pc, lr

.data
    output: .asciz "\nThe temperature in Celsius is %d\n"
    prompt: .asciz "Enter temperature in Fahrenheit: "
    tempFah: .word 0
    formatString: .asciz "%d"
