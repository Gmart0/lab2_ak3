.global lab2
.syntax unified
#define A #6
#define B #2
#define C #2

lab2:
   push {lr}
   // calculate
   mov r0, A
   mov r1, B
   mov r2, C
   mov r3, A
   bl compare_func
   pop {pc}

above_zero:
   add r0, r0, r1
   sdiv r0, r0, r2
   b result

below_zero:
   sub r0, r0, r1
   sdiv r0, r0, r2
   b result

compare_func:
   push { r0, r1, r2, r3, lr }
   sub r3, r3, r1
   cmp r3, 0
   bge above_zero
   blt below_zero

result:
   pop { r0, r1, r2, r3, pc }
