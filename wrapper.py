import numpy as np
import matplotlib.pyplot as plt
import random
import os

# data to plot
n = random.randint(4,10)

os.system('rm wrap.txt')

for i in range  (n):
   os.system('python Pipeline_3_stage.py')

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

#print (energy, op1, op2)

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
plt.show()
