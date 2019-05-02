def mem_init(filename):
	f = open(filename,"r")

	for line in f.readlines():
		ins_memory.append(line)
	f.close()
	
def IF_stage(program_counter):
	print program_counter,
	IR= ins_memory[program_counter]
	print IR
	return IR

def ID_stage(IR):
	ops=IR.split()
	#print ops
	return ops

def EX_stage(ops,program_counter):
	opcode=ops[0]
	#print opcode

	if(opcode == "push"):
		op2 = ""
		for i in ops:
			if i!="push":
				op2 = op2 + i
		op11 = str(op2).strip('{}').split(',')
		for i in op11:
			stack.append(Reg_File[i])
		print "Stack: ",
		print stack

	if(opcode == "pop"):
		op2= ""
		for i in ops:
			if i!="pop":
				op2 = op2 + i
		op11 = str(op2).strip('{}').split(',')
		a= len(op11)
		for i in range(a):
			Reg_File[op11[a-i-1]]=stack.pop()
		print "Stack: ",
		print stack

	if(opcode == "lsl" or opcode == "asl"):
		op3=ops[1][:-1]
		op1=ops[2][:-1]
		op2=ops[3]
		a= Reg_File[op1]
		if(op2[0] == '#'):
			#print op3, 
			#print op1, 
			#print op2
			Reg_File[op3]= a << (int(op2[1])/4)

	if(opcode == "lsr"):
		op3=ops[1][:-1]
		op1=ops[2][:-1]
		op2=ops[3]
		a= Reg_File[op1]
		if(op2[0] == '#'):
			#print op3, 
			#print op1, 
			#print op2
			Reg_File[op3]= a >> (int(op2[1])/4)

	if(opcode == "asr"):
		op3=ops[1][:-1]
		op1=ops[2][:-1]
		op2=ops[3]
		a= Reg_File[op1] 
		#print op3, 
		#print op1, 
		#print op2
		Reg_File[op3]= a >> (int(op2[1]))
		if(Reg_File[op1]-(2**8) >= 0):
		   Reg_File[op3]+= (2**8)

	if(opcode == "ldmia"):
	   op3 = ops[1][:-1]
	   op11 = ops[2][1:-1]
	   op1 = op11[:2]
	   a=int(op1[1:]) 
	   op2 = op11 [3:] 
	   b=int(op2[1:])
	   c=Reg_File[op3]
	   #print op1,
	   #print op2,
	   #print op3
	   for i in range (a,b+1):
	      reg= 'r'+str(i)
	      Reg_File[reg] = data_memory [Reg_File[op3]]
	      c+= 1;

	if(opcode == "stm"):
	   op3 = ops[1][:-1]
	   op11 = ops[2][1:-1]
	   op1 = op11[:2]
	   a=int(op1[1:]) 
	   op2 = op11 [3:] 
	   b=int(op2[1:])
	   c=Reg_File[op3]
	   #print op1,
	   #print op2,
	   #print op3
	   for i in range (a,b+1):
	      reg= 'r'+str(i)
	      data_memory [Reg_File[op3]]= Reg_File[reg]
	      c+= 1;

	if(opcode== "add"):
		op3=ops[1][:-1]
		op1=ops[2][:-1]
		op2=ops[3]
		if(op2[0] == '#'):
			#print op3, 
			#print op1, 
			#print op2
			Reg_File[op3]=Reg_File[op1]+(int(op2[1]))
		else:
			#op2=ops[3]
			#print op3, 
			#print op1, 
			#print op2
			Reg_File[op3]=Reg_File[op1]+Reg_File[op2]

	if(opcode == "adc"):
		op3=ops[1][:-1]
		op1=ops[2][:-1]
		op2 = ops[3]
		#print op3, 
		#print op1, 
		#print op2
		Reg_File[op3]=Reg_File[op1]+Reg_File[op2]+PSR["C"]


	if(opcode== "sub"):
		op3=ops[1][:-1]
		op1=ops[2][:-1]
		op2 = ops[3]
		if(op2[0] == '#'):
			#print op3, 
			#print op1, 
			#print op2
			Reg_File[op3]=Reg_File[op1]-(int(op2[1:]))
		else:
			#print op3, 
			#print op1, 
			#print op2
			Reg_File[op3]=Reg_File[op1]-Reg_File[op2]

	if(opcode== "ldr"):
		op3 = ops[1][:-1]
		op11 = ops[2][:-1]
		op1 = op11[1:]#[fp The starting bracket is removed
		op2 = 0
		#print op1,
		if len(ops) == 4:
		   op21 = ops[3]
		   op22 = op21[1:]# #-48 The starting # is removed
		   op2 = op22 [:-1]  # #-48] Remove the last bracket
		   #print op2,
		#print op3
		Reg_File[op3] = data_memory [Reg_File[op1] + (int(op2)/4)] #Check after data mem initialization

	if(opcode== "sdr"):
		op3 = ops[1][:-1]
		op11 = ops[2][:-1]
		op21 = ops[3]
		op1 = op11[1:]#[fp The starting bracket is removed
		op22 = op21[1:]# #-48 The starting # is removed
		op2 = op22 [:-1]  # #-48] Remove the last bracket
		#print op1,
		#print op2,
		#print op3
		data_memory[Reg_File[op1] + (int(op2)/4)] = Reg_File[op3]

		
	if(opcode== "mov"):
		op3=ops[1][:-1]
		op1=ops[2]
		if(op1[0] == '#'):
			#print op3, 
			#print op1
			Reg_File[op3]=(int(op1[1]))
		else:
			#print op3, 
			#print op1
			Reg_File[op3]=Reg_File[op1]

	if(opcode == "bic"):
		op3=ops[1][:-1]
		op1=ops[2][:-1]
		op2=ops[3][1:]
		#print op3, 
		#print op1, 
		#print op2
		Reg_File[op3]=Reg_File[op1] & (2**8 -int(op2))

	if(opcode== "orr"):
		op3=ops[1][:-1]
		op1=ops[2][:-1]
		op2=ops[3][:-1]
		opx=ops[5][1:]
		#print op3, 
		#print op1, 
		#print op2
		Reg_File[op3]=Reg_File[op1] | (Reg_File[op2] >> (int(opx)/4))

	if(opcode== "eor"):
		op3=ops[1][:-1]
		op1=ops[2][:-1]
		op2 = ops[3]
		if(op2[0] == '#'):
			#print op3, 
			#print op1, 
			#print op2
			Reg_File[op3]=Reg_File[op1]^(int(op2[1]))
		else:
			#print op3, 
			#print op1, 
			#print op2
			Reg_File[op3]=Reg_File[op1]^Reg_File[op2]

	if(opcode== "cmp"):
		op1=ops[1][:-1]
		op2=ops[2]
		if(op2[0] == '#'):
			if(Reg_File[op1] < int(op2[1])):
				PSR["N"] = 1
			elif (Reg_File[op1] == int(op2[1])):
			   PSR["Z"] = 1
		else:
			if(Reg_File[op1] < Reg_File[op2]):
				PSR["N"] = 1
			elif (Reg_File[op1] == Reg_File[op2]):
			   PSR["Z"] = 1

	if(opcode== "mul"):
		op3=ops[1][:-1]
		op1=ops[2][:-1]
		op2=ops[3]
		if(op2[0] == '#'):
			#print op3, 
			#print op1, 
			#print op2
			Reg_File[op3]=Reg_File[op1]*(int(op2[1]))
		else:
			#print op3, 
			#print op1, 
			#print op2
			Reg_File[op3]=Reg_File[op1]*Reg_File[op2]
	
	if(opcode== "bx"):
		program_counter = Reg_File["lr"]
	
	if(opcode== "bl"):
		op1=ops[1]
		Reg_File["lr"] = program_counter
		program_counter = int(op1)
	
	if(opcode== "b"):
		op1=ops[1]
		program_counter = int(op1)
		
	if(opcode== "blt"):
		op1=ops[1]
		if (PSR["N"] == 1):
		   program_counter = int(op1)
		
	if(opcode== "bne"):
		op1=ops[1]
		if (PSR["Z"] != 1):
		   program_counter = int(op1)
		
	return program_counter		
	# if(opcode == "CMN"): //Not required
	# 	Reg_File[op3]=Reg_File[op1] | Reg_File[op2]


if __name__ == "__main__":
	ins_memory=[]
	data_memory= []
	for i in range (2**16):
	   data_memory.append(0)
	stack = []
	PSR = {"C":0,"N":0,"V":0,"Z":0}
	Reg_File={"r0":0,"r1":0,"r2":0,"r3":0,"r4":0,"r5":0,"r6":0,"r7":0,"r8":0,"r9":0,"r10":0,"fp":0, "lr":0, "sp":0}
	#print Reg_File
	#print PSR
	mem_init("input.txt")
	#print ins_memory
	program_counter = 801
	ins_count=0
	energy = 12334
	while(energy !=0 ):
		IR=IF_stage(program_counter)
		program_counter= program_counter+1
		#print program_counter
		ops=ID_stage(IR)
		program_counter=EX_stage(ops,program_counter)
		ins_count+=1
		energy-=1

print "-------------------------------------------------------------"
print "Execution Complete"
print "-------------------------------------------------------------"
print "Current PC:"
print program_counter
#print "-------------------------------------------------------------"
#print "Memory:"
#print data_memory
print "-------------------------------------------------------------"
print "Programme Status Register:"
print PSR
print "-------------------------------------------------------------"
print "Registers:"
print Reg_File
print "-------------------------------------------------------------"
print "Instruction Count:"
print ins_count
