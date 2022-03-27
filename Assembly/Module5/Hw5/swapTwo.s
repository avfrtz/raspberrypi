.text
.global main
main:
    SUB sp, sp, #4
    STR lr, [sp]
    
    LDR r0, =prompt1
    BL printf
    LDR r0, =formatString1
    LDR r1, =int1
    BL scanf

    LDR r0, =prompt2
    BL printf
    LDR r0, =formatString2
    LDR r1, =int2
    BL scanf

    LDR r0, =int1
    LDR r0, [r0]
    LDR r1, =int2
    LDR r1, [r1]

    EOR r0, r0, r1
    EOR r1, r0, r1
    EOR r0, r0, r1

    MOV r2, r1
    MOV r1, r0
    LDR r0, =output
    BL printf

    LDR lr, [sp]
    ADD sp, sp, #4
    MOV pc, lr

.data
    output: .asciz "\nInt 1 is %d and int 2 is %d\n"
    prompt1: .asciz "Enter integer 1: "
    prompt2: .asciz "Enter integer 2: "
    int1: .word 0
    int2: .word 0
    formatString1: .asciz "%d"
    formatString2: .asciz "%d"
