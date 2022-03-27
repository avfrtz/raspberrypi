.text
.global main
main:
    SUB sp, sp, #4
    STR lr, [sp]
    
    LDR r0, =prompt
    BL printf
    LDR r0, =formatString
    LDR r1, =integer
    BL scanf

    LDR r0, =integer
    LDR r0, [r0]
    MOV r1, #3
    LSL r2, r0, r1
    MOV r1, #1
    LSL r3, r0, r1
    ADD r1, r2, r3

    LDR r0, =output
    BL printf

    LDR lr, [sp]
    ADD sp, sp, #4
    MOV pc, lr

.data
    output: .asciz "\nMultiplied by 10 result: %d\n"
    prompt: .asciz "Enter integer: "
    integer: .word 0
    formatString: .asciz "%d"
