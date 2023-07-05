// Ava Fritz
// 07/04/2023
// This program takes in a measurement in feet and inches, converts it to inches, and returns the result
// References to module 5 lecture D (Pass.s) and module 5 lecture C (minuteConv.s)
// Compile with "make feetToInch"
// Run with "./feetToInch"

.text
.global main
main:

    // push the stack
    SUB sp, sp, #4
    STR lr, [sp]
    
    // prompt the user and read in first measurement input in feet
    LDR r0, =prompt1
    BL printf
    LDR r0, =formatString1
    LDR r1, =feet
    BL scanf

    // prompt the user and read in second measurement input in inches
    LDR r0, =prompt2
    BL printf
    LDR r0, =formatString2
    LDR r1, =inches
    BL scanf

    // load the feet to r0
    LDR r0, =feet
    LDR r0, [r0]

    // store 12 in r1, multiple r0 and r1, and store result in r0
    MOV r1, #12
    MUL r0, r0, r1

    // store r0 in r4 to prevent accidental overwrite
    MOV r4, r0

    // load the inches to r2
    LDR r2, =inches
    LDR r2, [r2]

    // add r2 and r4, store in r2
    ADD r2, r2, r4

    // move r2 to r1, output result in r0
    MOV r1, r2
    LDR r0, =output
    BL printf

    // pop the stack
    LDR lr, [sp]
    ADD sp, sp, #4
    MOV pc, lr

.data
    output: .asciz "\nTotal inches is %d\n"
    prompt1: .asciz "Enter feet: "
    prompt2: .asciz "Enter inches: "
    feet: .word 0
    inches: .word 0
    formatString1: .asciz "%d"
    formatString2: .asciz "%d"
