.text
.global main
main:
    # Push the stack
    SUB sp, sp, #4
    STR lr, [sp, #0]

    # Prompt for and read grade
    LDR r0, =prompt1
    BL printf
    LDR r0, =format1
    LDR r1, =grade
    BL scanf

    # Calculate grade
    LDR r0, =grade
    LDR r0, [r0]
    BL printGrades

    # Pop the stack
    LDR lr, [sp, #0]
    ADD sp, sp, #4
    MOV pc, lr

.data
    prompt1: .asciz "\nEnter a grade between 0 and 100: "
    format1: .asciz "%d"
    grade: .word 0

# END Main

.text
printGrades:
    SUB sp, sp, #8
    STR lr, [sp]
    STR r4, [sp, #4]

    # Check if grade is less than 0 or greater than 100
    MOV r4, r0
    MOV r1, #0
    MOV r0, #0
    CMP r4, r0
    MOVGE r1, #1

    MOV r2, #0
    MOV r0, #100
    CMP r4, r0
    MOVLE r2, #1

    AND r1, r1, r2
    MOV r2, #1
    CMP r1, r2
    BEQ grade_A

    # Code block for invalid grade
    LDR r0, =error
    BL printf
    B EndIf

    grade_A:
    MOV r0, #90
    CMP r4, r0
    BLT grade_B

    # Code block for grade of A
    LDR r0, =grade_a
    BL printf
    B EndIf

    grade_B:
    MOV r0, #80
    CMP r4, r0
    BLT grade_C

    # Code block for grade of B
    LDR r0, =grade_b
    BL printf
    B EndIf

    grade_C:
    MOV r0, #70
    CMP r4, r0
    BLT Else

    # Code block for grade of C
    LDR r0, =grade_c
    BL printf
    B EndIf

    Else:
    # Code block for grade of F
    LDR r0, =grade_f
    BL printf
    B EndIf

    EndIf:

    LDR lr, [sp]
    LDR r4, [sp, #4]
    ADD sp, sp, #8

.data
    error: .asciz "\nGrade must be 0-100\n"
    grade_a: .asciz "\nGrade is A\n"
    grade_b: .asciz "\nGrade is B\n"
    grade_c: .asciz "\nGrade is C\n"
    grade_f: .asciz "\nGrade is F\n"
