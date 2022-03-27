.text
.global main
main:
    SUB sp, sp, #4
    STR lr, [sp, #0]
    
    MOV r0, #0x32
    BL converToInt

    LDR lr, [sp, #0]
    ADD sp, sp, #4
    MOV pc, lr

converToInt:
    SUB sp, sp, #4
    STR lr, [sp, #0]
    
    MOV r4, #0x30
    CMP r0, r4
    BLT convert
    
    MOV r4, #0x39
    CMP r0, r4
    BLT convert
    B NotANumber

IsANumber:
    LDR lr, [sp, #0]
    ADD sp, sp, #4
    MOV pc, lr

NotANumber:
    LDR r0, =output
    BL printf

    LDR lr, [sp, #0]
    ADD sp, sp, #4
    MOV pc, lr

convert:
    SUB r0, #0x30
    B IsANumber

.data
    output: .asciz "NAN\n"
    
