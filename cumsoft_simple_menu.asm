;; // CUMSOFT BOI //


section .data
    menuPrompt db "Choose an option:", 0
    option1 db "1. Option 1", 0
    option2 db "2. Option 2", 0
    option3 db "3. Option 3", 0
    exitMsg db "Exiting program...", 0

section .text
    global _start

_start:
    mov ah, 09h         ; Function 09h: Display string
    mov dx, menuPrompt ; Display the menu prompt
    int 21h

menuLoop:
    mov ah, 09h         ; Function 09h: Display string
    mov dx, option1     ; Display option 1
    int 21h

    mov ah, 09h         ; Function 09h: Display string
    mov dx, option2     ; Display option 2
    int 21h

    mov ah, 09h         ; Function 09h: Display string
    mov dx, option3     ; Display option 3
    int 21h

    mov ah, 01h         ; Function 01h: Read a character from standard input
    int 21h
    cmp al, '1'         ; Check user input
    je option1Selected
    cmp al, '2'
    je option2Selected
    cmp al, '3'
    je option3Selected

    jmp menuLoop        ; Invalid input, loop again

option1Selected:
    call Option1Function
    jmp menuLoop

option2Selected:
    call Option2Function
    jmp menuLoop

option3Selected:
    call Option3Function
    jmp menuLoop

Option1Function:
    ; Code to perform the action for Option 1
    ; Add your code here
    ret

Option2Function:
    ; Code to perform the action for Option 2
    ; Add your code here
    ret

Option3Function:
    ; Code to perform the action for Option 3
    ; Add your code here
    ret

exit:
    mov ah, 09h         ; Function 09h: Display string
    mov dx, exitMsg     ; Display exit message
    int 21h

    mov ah, 4Ch         ; Function 4Ch: Terminate program
    int 21h