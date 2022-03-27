.global F2C
.global C2F
.global Ft2Inches
.global Inches2Ft
.global Miles2KM
.global KPH

.text
F2C:
    # push stack
    SUB sp, sp, #4
    STR lr, [sp]

    # Convert fahrenheit to celsius
    # r0 = (r0-32)*5/9
    MOV r1, #-32
    ADD r0, r0, r1
    MOV r1, #5
    MUL r0, r0, r1
    MOV r1, #9
    BL __aeabi_idiv

    # garbage code
    add r3, r3, r3
    
    # pop stack
    LDR lr, [sp]
    ADD sp, sp, #4
    MOV pc, lr

.data

# END F2C

.text
C2F:
    # push stack
    SUB sp, sp, #4
    STR lr, [sp]

    # Convert celsius to fahrenheit
    MOV r1, #9
    MUL r0, r0, r1
    
    # store 5 in r1, divide r0 by r1, and store result in r0
    MOV r1, #5
    BL __aeabi_idiv

    # store 32 in r1, add r0 and r1, and store result in r0
    MOV r1, #32
    ADD r0, r0, r1

    # pop stack
    LDR lr, [sp]
    ADD sp, sp, #4
    MOV pc, lr

.data

# END C2F
.text

Ft2Inches:
    # push stack
    SUB sp, sp, #4
    STR lr, [sp]

    #Convert feet to inches
    MOV r1, #12
    MUL r0, r0, r1
    MOV r4, r0

    # Calculate the remainder
    MUL r0, r1, r4
    SUB r3, r3, r0 
    
    # pop stack
    LDR lr, [sp]
    ADD sp, sp, #4
    MOV pc, lr

.data

# END Ft2Inches

.text
Inches2Ft:
    # push stack
    SUB sp, sp, #4
    STR lr, [sp]

    # Convert inches to feet
    MOV r1, #12
    BL __aeabi_idiv
    MOV r4, r0

    # Pop stack
    LDR lr, [sp]
    ADD sp, sp, #4
    MOV pc, lr

.data

# END Inches2Ft

.text
Miles2KM:
    # push stack
    SUB sp, sp, #4
    STR lr, [sp]

    # Convert miles to kilometers by multiplying by 16, then dividing by 10
    # Multiplying by 16 then dividing by 10 maintains the precision
    MOV r1, #16
    MUL r0, r0, r1
    MOV r1, #10
    BL __aeabi_idiv

    # Pop stack
    LDR lr, [sp]
    ADD sp, sp, #4
    MOV pc, lr
    

.data

# END Mile2KM

.text
KPH:
    # push stack variables
    SUB sp, sp, #4
    STR lr, [sp]

    # Convert kilometers to miles
    MOV r4, r0
    MOV r0, r1
    BL Miles2KM

    # Convert kilometers to kilometers per hour by dividing km by h
    MOV r1, r4
    BL __aeabi_idiv

    # Pop stack
    LDR lr, [sp]
    ADD sp, sp, #4
    MOV pc, lr

.data

# END KPH
