.text
.global main
main:
  # program dictionary:
  # r4 - loop counter
  # r5 - loop limit

  # push to stack
  SUB sp, sp, #12
  STR lr, [sp, #0]
  STR r4, [sp, #4]
  STR r5, [sp, #8]

  # initialize
  MOV r4, #0
  MOV r5, #5

  StartLoop:
    # Check the limit
    CMP r4, r5
    BGE EndLoop

    # Loop statement or block
    MOV r1, r4
    LDR r0, =done
    BL printf

    # Get the next value
    ADD r4, r4, #1
    B StartLoop

  EndLoop:

  # Pop from stack
  LDR lr, [sp, #0]
  LDR r4, [sp, #4]
  LDR r5, [sp, #8]
  ADD sp, sp, #12
  MOV pc, lr

.data
  prompt: .asciz "\n Enter a number: "
  done: .asciz "\n The loop index is: %d \n"
  input: .asciz "%d"
  number: .word 0
