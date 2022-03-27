.text
.global main
main:
    SUB sp, sp, #4
    STR lr, [sp]
    
    LDR r0, =prompt1
    BL printf
    LDR r0, =formatString1
    LDR r1, =feet
    BL scanf

    LDR r0, =prompt2
    BL printf
    LDR r0, =formatString2
    LDR r1, =inches
    BL scanf

    LDR r0, =feet
    LDR r0, [r0]
    MOV r1, #12
    MUL r0, r0, r1
    MOV r4, r0

    LDR r2, =inches
    LDR r2, [r2]
    ADD r2, r2, r4

    MOV r1, r2
    LDR r0, =output
    BL printf

    LDR lr, [sp]
    ADD sp, sp, #4
    MOV pc, lr

.data
    output: .asciz "\nTotal inches is %d\n"
    prompt1: .asciz "Enter feet: "
    prompt2: .asciz "Enter inches: "
    feet: .word 0
    inches: .word 0
    formatString1: .asciz "%d"
    formatString2: .asciz "%d"
