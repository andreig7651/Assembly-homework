section .text
    global rotp

;; void rotp(char *ciphertext, char *plaintext, char *key, int len);
rotp:
    ;; DO NOT MODIFY
    push    ebp
    mov     ebp, esp
    pusha

    mov     edx, [ebp + 8]  ; ciphertext
    mov     esi, [ebp + 12] ; plaintext
    mov     edi, [ebp + 16] ; key
    mov     ecx, [ebp + 20] ; len
    ;; DO NOT MODIFY

    ;; TODO: Implment rotp
    ;; FREESTYLE STARTS HERE

;; ciphertext[i] = plain[i] ^ key[len - i - 1]

;;bucla ce merge de ecx ori
xor_string:
    
    ;;mutam lungimea initiala in eax
    mov eax, [ebp + 20]

    ;; mutam plain[i] in ebx
    mov ebx, [esi + ecx - 1]

    sub eax, ecx
    
    xor ebx, [edi + eax]

    ;;mutam rezultatul xor-ului in ciphertext
    mov byte [edx + ecx - 1],bl
    
    loop xor_string

    ;; FREESTYLE ENDS HERE
    ;; DO NOT MODIFY
    popa
    leave
    ret
    ;; DO NOT MODIFY