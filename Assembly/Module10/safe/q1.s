# Ava Fritz
# 08/06/2023
# This program calculates the prime numbers between 2 and n.
# If n is prime, it prints n.
# If n is not prime, it prints the prime numbers between 2 and n.

.text
.global main
main:
    # Push the stack
    SUB sp, sp, #4
    STR lr, [sp]

    # Prompt the user
    LDR r0, =prompt
    BL printf
    LDR r0, =format
    LDR r1, =num
    BL scanf
    LDR r0, =num
    LDR r0, [r0]
    
    # Move the input to r4 for safe keeping
    MOV r4, r0

    # Initialize the variables
    # r2 - loop count
    # r3 - n/2
    # r4 = n
    # r5 = counter
    MOV r0, #0
    MOV r1, #2
    ADD r0, r4, r0
    BL __aeabi_idiv
    MOV r3, r0
    MOV r0, #0
    MOV r5, #0
    MOV r2, #2

    # Start the outer loop
    StartOuterLoop:
        CMP r2, r3
        BGE EndOuterLoop
        # Loop Block
        ADD r5, r5, r2
        # Get next value
        ADD r2, r2, #1
        # Branch to start lable
        B StartOuterLoop
    # End label
    EndOuterLoop:

    # Print the output
    LDR r0, =output
    MOV r1, r5
    BL printf

    # Pop the stack
    MOV r0, #0
    LDR lr, [sp]
    ADD sp, sp, #4
    MOV pc, lr

.data
    prompt: .asciz "Enter a number greater than 2: \t"
    format: .asciz "%d"
    num: .word 0
    output: .asciz "\nThe number is %d \n."
