# Ava Fritz
# 08/06/2023
# This program determins if a number is prime.
# Dictionary
# r4 - n
# r5 - n/2
# r6 - outer loop index
# r7 - inner loop index
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
    # Before anything, check that the user doesn't want to quit
    CMP r4, #-1
    BEQ EndOuterLoop
    
    # Make sure the input is greater than 2
    CMP r4, #2
    BLE Error

    # Initialize variables
    # Since we are only checking one number for this program, set the outer loop index to n
    MOV r6, r4

    # Start the outer loop
    StartOuterLoop:
        # Condition check
        # Determine if we reached max
        CMP r6, r4
        # Branch to end if condition met
        # If we reached max, end the loop
        BGT EndOuterLoop
        # Statement block if true
        # Calculate n/2
        LSR r5, r6, #1
        # Initialize inner loop counter
        MOV r7, #2

    # Start inner loop
    StartInnerLoop:
    # Condition check
    # Compare index with n/2
    CMP r7, r5
    # Branch to end if condition met
    # If index is greater than n/2 without divisible number, then n is prime
    BGT PrintPrime
    # Statement block if true
    MOV r0, r6
    MOV r1, r7
    # Divide n by index. Determine if remainder in r1 is equal to 0, meaning it is divisible and therefore not prime
    BL __aeabi_uidivmod
    CMP r1, #0
    # Condition check
    # If divisible, it's not a prime
    # Branch if condition met
    BEQ NotPrime
    # Statement block if true
    # Increment the inner loop index
    ADD r7, r7, #1
    # Branch to start label
    # Repeat the inner loop until index is n/2 or non prime is found
    B StartInnerLoop

    PrintPrime:
    # If the value is prime, print prime output
    LDR r0, =outputPrime
    MOV r1, r4
    BL printf
    # End the program
    B EndOuterLoop

    NotPrime:
    # If the value is not prime, print not prime output
    LDR r0, =outputNotPrime
    MOV r1, r4
    BL printf
    # End the program
    B EndOuterLoop

    Error:
    # Value is less than 2 but not -1
    LDR r0, =errorMsg
    MOV r1, r4
    BL printf
    # End the program
    B EndOuterLoop
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
    outputPrime: .asciz "Number %d is prime\n."
    outputNotPrime: .asciz "Number %d is not prime\n."
    errorMsg: .asciz "ERROR: Number %d is not valid. Try again with a number greater than 2.\n"
