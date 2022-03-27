# Ava Fritz
# 07/27/2023
# This program verifies if a user input value is a character.
# It does this two ways: using logical variables, and not using logical variables.
# It returns "true" if the input is a character or "false" if not

.text
.global main
main:

    # Push the stack
    SUB sp, sp, #4
    STR lr, [sp, #0]

    # Prompt for and read input
    LDR r0, =prompt0
    BL printf
    LDR r0, =format0
    LDR r1, =value
    BL scanf
    LDR r0, =value
    LDR r0, [r0]
    BL printf
    
    # Non logic check
    #MOV r1, r0
    #LDR r0, =test1
    #BL printf

    # Load input again for logic check
    #LDR r0, =value
    #BL printf

    # Check using logic (Module 9 Lecture 2.2)
    MOV r1, r0
    MOV r2, #0
    CMP r1, #0x41
    ADDGE r2, #1 // if true, bit 0 is changed to 1

    MOV r3, #0
    CMP r1, #0x5A
    ADDLT r3, #1
    AND r2, r2, r3 // Results from first AND, if true r1 is uppercase

    MOV r0, #0
    CMP r1, #0x61
    ADDGE r0, #1

    MOV r3, #0
    CMP r1, #0x7A
    ADDLT r3, #1
    AND r3, r3, r0  // Results from second AND, if true r1 is lowercase
    ORR r2, r2, r3 // Results from OR, if true r1 is a character

    // If ORR statement is true, print char. Else, print notChar
    MOV r2, #1
    CMP r1, r2

    BEQ isChar

    # Invalid char
    LDR r0, =notChar
    BL printf
    B EndIf

    isChar:
    LDR r0, =char
    BL printf
    B EndIf

    EndIf:

    # Pop the stack
    ADD sp, sp, #4
    MOV pc, lr

    
.data
    prompt0: .asciz "\nEnter input: "
    char: .asciz "\nThis is a char\n"
    notChar: .asciz "\nThis is not a char\n"
    test1: .asciz "\nThe results of non-logic test are: %s\n"
    test2: .asciz "\nThe results of logic test are:\n"
    format0: .asciz "%s"
    value: .space 128

# END main
