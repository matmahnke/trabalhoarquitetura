; multi-segment executable file template.

data segment
    ; add your data here!
pulalinha       DB  13,10           
CACA_PALAVRAS 	DB	"AiDrKAcomputadorLvJAesuomIoDSLFJKLSAJKDSVMNMSDPFKVLSADFDSART"
				DB	"KSmoeFLKASJFLKASAiSDKFJSAedFJKSADJFLKSAJFKLJSALKFJLKASJCFKAA"
				DB	"ASJpFnSADKFJSKAREdADSREWUUaJBKNBDKGFPTHHFKSJRKDAJDKSHHAASDBB"
				DB	"JDSarFnESIURVMLNFeKTYRSIUOlnKLSDFGREUIFSLKGHROIGJFKSDNKLSUAA"
				DB	"RUQlIeEaROIQEWURIoDSMSADFJcSaJVXCMJASDKFvSALKFJKLSADNFLKSDUU"
				DB	"ASKcFJsAcSDJFLKASDJFLKSAJDeLKcJDKLFJSALTiFJLSDKAJKESASLKAHHC"
				DB	"RQWeIRUsWsISDFJHSADJFHSAUItUIWsUERIUEWASdDJSATKLFJRDOKJFSSEE"
				DB	"ASDtFPOAoIDFOPSAIDFOPAISDOPFIASOPFISAPODeIOPASDIFOPSAIFOOFHH"
				DB	"ASDFASDKFrSADKFLASKDFCLSAIDOFRIEJJVDFSAIoOSADIFOSDIOPFISDODD"
				DB	"ASPDFIASPOaFIPAOSDFIPAcomputadorFOPSADIFOPSDIFOPSDAOPFDSATAA"
				DB	"ASDFIEWOPRIEWOIREWOPQIROQWEIROPEWQIRiOWQEIOPRIWQORIWQEPOIREE"
				DB	"ASDFASDJRKASDJFKLASDJFLKDSAJFLKSDAJFAmLKCDJFLKCSADFDSKSLADEE"
				DB	"ASDFASDOISADFISOADIFASDFISAODIFOSADIFSpDPIFPOSADIFOPDSIISAAB"
				DB	"ASDOPFSADFINVNCXJDFSIFDSNFLSDAFUSADFUSDrIFUISADUFIODSAUISDDD"
				DB	"QWERUSIOWERUIOQWEURIOWEQUIRWEQUIORUQWOEIeSNVDMSADFKLSJDALKBB"
				DB	"LSKDEPOWELNVMXNCFDSLKLSEYEFMDSHVAFDJNFSYFsSNFSDAYUEQSDSAAACC"
				DB	"ALSRKLASDKLCASDLIURIWEURIEWQURIOQEWURIOFDSsFJSADHFJKSDADDDDD"
				DB	"VXPMZXesuomXZNCVMIEOIOPDSIFOSDIOFISDAOFIOSAoIFODSIFOSDAIODDD"
				DB	"QMIERUQIWERUIQWEURIOQWEURIQWUERIUQWEIRUQWIOErUIQWEURIEWUUQAA"
				DB	"IWERQUWIRUQWEIORUQIWOERUOIQWEUROIQWUEROIUQWOIaWRUIWSDVFSDHQQ",0
computador      DB  "computador",0
mouse           DB  "mouse",0 
video           DB  "video",0
teclado         DB  "teclado",0
impressora      DB  "impressora",0
scanner         DB  "scanner",0				
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
                            mov ax,0920h
                            mov bx, 0002h
                            mov dx, [di]
                            mov cx, 10 
                            mov ah, 02h                     
                            int 21h
                            int 10h                                     
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
                            mov ax,0920h
                            mov bx, 0002h
                            mov dx, [di]
                            mov cx, 10 
                            mov ah, 02h                     
                            int 21h
                            int 10h
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
                            ;mov ax,0920h
                            ;mov bx, 0002h
                            ;mov dx, dl
                            ;mov cx, 10 
                            ;mov ah, 02h                     
                            ;int 21h
                            ;int 10h
                            ;mov dl, [di]
                            mov dl, [di]
                            mov ah, 02h
                            int 21h
                            mov dl,offset pulalinha
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
                            ;mov ax,0920h
                            ;mov bx, 0002h
                            ;mov dx, dl
                            ;mov cx, 10 
                            ;mov ah, 02h                     
                            ;int 21h
                            ;int 10h
                            mov dl, [di]
                            mov ah, 02h
                            int 21h
                            mov dl,offset pulalinha
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
                            ;mov ax,0920h
                            ;mov bx, 0002h
                            ;mov dx, dl
                            ;mov cx, 10 
                            ;mov ah, 02h                     
                            ;int 21h
                            ;int 10h
                            mov dl, [di]
                            mov ah, 02h
                            int 21h
                            mov dl,offset pulalinha
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
                            ;mov ax,0920h
                            ;mov bx, 0002h
                            ;mov dx, dl
                            ;mov cx, 10 
                            ;mov ah, 02h                     
                            ;int 21h
                            ;int 10h
                            mov dl, [di]
                            mov ah, 02h
                            int 21h
                            mov dl,offset pulalinha
                            int 21h
        dec si
        add di, 61
loop comparascanner

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
