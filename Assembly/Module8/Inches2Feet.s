# Inches2Ft.s
# An assembly program to calculate Feet to Inches
    .text
    .global main

main:
# Save return to os on stack
    SUB sp, sp, #4
    STR lr, [sp, #0]

# Prompt for an input in inches
    LDR r0, =prompt1
    BL printf

# Scanf
    LDR r0, =input1
    SUB sp, sp, #4
    MOV r1, sp
    BL scanf
    LDR r0, [sp, #0]
    ADD sp, sp, #4

# Store value in r3 for remainder
    LDR r3, =input1
    LDR r3, [r3]

# Convert
    BL Inches2Ft
    MOV r2, r3
    MOV r1, r4

# Print inches
    LDR r0, =format1
    BL printf

# Return to the OS
    LDR lr, [sp, #0]
    ADD sp, sp, #4
    MOV pc, lr

.data
    prompt1: .asciz "Enter the length in inches you want in feet: \n"
    format1: .asciz "\nThe length in feet is %d and %d inches\n"
    input1: .asciz "%d"
    num1: .word 0
