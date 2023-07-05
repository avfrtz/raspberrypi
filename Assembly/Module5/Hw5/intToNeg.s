// Ava Fritz
// 07/04/2023
// This program takes in an integer, converts it to negative using 2's complement, and returns the result
// References to module 5 lecture D
// Compile with "make intToNeg"
// Run with "./intToNeg"

.text
.global main
main:

    // push the stack
    SUB sp, sp, #4
    STR lr, [sp]
    
    // prompt the user and read in integer
    LDR r0, =prompt
    BL printf
    LDR r0, =formatString
    LDR r1, =integer
    BL scanf

    // load the integer in r0
    LDR r0, =integer
    LDR r0, [r0]

    // apply 1's complement to r0 and store in r1
    MVN r1, r0

    // store 1 in r0, add r0 to r1 and store in r1
    MOV r0, #1
    ADD r1, r1, r0    // add 1 to the result of integer 1's complement

    // output result in r0
    LDR r0, =output
    BL printf

    // pop the stack
    LDR lr, [sp]
    ADD sp, sp, #4
    MOV pc, lr

.data
    output: .asciz "\nNegative result: %d\n"
    prompt: .asciz "Enter integer: "
    integer: .word 0
    formatString: .asciz "%d"
