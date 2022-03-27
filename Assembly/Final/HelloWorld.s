.text
.global main
main:
    SUB sp, sp, #4
    STR lr, [sp]

    MOV r0, #0
    MOV r1, #1
    MUL r0, r1, #3
    BL printf

    LDR lr, [sp]
    ADD sp, sp, #4
    MOV pc, lr
.data
    helloWorld: .asciz "Hello World!\n"
#End main
