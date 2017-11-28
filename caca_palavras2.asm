; multi-segment executable file template.

data segment
    ; add your data here!
pulalinha       DB  13,10           
buffer db 7,?, 10 dup (0), 0, 0
size = $ - offset buffer  
CACA_PALAVRAS 	DB	"ASDFKASJFLKASJDFLKJASKRURIJDSLFJKLSAJKDSVMNMSDPFKVLSADFDSART"
				DB	"KSAOJFLKASJFLKASAJSDKFJSAEKFJKSADJFLKSAJFKLJSALKFJLKASJCFKAA"
				DB	"ASJDFKSADKFJSKAREJADSREWUUNJBKNBDKGFPTHHFKSJRKDAJDKSHHAASDBB"
				DB	"JDSAKFJESIURVMLNFSKTYRSIUOVNKLSDFGREUIFSLKGHROIGJFKSDNKLSUAA"
				DB	"RUQLIOEUROIQEWURIODSMSADFJKSAJVXCMJASDKFVSALKFJKLSADNFLKSDUU"
				DB	"ASKCFJKALSDJFLKASDJFLKSAJDFLKCJDKLFJSALTIFJLSDKAJKESASLKAHHC"
				DB	"RQWEIRUQWEISDFJHSADJFHSAUIFUIWSUERIUEWASDDJSATKLFJRDOKJFSSEE"
				DB	"ASDTFPOASIDFOPSAIDFOPAISDOPFIASOPFISAPODEIOPASDIFOPSAIFOOFHH"
				DB	"ASDFASDKFLSADKFLASKDFCLSAIDOFRIEJJVDFSAIOOSADIFOSDIOPFISDODD"
				DB	"ASPDFIASPOAFIPAOSDFIPACOMPUTADORFOPSADIFOPSDIFOPSDAOPFDSATAA"
				DB	"ASDFIEWOPRIEWOIREWOPQIROQWEIROPEWQIRIOWQEIOPRIWQORIWQEPOIREE"
				DB	"ASDFASDJRKASDJFKLASDJFLKDSAJFLKSDAJFAMLKCDJFLKCSADFDSKSLADEE"
				DB	"ASDFASDOISADFISOADIFASDFISAODIFOSADIFSPDPIFPOSADIFOPDSIISAAB"
				DB	"ASDOPFSADFINVNCXJDFSIFDSNFLSDAFUSADFUSDRIFUISADUFIODSAUISDDD"
				DB	"QWERUSIOWERUIOQWEURIOWEQUIRWEQUIORUQWOEIESNVDMSADFKLSJDALKBB"
				DB	"LSKDEPOWELNVMXNCFDSLKLSEYEFMDSHVAFDJNFSYFSSNFSDAYUEQSDSAAACC"
				DB	"ALSRKLASDKLCASDLIURIWEURIEWQURIOQEWURIOFDSSFJSADHFJKSDADDDDD"
				DB	"VXPMZXESUOMXZNCVMIEOIOPDSIFOSDIOFISDAOFIOSAOIFODSIFOSDAIODDD"
				DB	"QMIERUQIWERUIQWEURIOQWEURIQWUERIUQWEIRUQWIOERUIQWEURIEWUUQAA"
				DB	"IWERQUWIRUQWEIORUQIWOERUOIQWEUROIQWUEROIUQWOIAWRUIWSDVFSDHQQ"
computador      DB  "COMPUTADOR",0
mouse           DB  "MOUSE",0 
video           DB  "VIDEO",0
teclado         DB  "TECLADO",0
impressora      DB  "IMPRESSORA",0
scanner         DB  "SCANNER",0
palavra         DB  "",0				
ends

stack segment
    dw   128  dup(0)
ends

code segment
start:
; set segment registers:
    mov ax, data
    mov ds, ax
    mov es, ax

    ; add your code here
    
    
    
    
    
    mov dx, offset buffer
    mov ah, 0ah
    int 21h
         ;mov offset buffer, dx
         mov offset buffer, dx
         lea dx, pulalinha
         mov ah, 6
         int 21h
         lea si, buffer
         mov dx, [si]
         mov ah, 6
         int 21h  
    lea di, caca_palavras
    
andar:                      ;percorre caca_palavras
    cmp [di], 0 
    je fim
    mov dl, [di]
    mov ah, 02h
    int 21h
    inc di
    jmp comp
    loop andar

    
comp:                       ;compara com computador
        lea si, computador
comparacomputador:     
        mov cl, [si]
        cmp [di], cl
        jne mous           
                            ;acrescentar troca de cor aqui
                            add [di], 20h
                            mov dx, [di]  
                            mov ah, 6                     
                            int 21h                                     
        inc si
        inc di 
loop comparacomputador

mous:
        lea si, mouse
        add si, 4
comparamouse:
        mov cl,[si]
        cmp [di], cl
        jne vide
                            ;acrescentar troca de cor aqui
                            add [di], 20h
                            mov dx, [di]  
                            mov ah, 6                     
                            int 21h
        dec si
        inc di
loop comparamouse
                     
                     
                     
vide:
        lea si, video
        mov bp, di
comparavideo: 
        mov cl, [si]
        cmp [di], cl
        jne tecl
                            ;acrescentar troca de cor aqui
                            add [di], 20h
                            mov dx, [di]  
                            mov ah, 6                     
                            int 21h
        inc si
        add di, 60
loop comparavideo

tecl:   
        mov di, bp
        lea si, teclado
        mov bp, di
        add si, 6
comparateclado:
        mov cl, [si]
        cmp [di], cl
        jne impr
                            ;acrescentar troca de cor aqui
                            add [di],20h
                            mov dx, [di]  
                            mov ah, 6                     
                            int 21h
        dec si
        add di, 60
loop comparateclado


impr:   
        mov di, bp
        lea si, impressora
        mov bp, di
comparaimpressora:
        mov cl, [si]
        cmp [di], cl
        jne scan
                            ;acrescentar troca de cor aqui
                            add [di],20h
                            mov dx, [di]  
                            mov ah, 6                     
                            int 21h
        inc si
        add di, 61
loop comparaimpressora


scan:   
        mov di, bp
        lea si, scanner
        mov bp, di
        add si, 6
comparascanner:
        mov cl, [si]
        cmp [di], cl
        jne inter
                            ;acrescentar troca de cor aqui
                            add [di],20h
                            mov dx, [di]  
                            mov ah, 6                     
                            int 21h
        dec si
        add di, 61
loop comparascanner



buscaTamanho: ;valor vem em si
    push si
    ;lea si, palavra
    again:
    cmp [si],0
    inc si
    je again
    ret 




inter:
mov di, bp
jmp andar                                                                                        
    
fim:    
    loop fim
       
    
    ; output string at ds:dx
    
    ; wait for any key....    
    mov ah, 1
    int 21h
    
    mov ax, 4c00h ; exit to operating system.
    int 21h    
ends

end start ; set entry point and stop the assembler.
