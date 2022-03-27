.text
.global main
main:
    SUB sp, sp, #4
    STR lr, [sp]
    
    LDR r0, =prompt
    BL printf
    LDR r0, =formatString
    LDR r1, =inches
    BL scanf

    LDR r0, =inches
    LDR r0, [r0]
    MOV r1, #12
    BL __aeabi_idiv
    MOV r4, r0

    MOV r1, #12
    MOV r0, r4
    MUL r0, r1, r4

    LDR r1, =inches
    LDR r1, [r1]
    SUB r1, r1, r0    // Remaining inches after all feet accounted for

    MOV r2, r1
    MOV r1, r4
    LDR r0, =output
    BL printf

    LDR lr, [sp]
    ADD sp, sp, #4
    MOV pc, lr

.data
    output: .asciz "\nTotal feet is %d and inches is %d\n"
    prompt: .asciz "Enter total inches: "
    inches: .word 0
    formatString: .asciz "%d"
