section .data
    extern len_cheie, len_haystack
    offset dd 0

section .text
    global columnar_transposition

;; void columnar_transposition(int key[], char *haystack, char *ciphertext);
columnar_transposition:
    ;; DO NOT MODIFY
    push    ebp
    mov     ebp, esp
    pusha 

    mov edi, [ebp + 8]   ;key
    mov esi, [ebp + 12]  ;haystack
    mov ebx, [ebp + 16]  ;ciphertext
    ;; DO NOT MODIFY

    ;; TODO: Implment columnar_transposition
    ;; FREESTYLE STARTS HERE

mov ecx,0
key_iterration:
    ;;accesam elementul din sirul key
    mov edx,[edi + 4*ecx]
    mov dword [offset],edx
    text:
        mov eax,esi
        add eax,dword [offset]
        mov dl,byte [eax]
        ;;"construim" litera corespunzatoare si o mutam in ebx
        mov byte [ebx],dl
        ;;avansam pointerul
        inc ebx
        mov edx,dword [offset]
        add edx,dword [len_cheie]
        ;;parcurgem literele din len_cheie in len_cheie pana la final
        cmp edx,dword [len_haystack]
        jl next_letter
        inc ecx
        mov eax,dword [len_cheie]
        ;;trecem la urmatoarea cheie
        cmp ecx,eax
        jl key_iterration
        jge ending
    next_letter:
        mov dword[offset],edx
        jmp text

    
    ending:
    ;; FREESTYLE ENDS HERE
    ;; DO NOT MODIFY
    popa
    leave
    ret
    ;; DO NOT MODIFY2