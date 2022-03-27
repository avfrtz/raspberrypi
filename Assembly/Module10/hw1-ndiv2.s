.text
.global main

main:
    SUB sp, sp, #4
    STR lr, [sp, #0]

    # prompt for loop limit, store in r4
    LDR r0, =prompt
    BL printf
    LDR r0, =input
    LDR r1, =num
    BL scanf
    LDR r1, =num
    LDR r4, [r1, #0]

    # initialize the loop
    # r0 - counter
    # r4 - loop limit
    # r5 - sum

    # new - initialize the loop
    # r2 - counter
    # r3 - loop limit (n/2)
    # r4 - n
    # r5 - sum

    ADD r0, r4, #0
    MOV r1, #2
    BL __aeabi_uidiv
    MOV r3, r0
    MOV r2, #2
    MOV r5, #0

    StartCountingLoop:
    CMP r3, r2
    BLE EndCountingLoop

        # Loop Block
        ADD r5, r5, r2

        # Get the next value
        ADD r2, r2, #1

        B StartCountingLoop
    EndCountingLoop:

    LDR r0, =outputPrime
    MOV r1, r5
    BL printf

    MOV r0, #0
    LDR lr, [sp, #0]
    ADD sp, sp, #4
    MOV pc, lr

# END main

.data
    prompt: .asciz "Please enter a value n \n"
    outputPrime: .asciz "%d is prime.\n"
    input: .asciz "%d"
    num: .word 0
