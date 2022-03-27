#
# Program Name: mod8Q2.s
# Author: Ava Fritz
# Date: 07/23/2023
# Purpose: Calculates a temperature from celsius to fahrenheit
# Purpose: Calculates a measurement from inches to feet
# Inputs: 
# - input1: Temperature in celsius
# - input2: Measurement in inches
# Outputs:
# - format1: Converted temperature from C to F
# - format2: Converted measurement from inches to feet
#

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

# Convert celsius to fahrenheit
    BL C2F
    MOV r1, r0

# Print fahrenheit
    LDR r0, =format1
    BL printf

# Prompt for an input in inches
    LDR r0, =prompt2
    BL printf

# Scanf
    LDR r0, =input2
    SUB sp, sp, #4
    MOV r1, sp
    BL scanf
    LDR r0, [sp, #0]
    ADD sp, sp, #4

# Store total inches in r3 for remainder calc
    LDR r3, =input2
    LDR r3, [r3]

# Convert inches to feet
    BL Inches2Ft
    MOV r2, r3
    MOV r1, r4

# Print feet
    LDR r0, =format2
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
    prompt2: .asciz "Enter the length in inches you want in feet: \t"
    format2: .asciz "\nThe length in feet is %d and %d inches\n"
    input2: .asciz "%d"
    num2: .word 0
