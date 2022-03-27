.text
.global main
main:
    SUB sp, sp, #4
    STR lr, [sp]
    
    LDR r0, =prompt
    BL printf    // Display the prompt to the user
    LDR r0, =formatString
    LDR r1, =userTemperature
    BL scanf

    LDR r0, =userTemperature
    LDR r0, [r0]
    MOV r1, #60
    BL __aeabi_idiv
    MOV r4, r0    // Hours in r4

    MOV r1, #60
    MOV r0, r4
    MUL r0, r1, r4    // Multiply r0 and r4 in r0

    LDR r1, =userTemperature
    LDR r1, [r1]
    SUB r1, r1, r0    // Remaining minutes after all hours accounted for

    MOV r2, r1
    MOV r1, r4
    LDR r0, =output
    BL printf

    LDR lr, [sp]
    ADD sp, sp, #4
    MOV pc, lr

.data
    output: .asciz "\nDegrees in Celsius is %d\n"
    prompt: .asciz "Enter temperature in Fahrenheit: "
    userTemperature: .word 0
    formatString: .asciz "%d"
