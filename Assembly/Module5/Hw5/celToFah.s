.text
.global main
main:

    SUB sp, sp, #4
    STR lr, [sp]

    LDR r0, =prompt
    BL printf
    LDR r0, =formatString
    LDR r1, =tempCel
    BL scanf


    LDR r0, =tempCel
    LDR r0, [r0]
    MOV r1, #9
    MUL r0, r0, r1
    MOV r1, #5
    BL __aeabi_idiv // this function divides r1/r0 and stores it in r0

    MOV r1, #32
    ADD r0, r0, r1

    MOV r1, r0
    LDR r0, =output
    BL printf
  
    LDR lr, [sp]
    ADD sp, sp, #4
    MOV pc, lr

.data
    output: .asciz "\nThe temperature in Fahrenheit is %d\n"
    prompt: .asciz "Enter temperature in Celsius: "
    tempCel: .word 0
    formatString: .asciz "%d"
