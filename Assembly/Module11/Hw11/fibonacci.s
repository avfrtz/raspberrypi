# Ava Fritz
# 08/12/2023
# This program takes in one number, calculates the fibonacci number, and returns the result.
# Dictionary:
# r4 = n
# This program references Module 11 Lecture 3 (Summation.s)
.global main
main:
    # Push the stack
    SUB sp, sp, #4
    STR lr, [sp]
    # Load in the first value
    LDR r0, =prompt
    BL printf
    LDR r0, =format
    LDR r1, =number
    BL scanf
    # Store the first value in r4
    LDR r4, =number
    LDR r4, [r4]
    # Move the variable to r0 for input into the Fib function
    MOV r0, r4
    BL Fib
    # Move the result to r1 to print
    MOV r1, r0
    # Move the output message to r0 and print
    LDR r0, =output
    BL printf
    # Pop the stack
    LDR lr, [sp]
    ADD sp, sp, #4
    MOV pc, lr

.data
    prompt: .asciz "\nEnter value (n): "
    output: .asciz "\nThe fibonacci number is %d\n"
    format: .asciz "%d"
    number: .word 0

# End main
.text
# Ava Fritz
# 08/12/2023
# This program does recursive addition to calculate the fibonacci number
# Dictionary:
# r0 - result of multiplication
# r1 - n - 1
# r2 - n - 2
# r4 - original value of n
# Function: if (n==0) or (n==1), return 1. else return Fib(n-1) + Fib(n-2)
Fib:
    # Push the stack
    SUB sp, sp, #12
    STR lr, [sp, #0]
    STR r4, [sp, #4]
    STR r5, [sp, #8]

    # if (n==0), check n==1
    CMP r0, #0
    BNE Else1
        MOV r0, #1
        B Return
    Else1:
        # Check if n == 1
        CMP r0, #1
        BNE ElseFib
            MOV r0, #1
            B Return
        ElseFib:
            # Store n in r4 for safekeeping
            MOV r4, r0
            # Calculate n - 1
            SUB r0, r0, #1
            # Fib(n-1)
            BL Fib
            # Store result in r5
            MOV r5, r0
            # Calculate n - 2
            SUB r0, r4, #2
            # Fib(n-2)
            BL Fib
            # Fib(n-1) + Fib(n-2)
            ADD r0, r0, r5
    Endif: 

    # Pop the stack
    Return:
    LDR lr, [sp]
    LDR r4, [sp, #4]
    LDR r5, [sp, #8]
    ADD sp, sp, #12
    MOV pc, lr

.data

#End Fib
