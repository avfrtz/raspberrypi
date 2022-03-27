# Ava Fritz
# 07/27/2023
# This assignment asks for 3 numbers. It calculates and returns the max number.
# References Module 9 Lecture 2

.text
.global main
main:
    # Push the stack
    SUB sp, sp, #12
    STR lr, [sp, #0]

    # Prompt for and read number 1
    LDR r0, =prompt0
    BL printf
    LDR r0, =format0
    LDR r1, =num1
    BL scanf
    LDR r4, =num1
    LDR r4, [r4]
    #MOV r4, r0
    
    # Prompt for and read number 2
    LDR r0, =prompt1
    BL printf
    LDR r0, =format1
    LDR r1, =num2
    BL scanf
    LDR r3, =num2
    LDR r3, [r3]
    
    # Prompt for and read number 3
    LDR r0, =prompt2
    BL printf
    LDR r0, =format2
    LDR r1, =num3
    BL scanf
    LDR r2, =num3
    LDR r2, [r2]
    
    # Calculate maximum
    # Compare num1 with num2
    MOV r1, #0
    MOV r3, #3
    CMP r4, r3
    MOVGT r1, r4

    # Compare result with num2
    CMP r1, r3
    MOVGT r1, r3

    # Compare result with num3
    MOV r2, #2
    CMP r1, r2
    MOVGT r1, r2

    # Largest value now resides in r1
    # Print result
    MOV r1, r4
    LDR r0, =result
    BL printf

    # Pop the stack
    LDR lr, [sp, #0]
    ADD sp, sp, #12
    MOV pc, lr

.data
    prompt0: .asciz "\nEnter number 1: "
    prompt1: .asciz "\nEnter number 2: "
    prompt2: .asciz "\nEnter number 3: "
    format0: .asciz "%d"
    format1: .asciz "%d"
    format2: .asciz "%d"
    num1: .word 0
    num2: .word 0
    num3: .word 0
    result: .asciz "\nThe max number of 3 is: %d\n"

# END Main
