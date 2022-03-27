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

    # Initialize variables
    MOV r6, #2

    # Start the outer loop
    StartOuterLoop:
        # Determine if we reached max
        CMP r6, r4
        # If we reached max, end the loop
        BGT EndOuterLoop
        # Loop Block
        # Calculate n/2
        LSR r5, r6, #1
        # Initialize variable
        MOV r7, #2

    # Start inner loop
    StartInnerLoop:
    # Compare index with n/2
    CMP r7, r5
    # If index is greater than n/2 without divisible number, then n is prime
    BGT IsPrime
    MOV r0, r6
    MOV r1, r7
    # Divide n by index. Determine if remainder in r1 is equal to 0, meaning it is divisible and therefore not prime
    BL __aeabi_uidivmod
    CMP r1, #0
    # If divisible, it's not a prime
    BEQ NotPrime
    # Increment the index
    ADD r7, r7, #1
    # Repeat the inner loop until index is n/2 or non prime is found
    B StartInnerLoop

    IsPrime:
    # n is a prime number
    # print n
    CMP r6, #2
    BEQ PrintListOfPrimes

    LDR r0, =output
    BL printf

    PrintListOfPrimes:
    LDR r0, =format
    MOV r1, r6
    BL printf

    NotPrime:
    # current index is not a prime number, so repeat the outer loop
    ADD r6, r6, #1
    B StartOuterLoop

    # End label
    EndOuterLoop:

    

    # Pop the stack
    LDR lr, [sp]
    ADD sp, sp, #4
    MOV pc, lr

.data
    prompt: .asciz "Enter a number greater than 2: \t"
    format: .asciz "%d"
    num: .word 0
    output: .asciz ","
