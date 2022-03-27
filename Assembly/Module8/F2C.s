#F2C.s
#An assembly program to calculate fahrenheit to celsius

    .text
    .global main

main:
# Save return to os on stack
    sub sp, sp, #4
    str lr, [sp, #0]

#Prompt for an input in fahrenheit
    ldr r0, =prompt1
    bl printf

# Scanf
    ldr r0, =input1
    sub sp, sp, #4
    mov r1, sp
    bl scanf
    ldr r0, [sp, #0]
    add sp, sp, #4

# Convert
    bl F2C
    mov r1, r0

# Print celsius
    ldr r0, =format1
    bl printf

# Return to the OS
    ldr lr, [sp, #0]
    add sp, sp, #4
    mov pc, lr

.data
    prompt1: .asciz "Enter the temp in F that you want in C:\t"
    format1: .asciz "\nThe temp in C is %d\n"
    input1: .asciz "%d"
    num1: .word 0
