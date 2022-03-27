# Ava Fritz
# 08/12/2023
# This program takes in two numbers, multiplies them, and returns the result.
# Dictionary:
# r4 = m
# r5 = n
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
    # Load in the second value
    LDR r0, =prompt2
    BL printf
    LDR r0, =format
    LDR r1, =number
    BL scanf
    # Store the second value in r5
    LDR r5, =number
    LDR r5, [r5]
    # Move the variables to r0 and r1 for input into the Mul function
    MOV r0, r4
    MOV r1, r5
    BL Mult
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
    prompt: .asciz "\nEnter first value (m): "
    prompt2: .asciz "\nEnter second value (n): "
    output: .asciz "\nThe result of the multiplication is %d\n"
    format: .asciz "%d"
    number: .word 0

# End main
.text
# Ava Fritz
# 08/12/2023
# This program does recursive addition to multiply two values.
# Dictionary:
# r0 - result of multiplication
# r1 - n
# r4 - m
# Function: if (n==1), return m. else, m + mult(m, n-1)
Mult:
    # Push the stack
    SUB sp, sp, #8
    STR lr, [sp, #0]
    STR r4, [sp, #4]

    # if (n==1) return m
    CMP r1, #1
    BNE Else
        B Return
    Else:
        # n - 1
        # Store original value of m for safekeeping
        MOV r4, r0
        # Since n is used to stop the loop at n=1, subtract 1 from n incrementally
        SUB r1, r1, #1
        # Recursively call Mult
        BL Mult
        # m + mult(m, n-1)
        ADD r0, r4, r0
        B Return
    Endif: 

    # Pop the stack
    Return:
    LDR lr, [sp]
    LDR r4, [sp, #4]
    ADD sp, sp, #8
    MOV pc, lr

.data

#End Mult
