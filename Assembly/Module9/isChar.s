# Ava Fritz
# 07/27/2023
# This program verifies if a user input value is a character.
# It does this two ways: using logical variables, and not using logical variables.
# It returns "true" if the input is a character or "false" if not

.text
.global main
main:

    # Push the stack
    SUB sp, sp, #8
    STR lr, [sp, #0]
    STR r4, [sp, #4]

    # Prompt for and read input
    LDR r0, =prompt0
    BL printf
    LDR r0, =format0
    LDR r1, =value
    BL scanf

    # Store input
    LDR r0, =value
    LDR r0, [r0]

    # Check using logic
    #BL logicCheck
    MOV r0, #1

    # Put return value in r4 for safe keeping
    MOV r4, r0

    # Check using non-logic
    #BL noLogCheck
    MOV r0, #1
    
    # Put return value in r3 for safe keeping
    MOV r3, r0

    # Check if the sum is equal to 2
    ADD r0, r3, r4
    MOV r1, #2
    CMP r0, r1
    BEQ valid

    # Code block for not a char (sum less than 2)
    LDR r0, =notChar
    BL printf
    B EndIf

    # Code block for valid code
    valid:
    LDR r0, =char
    BL printf
    B EndIf

    EndIf:
    # Pop the stack
    LDR lr, [sp]
    LDR r4, [sp, #4]
    ADD sp, sp, #8

    
.data
    prompt0: .asciz "\nEnter input: "
    char: .asciz "\nThis is a char\n"
    notChar: .asciz "\nThis is not a char\n"
    format0: .asciz "%s"
    value: .word 0

# END main
