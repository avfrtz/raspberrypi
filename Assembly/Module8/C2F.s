#C2F.s
# An assembly program to calculate celsius to fahrenheit

    .text
    .global main

main:
# Save return to os on stack
    SUB sp, sp, #4
    STR lr, [sp, #0]

# Prompt for an input in celsius
    LDR r0, =prompt1
    BL printf

# Scanf
    LDR r0, =input1
    SUB sp, sp, #4
    MOV r1, sp
    BL scanf
    LDR r0, [sp, #0]
    ADD sp, sp, #4

# Convert
    BL C2F
    MOV r1, r0

# Print fahrenheit
    LDR r0, =format1
    BL printf

# Return to the OS
    LDR lr, [sp, #0]
    ADD sp, sp, #4
    MOV pc, lr

.data
    prompt1: .asciz "Enter the temp in C that you want in F:\t"
    format1: .asciz "\nThe temp in F is: %d\n"
    input1: .asciz "%d"
    num1: .word 0
