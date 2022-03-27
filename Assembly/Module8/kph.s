#kph.s
# An assembly program to calculate kph

    .text
    .global main

main:
# Save return to os on stack
    SUB sp, sp, #4
    STR lr, [sp, #0]

# Prompt for an input in hours
    LDR r0, =prompt1
    BL printf

#Scanf
    LDR r0, =input1
    SUB sp, sp, #4
    MOV r1, sp
    BL scanf
    LDR r3, [sp, #0]
    ADD sp, sp, #4
    MOV r4, r3

# Prompt for an input in miles
    LDR r0, =prompt2
    BL printf

# Scanf

    LDR r0, =input2
    SUB sp, sp, #4
    MOV r1, sp
    BL scanf
    LDR r2, [sp, #0]
    ADD sp, sp, #4
    MOV r3, r2

# Convert
    MOV r0, r4
    MOV r1, r3
    BL KPH
    MOV r1, r0

# Print kph
    LDR r0, =format2
    BL printf

# Return to the OS
    LDR lr, [sp, #0]
    ADD sp, sp, #4
    MOV pc, lr

.data
    prompt1: .asciz "Enter the time in hours: \t"
    prompt2: .asciz "Enter the distance in miles: \t"
    input1: .asciz "%d"
    input2: .asciz "%d"
    num: .word 0
    format2: .asciz "\nThe speed in kph is: %d\n"
