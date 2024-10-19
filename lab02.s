
.data

array: .word 1, 0, 1, 12, 0, 1, 4

.text

    la a0, array
    li a1, 7    # unsigned
    li a2, 1
prog:
#-----------------------------

findLast_goBackwards:
    beq a1, zero, result0           #If array size is 0 return 0
    slli s0, a1, 2
    add s0, s0, a0                

#Doing this is multiplying the array by 4(2^2) and saving it in s0.

#Adding the starting address(a0) to s0 is giving us the adrress 
#of the last element of the array.


loop:
    addi s0, s0, -4         #Every element is now 4bytes away because array is double.
    lw t1, 0(s0)            #Load word at address s0 in t1
    beq t1, a2, done        #If t1 equals to the solution, finish
    bne s0, a0, loop        #If s0 is not equal to starting address, loop




result0:
    add  s0, zero, zero            #If address not found return 0

#-----------------------------
done:
    addi a7, zero, 10 
    ecall
