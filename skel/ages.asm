; This is your structure
struc  my_date
    .day: resw 1
    .month: resw 1
    .year: resd 1
endstruc

section .text
    global ages

; void ages(int len, struct my_date* present, struct my_date* dates, int* all_ages);
ages:
    ;; DO NOT MODIFY
    push    ebp
    mov     ebp, esp
    pusha

    mov     edx, [ebp + 8]  ; len
    mov     esi, [ebp + 12] ; present
    mov     edi, [ebp + 16] ; dates
    mov     ecx, [ebp + 20] ; all_ages
    ;; DO NOT MODIFY

    ;; TODO: Implement ages
    ;; FREESTYLE STARTS HERE
    
age_calculator:
    dec edx
    mov ebx,[esi + my_date.year]
    mov eax,[edi + my_date_size * edx + my_date.year]
    cmp ebx,eax
    ;;verificam diferenta anilor salvati in registrii
    jl year_0_age
    sub ebx,eax
    mov eax,[esi + my_date.month]
    ;;comparam lunile(doar 2 octeti),apoi decidem in ce situatie ne aflam;
    cmp ax,[edi + my_date_size * edx + my_date.month]
    jg great_month
    jl less_month                
    je equal_month

;;daca anul dat este mai mic decat anul nasterii                    
year_0_age:
    mov word[ecx + 4*edx],0
    cmp edx,0
    je end
    jg age_calculator

;;daca luna data este mai mica decat cea de nastere
less_month:
    cmp ebx,0
    jle month_0_age
    dec ebx

;;punem valoarea in sir    
month_0_age:
    mov [ecx + 4 * edx],ebx
    cmp edx,0
    je end 
    jg age_calculator

;;daca luna data este mai mare decat cea de nastere
great_month:
    mov [ecx + 4 * edx],ebx
    cmp edx,0
    je end
    jg age_calculator                 

;;daca cele doua luni sunt egale    
equal_month:
    mov eax,[esi + my_date.day]
    ;;comparam zilele aici
    cmp ax,[edi + my_date_size * edx + my_date.day]           
    jl less_day
    jge great_day

;;daca ziua data este mai mica decat cea de nastere
less_day:
    cmp ebx,0
    jle day_0_age
    dec ebx

;;punem varsta actualizata in sir    
day_0_age:
    mov [ecx + 4 * edx],ebx
    cmp edx,0
    je end
    jg age_calculator

;;daca ziua data este mai mare sau egala decat cea data
great_day:
    mov [ecx + 4 * edx],ebx
    cmp edx,0
    je end
    jg age_calculator

;;daca am parcurs tot sirul de structuri,jump aici    
end:

    ;; FREESTYLE ENDS HERE
    ;; DO NOT MODIFY
    popa
    leave
    ret
    ;; DO NOT MODIFY
