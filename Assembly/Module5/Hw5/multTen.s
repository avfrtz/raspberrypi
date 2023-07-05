// Ava Fritz
// 07/04/2023
// This program takes in an integer, multiplies it by 10 using left shifts and adds, and returns the result
// References to module 5 lecture E
// Compile with "make multTen"
// Run with "./multTen"

.text
.global main
main:

    // push the stack
    SUB sp, sp, #4
    STR lr, [sp]
    
    // prompt the user and read in the integer
    LDR r0, =prompt
    BL printf
    LDR r0, =formatString
    LDR r1, =integer
    BL scanf

    // load the integer to r0
    LDR r0, =integer
    LDR r0, [r0]
  
    // store 3 in r1
    MOV r1, #3

    // apply left shift to r0 by 2^3 (8) and store in r2
    LSL r2, r0, r1
 
    // store 1 in r1
    MOV r1, #1
  
    // apply left shift to r0 by 2^1 (2) and store in r3
    LSL r3, r0, r1

    // add r2 and r3 and store in r1 (8n+2n=10n)
    ADD r1, r2, r3

    // output result in r0
    LDR r0, =output
    BL printf

    // pop the stack
    LDR lr, [sp]
    ADD sp, sp, #4
    MOV pc, lr

.data
    output: .asciz "\nMultiplied by 10 result: %d\n"
    prompt: .asciz "Enter integer: "
    integer: .word 0
    formatString: .asciz "%d"
