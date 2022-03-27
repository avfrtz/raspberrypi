.text
.global main

main:
    SUB sp, sp, #4
    STR lr, [sp, #0]
 
    MOV r0, #-32

    # (if r0 > 0)
    MOV r1, #0
    CMP r0, r1
    BLE Else
        # Code block for if
        LDR r0, =positive
        BL printf
        B EndIf
    Else:
        # Code block for else
        LDR r0, =negative
        BL printf
    EndIf:

    LDR lr, [sp, #0]
    ADD sp, sp, #4
    MOV pc, lr

# End main

.data
    positive: .asciz "Number is positive\n"
    negative: .asciz "Number is negative\n"
