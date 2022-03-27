# Ava Fritz
# 07/27/2023
# This assignment asks for a student's name and grade.
# It returns the students name and converts the number grade to a letter.
# If the grade is invalid, it returns invalid.
# References Module 9 Lecture 2 and Module 9 Assigned Reading #1 (Ch 8)

.text
.global main
main:
    # Push the stack
    SUB sp, sp, #8
    STR lr, [sp, #0]
    STR r4, [sp, #4]

    # Prompt for and read name
    LDR r0, =prompt0
    BL printf
    LDR r0, =format0
    LDR r1, =name
    BL scanf
    LDR r0, =name
    BL printf

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
    LDR lr, [sp, #4]
    ADD sp, sp, #8
    MOV pc, lr

.data
    prompt0: .asciz "\nEnter a student's name: "
    format0: .asciz "%s"
    name: .space 128
    studentName: .asciz "\nStudent's name is: %s"
    prompt1: .asciz "\nEnter a grade between 0 and 100: "
    format1: .asciz "%d"
    grade: .word 0

# END Main

.text
printGrades:
    SUB sp, sp, #8
    STR lr, [sp]
    STR r4, [sp, #4]

    # Check if grade is greater than 0
    MOV r4, r0
    MOV r1, #0
    MOV r0, #0
    CMP r4, r0
    MOVGE r1, #1

    # Check if grade is less than 100
    MOV r2, #0
    MOV r0, #100
    CMP r4, r0
    MOVLE r2, #1

    # SUM results of comparisons and determine if grade is valid (between 0 and 100)
    AND r1, r1, r2
    MOV r2, #1
    CMP r1, r2
  
    # If grade is valid, move to grade A loop
    BEQ grade_A

    # Code block for invalid grade
    LDR r0, =error
    BL printf
    B EndIf

    # If the grade is less than 90, move to B. Else, print A
    grade_A:
    MOV r0, #90
    CMP r4, r0
    BLT grade_B

    # Code block for grade of A
    LDR r0, =grade_a
    BL printf
    B EndIf

    # If the grade is less than 80, move to C. Else, print B
    grade_B:
    MOV r0, #80
    CMP r4, r0
    BLT grade_C

    # Code block for grade of B
    LDR r0, =grade_b
    BL printf
    B EndIf

    # If the grade is less than 70, move to F. Else, print C
    grade_C:
    MOV r0, #70
    CMP r4, r0
    BLT Else

    # Code block for grade of C
    LDR r0, =grade_c
    BL printf
    B EndIf

    # Grade is valid and less than 70, print F
    Else:
    # Code block for grade of F
    LDR r0, =grade_f
    BL printf
    B EndIf

    EndIf:
    # Pop the stack
    LDR lr, [sp]
    LDR r4, [sp, #4]
    ADD sp, sp, #8

.data
    error: .asciz "\nGrade must be 0-100\n"
    grade_a: .asciz "\nGrade is A\n"
    grade_b: .asciz "\nGrade is B\n"
    grade_c: .asciz "\nGrade is C\n"
    grade_f: .asciz "\nGrade is F\n"
