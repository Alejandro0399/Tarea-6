.text
main:
	addi $v0, $zero, 0	
	addi $t0, $zero, 8	
	jal fibonacci		
	j end			
	
fibonacci:
	
	addi $sp,$sp, -8	#Restamos 8 porque vamos a guardar dos valores
	sw $ra, 0($sp)	
	sw $t0, 4($sp)	
	slti $t1, $t0, 2	#Compara el registro con 2, y si el valor del registro es menor activa un bandera
	beq $t1, 1, base	#Si t0 es 1, salta al caso base
	sub $t0, $t0, 1	        #n-1
	jal fibonacci	
	sub $t0, $t0, 1	        #n-2, aunque aqui es 1 porque ya se le resto 1 anteriormente		
	jal fibonacci	
	j exit	
	
base:
	add $v0, $v0, $t0	#Suma en v0 todos los finales del caso base.
	j exit		
	
exit:			
	lw $ra, 0($sp)  #Sacar los valores de stack anteriormente guardados
	lw $t0, 4($sp)
	addi $sp, $sp, 8
	jr $ra			#Regresa a la ultima dirección guardada

end:	
