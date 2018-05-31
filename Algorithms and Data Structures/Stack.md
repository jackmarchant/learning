# Stack

## What is a stack
A stack can be an array or linked list, where the order of items pushed onto or popped from the stack is important. 
They follow an implementation order such as LIFO (Last In First Out) or FIFO (First In First Out). 

## Using a LIFO stack
- When pushing on to the stack, a node can be added to the top of the stack
- When removing from the stack, the top node in the stack is removed, that is, the last one that was pushed. 
- The top of the stack represents the next node ready to be popped from the stack. 
- You can peek at the stack by retrieving the top node’s value, without popping it from the stack. 

## Backing stores
When implementing a stack, the store used for the nodes can be a linked list or an array. When using a linked list, only the number of nodes is allocated space, whereas when using an array, a fixed number can be used to determine the size of the array, even if some spaces are empty. 

## Postfix Calculator
Postfix calculation is where the order of operations follows the numbers in a token list. 
Typically, with infix you might have:
7 * 6 + 5 - 1 = 46
With Postfix, you would instead leave all of the operations to the end. 
5 6 7 * + 1 - = 46

A stack can be used to calculate using Postfix, for example if you move through the token list above:
1. 5 is pushed on to the stack
2. Followed by 6 and 7
3. * is identified as an operator, and the lhs and rhs are popped (6 and 7), multiplying both numbers and pushing the result on to the stack (42)
4. + is another operator, we pop two values from the stack again, (42 and 5) adding them together and pushing the result (47)
5. 1 is pushed on to the stack
6. The final - operator means we pop two more values from the stack and do (47 - 1)  resulting in 46 and pushing that on to the stack. 

## Undo actions
Implementing undo actions with a LIFO stack is fairly trivial as you can push values on to the stack as they happen. The values stored in the stack are the previous states of each action individually. 
Then, when you need to undo, you pop from the stack, applying the popped value. 