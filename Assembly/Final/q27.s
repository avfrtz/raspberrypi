# Ava Fritz
# 8/18/2023
# This program accepts user input until given -1.
# It counts the number of input, calculates the sum, and calculates the average.
# It prints the results.
# References SentinelLoop from Module10 Reading
# Register dictionary:
# r8 - count of input
# r2 - user input
# r4 - sum of input
# r3 - average of input
# Pseudo Code:
#count = 0
#userInput = 0
#inputTotal = 0
#inputAverage = 0
#while userInput != 0
#    count += 1
#    inputTotal += userInput
# after the while loop breaks due to user input of -1
#
#inputAverage = inputTotal / count
#
#print("Total numbers input: " + count)
#print("Sum of numbers input: " + inputTotal)
#print("Average of numbers input: " + inputAverage)
.text
.global main

main:
    # push the stack
    SUB sp, sp, #12
    STR r4, [sp, #4]
    STR r8, [sp, #8]
    STR lr, [sp, #0]

    # Initialize variables
    MOV r0, #-0x32
    MOV r8, #0
    MOV r4, #0

    # Prompting user, store answer in r4
    LDR r0, =prompt
    BL printf
    LDR r0, =input
    LDR r1, =num
    BL scanf
    LDR r1, =num
    LDR r2, [r1, #0]

    StartSentinelLoop:
        MOV r0, #-1
        CMP r2, r0
        BEQ EndSentinelLoop

            # Add to the counter and total
            ADD r8, r8, #1
            ADD r4, r4, r2

            # Get the next value
            LDR r0, =prompt
            BL printf
            LDR r0, =input
            LDR r1, =num
            BL scanf
            LDR r1, =num
            LDR r2, [r1, #0]

            B StartSentinelLoop

    EndSentinelLoop:
        # Calculate the average
        ADD r0, r4, #0
        ADD r1, r8, #0
        BL __aeabi_idiv
        MOV r3, r0

        # Print the output
        LDR r0, =output
        MOV r1, r8
        MOV r2, r4
        BL printf

        LDR lr, [sp, #0]
        ADD sp, sp, #4
        MOV pc, lr

# End main

.data
    prompt: .asciz "Please enter a number (-1 to end) \n"
    output: .asciz "Count of numbers input: %d\nSum: %d\nAverage: %d\n"
    input: .asciz "%d"
    num: .word 0
