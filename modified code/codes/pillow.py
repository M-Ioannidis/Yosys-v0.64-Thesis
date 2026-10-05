import os
import sys
import pandas as pd
import re
import numpy


folder_path = sys.argv[1]
files = [
        os.path.join(folder_path, f)
        for f in os.listdir(folder_path)
        if os.path.isfile(os.path.join(folder_path, f))
    ]
def cutting():
    for i in files:
        file = open(f"{i}", "r")
        lines = file.readlines()
        better = []
        
        for j, line in enumerate(lines):
            if "End of script." in line:         
                lines = lines[j+1:]
                
                for k in lines[1:]:
                    temp = re.sub(r'\s\s+', ' ', k)
                    temp = temp[1:]
                    better.append(temp)
                better[0] = 'Percent Calls ign Sec ign2 Pass\n' 
                file.close()
                file = open(f"{i}", "w")
                file.writelines(better)
                file.close()

def average():
    values = []
    for i in files:
        content = pd.read_csv(i, sep=r'\s+', engine='python')
        content = content.sort_values(by="Pass")
        for j in content['Pass']:
            values.append([])
        
        for j, k in zip(values, content['Sec']):
            j.append(float(k))
    for i, j in zip(content['Pass'], values):
        if numpy.average(j) == 0.0: continue
        count = sum([1 for x in j if x == 0.0])
        if count: count=f" zeroes: {count}" 
        else: count=""
        print(i+": "+str(f"{numpy.average(j):.9f}"+count))

if sys.argv[2] == "1":
    cutting()
else:
    average()
