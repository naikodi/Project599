def mem_init(filename):
	f = open(filename,"r")

	for line in f.readlines():
		ins_memory.append(line)
	f.close()

def IF_stage(program_counter):
	print program_counter
	IR= ins_memory[program_counter]
	print IR
	return IR

def ID_stage(IR):
	ops=IR.split()
	print ops
	return ops

def EX_stage(ops):
	opcode=ops[0]
	print opcode

	if(opcode == "PUSH"):
		op2 = ""
		for i in ops:
			if i!="PUSH":
				op2 = op2 + i
		op11 = str(op2).strip('{}').split(',')
		for i in op11:
			stack.append(i)

	if(opcode == "POP"):
		op2= ""
		for i in ops:
			if i!="POP":
				op2 = op2 + i
		op11 = str(op2).strip('{}').split(',')
		for i in op11:
			stack.pop()
		#print stack

	if(opcode == "LSL" or opcode == "ASL"):
		op3=ops[1][:-1]
		op1=ops[2][:-1]
		op2=ops[3]
		if(op2[0] == '#'):
			print op3, 
			print op1, 
			print op2
			Reg_File[op3]=Reg_File[op1] << (int(op2[1]))

	if(opcode == "LSR"):
		op3=ops[1][:-1]
		op1=ops[2][:-1]
		op2=ops[3]
		if(op2[0] == '#'):
			print op3, 
			print op1, 
			print op2
			Reg_File[op3]=Reg_File[op1] >> (int(op2[1]))

	if(opcode == "ASR"):
		op3=ops[1][:-1]
		op1=ops[2][:-1]
		op2=ops[3]
		if(op2[0] == '#'):
			print op3, 
			print op1, 
			print op2
			#Reg_File[op3]=Reg_File[op1] (int(op2[1]))

	# if(opcode == "LDMIA" or opcode == "LDM"):

	# if(opcode == "STM"):
	# 	print "Hi"

	if(opcode== "ADD"):
		op3=ops[1][:-1]
		op1=ops[2][:-1]
		op2=ops[3]
		if(op2[0] == '#'):
			print op3, 
			print op1, 
			print op2
			Reg_File[op3]=Reg_File[op1]+(int(op2[1]))
		else:
			#op2=ops[3]
			print op3, 
			print op1, 
			print op2
			Reg_File[op3]=Reg_File[op1]+Reg_File[op2]

	if(opcode == "ADC"):
		op3=ops[1][:-1]
		op1=ops[2][:-1]
		op2 = ops[3]
		print op3, 
		print op1, 
		print op2
		Reg_File[op3]=Reg_File[op1]+Reg_File[op2]+PSR["C"]


	if(opcode== "SUB"):
		op3=ops[1][:-1]
		op1=ops[2][:-1]
		op2 = ops[3]
		if(op2[0] == '#'):
			print op3, 
			print op1, 
			print op2
			Reg_File[op3]=Reg_File[op1]-(int(op2[1]))
		else:
			print op3, 
			print op1, 
			print op2
			Reg_File[op3]=Reg_File[op1]-Reg_File[op2]

	if(opcode== "LDR"):
		op3 = ops[1][:-1]
		op11 = ops[2][:-1]
		op21 = ops[3]
		op1 = op11[1:]#[fp The starting bracket is removed
		op22 = op21[1:]# #-48 The starting # is removed
		op2 = op22 [:-1]  # #-48] Remove the last bracket
		print op1,
		print op2,
		print op3
		Reg_File[op3] = data_memory [Reg_File[op1] + int(op2/4)] 

	if(opcode== "SDR"):
		op3 = ops[1][:-1]
		op11 = ops[2][:-1]
		op21 = ops[3]
		op1 = op11[1:]#[fp The starting bracket is removed
		op22 = op21[1:]# #-48 The starting # is removed
		op2 = op22 [:-1]  # #-48] Remove the last bracket
		print op1,
		print op2,
		print op3
		data_memory[Reg_File[op1] + int(op2/4)] = Reg_File[op3]


		
	if(opcode== "MOV"):
		op3=ops[1][:-1]
		op1=ops[2]
		if(op1[0] == '#'):
			print op3, 
			print op1
			Reg_File[op3]=(int(op1[1]))
		else:
			print op3, 
			print op1
			Reg_File[op3]=Reg_File[op1]

	if(opcode== "AND" or opcode == "BIC"):
		op3=ops[1][:-1]
		op1=ops[2][:-1]
		op2=ops[3]
		print op3, 
		print op1, 
		print op2
		Reg_File[op3]=Reg_File[op1] & Reg_File[op2]

	if(opcode== "ORR"):
		op3=ops[1][:-1]
		op1=ops[2][:-1]
		op2=ops[3]
		print op3, 
		print op1, 
		print op2
		Reg_File[op3]=Reg_File[op1] | Reg_File[op2]

	if(opcode== "EOR"):
		op3=ops[1][:-1]
		op1=ops[2][:-1]
		op2 = ops[3]
		if(op2[0] == '#'):
			print op3, 
			print op1, 
			print op2
			Reg_File[op3]=Reg_File[op1]^(int(op2[1]))
		else:
			print op3, 
			print op1, 
			print op2
			Reg_File[op3]=Reg_File[op1]^Reg_File[op2]

	if(opcode== "CMP"):
		op1=ops[1][:-1]
		op2=ops[2]
		if(op2[0] == '#'):
			if(Reg_File[op1] < int(op2[1])):
				PSR["N"] = 1
		else:
			if(Reg_File[op1] < Reg_File[op2]):
				PSR["N"] = 1

	# if(opcode == "CMN"):
	# 	Reg_File[op3]=Reg_File[op1] | Reg_File[op2]


if __name__ == "__main__":
	ins_memory=[]
	data_memory = []
	stack = []
	PSR = {"C":0,"N":0,"V":0,"Z":0}
	Reg_File={"R0":0,"R1":2,"R2":4,"R3":8,"R4":0,"R5":9,"R6":9,"R7":0, "fp":0, "lr":0, "sp":0}
	#print Reg_File
	#print PSR
	mem_init("instructions.txt")
	#print ins_memory
	program_counter = 0
	for i in ins_memory:
		IR=IF_stage(program_counter)
		program_counter= program_counter+1
		#print program_counter
		ops=ID_stage(IR)
		EX_stage(ops)
		print Reg_File
		#print PSR





