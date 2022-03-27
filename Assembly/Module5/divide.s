.text
.global main
main:
    # divide 8 by 2 and print the results
    SUB sp, sp, #4
    STR lr, [sp]

    MOV r0, #8
    MOV r1, #2
    BL __ieabi_idiv

    MOV r1, r0
    LDR r0, =output
    BL printf
    LDR lr, [sp]

    ADD sp, sp, #4
    MOV pc, lr

.data
    output: .asciz "The result of 8/2 is: %d \n"
