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

	if(opcode== "ADD"):
		op3=ops[1][:-1]
		op1=ops[2][:-1]
		op2=ops[3]
		print op3, 
		print op1, 
		print op2
		Reg_File[op3]=Reg_File[op1]+Reg_File[op2]

	if(opcode== "SUBS"):
		op3=ops[1][:-1]
		op1=ops[2][:-1]
		op2=ops[3]
		print op3, 
		print op1, 
		print op2
		Reg_File[op3]=Reg_File[op1]-Reg_File[op2]

	# if(opcode== "LDR"):
	# 	Reg_File[op3]= data_memory[index]

	# if(opcode== "SDR"):
	# 	data_memory[index] = Reg_File[op1]

	# if(opcode== "MOV"):
	# 	Reg_File[op2] = Reg_File[op1]

	if(opcode== "AND"):
		op3=ops[1][:-1]
		op1=ops[2][:-1]
		op2=ops[3]
		print op3, 
		print op1, 
		print op2
		Reg_File[op3]=Reg_File[op1] & Reg_File[op2]

	if(opcode== "OR"):
		op3=ops[1][:-1]
		op1=ops[2][:-1]
		op2=ops[3]
		print op3, 
		print op1, 
		print op2
		Reg_File[op3]=Reg_File[op1] | Reg_File[op2]

	if(opcode== "XOR"):
		op3=ops[1][:-1]
		op1=ops[2][:-1]
		op2=ops[3]
		print op3, 
		print op1, 
		print op2
		Reg_File[op3]=Reg_File[op1] ^ Reg_File[op2]

	if(opcode== "CMP"):
		op1=ops[1][:-1]
		op2=ops[2]
		print op1, 
		print op2
		if(Reg_File[op1] < Reg_File[op2]):
			PSR["N"] = 1

	# if(opcode== "CMN"):
	# 	Reg_File[op3]=Reg_File[op1] | Reg_File[op2]


if __name__ == "__main__":
	ins_memory=[]
	data_memory = []
	PSR = {"C":0,"N":0,"V":0,"Z":0}
	Reg_File={"R0":0,"R1":2,"R2":4,"R3":8,"R4":0,"R5":9,"R6":9,"R7":0}
	print Reg_File
	print PSR
	mem_init("instructions.txt")
	print ins_memory
	program_counter = 0
	for i in ins_memory:
		IR=IF_stage(program_counter)
		program_counter= program_counter+1
		print program_counter
		ops=ID_stage(IR)
		EX_stage(ops)
		print Reg_File
		print PSR





