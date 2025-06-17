.global _start
_start:
	SUB R0, R15, R15 	    @ R0 = 0

BUCLE:
    LDR R1, [R0, #100]  	@ Leer M[100] → R1
    CMP R1, #9          	@ Comparar R1 == 9
    BEQ UNO             	@ Si es IGUAL, ir a UNO
    CMP R1, #8          	@ Comparar R1 == 8
    BEQ DOS            	 	@ Si IGUAL, ir a DOS
    B BUCLE             	@ Si no es ni 9 ni 8, repetir

UNO:
    ADD R2, R0, #1        	@ R0 = 2
	STR R2, [R0, #100]      @ M[100] = R2
    B FIN

DOS:
    ADD R2, R0, #2        	@ R0 = 2
	STR R2, [R0, #100]      @ M[100] = R2
    B FIN

FIN:
	LDR R2, [R0, #100]      @ R2 = M[100]
    B FIN              		@ Bucle infinito al final