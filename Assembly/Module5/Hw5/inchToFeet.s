// Ava Fritz
// 07/04/2023
// This program takes in a measurement in inches, converts to feet and inches, and returns result
// References module 5 lecture D (Pass.s) and module 5 lecture C (minuteConv.s)
// Compile with "make inchToFeet"
// Run with "./inchToFeet"

.text
.global main
main:

    // push the stack
    SUB sp, sp, #4
    STR lr, [sp]
    
    // prompt the user and read in measurement in inches
    LDR r0, =prompt
    BL printf
    LDR r0, =formatString
    LDR r1, =inches
    BL scanf

    // load the inches to r0
    LDR r0, =inches
    LDR r0, [r0]

    // store 12 in r1, divide r0 by r1, and store result in r0
    MOV r1, #12
    BL __aeabi_idiv

    // move r0 to r4 to prevent accidental overwrite
    MOV r4, r0

    // multiply r1 and r4 and store in r0
    MUL r0, r1, r4

    // load the inches to r1 
    LDR r1, =inches
    LDR r1, [r1]

    // subtract r0 from r1
    SUB r1, r1, r0    // Remaining inches after all feet accounted for

    // move r1 to r2, move r4 to r1, output result in r0
    MOV r2, r1
    MOV r1, r4
    LDR r0, =output
    BL printf

    // pop the stack
    LDR lr, [sp]
    ADD sp, sp, #4
    MOV pc, lr

.data
    output: .asciz "\nTotal feet is %d and inches is %d\n"
    prompt: .asciz "Enter total inches: "
    inches: .word 0
    formatString: .asciz "%d"
