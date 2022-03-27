.text
.global main

main:
    SUB sp, sp, #4
    STR lr, [sp, #0]

    MOV r0, #-0x32

    # initialize by prompoting user, answer in r4
    LDR r0, =prompt
    BL printf
    LDR r0, =input
    LDR r1, =num
    BL scanf
    LDR r1, =num
    LDR r4, [r1, #0]

    StartSentinelLoop:
        MOV r0, #-1
        CMP r4, r0
        BEQ EndSentinelLoop

            # Loop block
            LDR r0, =output
            MOV r1, r4
            BL printf
    
            # Get the next value
            LDR r0, =prompt
            BL printf
            LDR r0, =input
            LDR r1, =num
            BL scanf
            LDR r1, =num
            LDR r4, [r1, #0]

            B StartSentinelLoop

    EndSentinelLoop:
        LDR lr, [sp, #0]
        ADD sp, sp, #4
        MOV pc, lr

# End main

.data
    prompt: .asciz "Please enter a number (-1 to end) \n"
    output: .asciz "You entered %d\n"
    input: .asciz "%d"
    num: .word 0
