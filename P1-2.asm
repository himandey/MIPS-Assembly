#     S o r t
#
#
# This routine sorts the values of a 100 element array.

# Odd numbers in ascending order, followed by even numbers in

# descending order.
#
# Using a different sort method without the utilization of while loops.
#
# 18 January 2012                               <Himanshu Pandey>

.data
Array:  .alloc 100

.text

Sort:   addi $1, $0, Array  # point to array base
        swi 542             # generate random numbers

                            # program starts here  

        addi $2, $1, 400    # Index Limit

        addi $3, $0, 2      # numero 2
        addi $22, $0, 1     # numero 1

        addi $28, $1, 800   # start even
        addi $6, $1, 800    # even index

        addi $29, $1, 400   # start odd 
        addi $27, $1, 400   # odd index
        

Loop:   slt  $4, $1, $2     # Check if even or odd

        beq  $4, $0, OSort

        lw   $7, 0($1)

        addi $1, $1, 4

        div  $7, $3

        mfhi $21

        beq  $21, $0, Eve

        bne  $21, $0, Odd


Eve:    sw   $7, 0($6)      # number is in even array
        
        addi $6, $6, 4

        j Loop


Odd:    sw   $7, 0($27)     # number is in odd array

        addi $27, $27, 4

        j Loop


Osort:  addi $9, $29, 4     # odd Sortascending


Loop1:  beq  $9, $27, ESort

        addi $24, $9, 0

Loop2:  sub  $12, $24, $29

        beq  $12, $0, Fino

        lw   $13, -4($24)

        lw   $14, 0($24)

        sub  $15, $14, $13


        slti $23, $15, 1

        beq  $23, $0, Fino

        sw   $13, 0($24)

        sw   $14, -4($24)

        addi $24, $24, -4

        j Loop2


Fino:    addi $9, $9, 4

        j Loop1


Esort:  addi $16, $28, 4     # even sort descending

Loopa:  slt  $10, $16, $6

        beq  $10, $0, Arrs

        addi $24, $16, 0


Loopb:  sub  $12, $24, $28

        beq  $12, $0, Fine

        lw   $13, 0($24)

        lw   $14, -4($24)

        sub  $15, $14, $13


        slti $23, $15, 1

        beq  $23, $0, Fine

        sw   $13, -4($24)

        sw   $14, 0($24)

        addi $24, $24, -4

        j Loopa


Fine:   addi $16, $16, 4

        j Loopb

Arrs:   addi $17, $29, 400    # Start evens at end of odds

        addi $18, $28, 0


Loopy:  slt  $19, $9, $17

        beq  $19, $0, End

        lw   $20, 0($18)

        sw   $20, 0($9)

        addi $9,  $9, 4

        addi $18, $18, 4

        j Loopy


End:    j Swap


Swap:   addi $1, $1, -400  

  
Loopz:  beq  $1, $29, Dend

        lw   $13, 400($1)

        sw   $13    0($1)

        addi $1, $1, 4

        j Loopz


Dend:   jr $31              # return to caller