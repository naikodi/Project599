import numpy as np
import matplotlib.pyplot as plt
import random
import os
import time

# data to plot
n = random.randint(5,10)

exe_time1 =[]
exe_time2 =[]
exe_time3 =[]
exe_time4 =[]

os.system('rm wrap.txt')
os.system('rm mult.txt')

for i in range  (n):
   start=time.time()
   os.system('python Pipeline_3_stage.py 0 appx mem')
   end=time.time()
   exe_time1.append(int(end-start))
   
   start=time.time()
   os.system('python Pipeline_3_stage.py 1 appx mem') 
   end=time.time()
   exe_time2.append(int(end-start))
   
start=time.time()
os.system('python Pipeline_3_stage.py 0 original mult')
end=time.time()
exe_time3.append(int(end-start)) 

start=time.time()
os.system('python Pipeline_3_stage.py 1 original mult') 
end=time.time()
exe_time4.append(int(end-start))

start=time.time()
os.system('python Pipeline_3_stage.py 0 subword mult')
end=time.time()
exe_time3.append(int(end-start)) 

start=time.time()
os.system('python Pipeline_3_stage.py 1 subword mult') 
end=time.time()
exe_time4.append(int(end-start))

start=time.time()
os.system('python Pipeline_3_stage.py 0 appx mult')
end=time.time()
exe_time3.append(int(end-start)) 

start=time.time()
os.system('python Pipeline_3_stage.py 1 appx mult') 
end=time.time()
exe_time4.append(int(end-start))

data=[]
energy=[]
op1=[]
op2=[]

f1=open("wrap.txt","r+")
for line in f1:
   data=line.split(',')
   energy.append(int(data[0]))
   op1.append(int(data[1]))
   op2.append(int(data[2][:-1]))
   
f1.close()

energy.sort()
op1.sort()
op2.sort()
exe_time1.sort()
exe_time2.sort()
exe_time3.sort()
exe_time4.sort()

# create plot
fig, ax = plt.subplots()
index = np.arange(n)
bar_width = 0.35
opacity = 0.8

rects1 = plt.bar(index, op1, bar_width,
alpha=opacity,
color='b',
label='OP1')

rects2 = plt.bar(index + bar_width, op2, bar_width,
alpha=opacity,
color='g',
label='OP2')

plt.ylabel('No. of Instructions Executed')
plt.xlabel('Energy Available')
plt.title('Instructions executed with limited energy')
plt.xticks(index + bar_width, energy)
plt.legend()

plt.tight_layout()
#plt.show()

# create plot
fig, ax = plt.subplots()
index = np.arange(n)
bar_width = 0.35
opacity = 0.8

rects1 = plt.bar(index, exe_time1, bar_width,
alpha=opacity,
color='y',
label='Exec Time OP1')

rects2 = plt.bar(index + bar_width, exe_time2, bar_width,
alpha=opacity,
color='r',
label='Exec Time OP2')

plt.ylabel('Execution Time (in seconds)')
plt.xlabel('Energy Available')
plt.title('Instructions executed with limited energy')
plt.xticks(index + bar_width, energy)
plt.legend()

plt.tight_layout()

# create plot
fig, ax = plt.subplots()
index = np.arange(3)
bar_width = 0.35
opacity = 0.8

rects1 = plt.bar(index, exe_time3, bar_width,
alpha=opacity,
color='b',
label='Exec Time OP1')

rects2 = plt.bar(index + bar_width, exe_time4, bar_width,
alpha=opacity,
color='g',
label='Exec Time OP2')

plt.ylabel('Execution Time (in seconds)')
plt.xlabel('Multiplier Used')
plt.title('Instructions executed with limited energy')
plt.xticks(index + bar_width, ['original','subword','appx'])
plt.legend()

plt.tight_layout()

data1=[]
op3=[]
op4=[]

f2=open("mult.txt","r+")
for line in f2:
   data1=line.split(',')
   op3.append(int(data[1]))
   op4.append(int(data[2][:-1]))
   
f2.close()

op3.sort()
op4.sort()

# create plot
fig, ax = plt.subplots()
index = np.arange(3)
bar_width = 0.35
opacity = 0.8

rects1 = plt.bar(index, op3, bar_width,
alpha=opacity,
color='y',
label='OP1')

rects2 = plt.bar(index + bar_width, op4, bar_width,
alpha=opacity,
color='r',
label='OP2')

plt.ylabel('No of Instructions Executed')
plt.xlabel('Multiplier Used')
plt.title('Instructions executed with limited energy')
plt.xticks(index + bar_width, ['original','subword','appx'])
plt.legend()

plt.tight_layout()

plt.show()
