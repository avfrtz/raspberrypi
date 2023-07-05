// Ava Fritz
// 07/04/2023
// This program takes in two integers and swaps them without using a temporary variable
// References to module 5 lecture D and XOR swap algorithm (Wikipedia)
// Compile with "make swapTwo"
// Run with "./swapTwo"

.text
.global main
main:

    // push the stack
    SUB sp, sp, #4
    STR lr, [sp]
      
    // prompt the user and read in integer 1
    LDR r0, =prompt1
    BL printf
    LDR r0, =formatString1
    LDR r1, =int1
    BL scanf

    // prompt the user and read in integer 2
    LDR r0, =prompt2
    BL printf
    LDR r0, =formatString2
    LDR r1, =int2
    BL scanf

    // load integer 1 to r0 and integer 2 to r1
    LDR r0, =int1
    LDR r0, [r0]
    LDR r1, =int2
    LDR r1, [r1]

    // apply XOR swap algorithm
    EOR r0, r0, r1
    EOR r1, r0, r1
    EOR r0, r0, r1
 
    // move r1 to r2 and r0 to r1
    MOV r2, r1
    MOV r1, r0

    // output result in r0
    LDR r0, =output
    BL printf

    // pop the stack
    LDR lr, [sp]
    ADD sp, sp, #4
    MOV pc, lr

.data
    output: .asciz "\nInt 1 is %d and int 2 is %d\n"
    prompt1: .asciz "Enter integer 1: "
    prompt2: .asciz "Enter integer 2: "
    int1: .word 0
    int2: .word 0
    formatString1: .asciz "%d"
    formatString2: .asciz "%d"
