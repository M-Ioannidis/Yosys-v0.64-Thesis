import os
import sys

def proc():
    tmp = sys.argv[1].split(" ")
    mem = [x.replace(" ", "") for x in tmp if x != ""]
    print(" ".join(mem[2:]))

def setup():
    file = open(os.path.expanduser(f"~/codes/setup_show_nooptions.tcl"), "r")
    lines = file.readlines()
    file.close()
    file = open(os.path.expanduser(f"~/codes/setup_show_nooptions.tcl"), "w")
    lines[4] = f'set top "{sys.argv[1]}"\n' 
    lines[5] = f'set folder "{sys.argv[2]}"\n' 
    file.writelines(lines)
    file.close()

if sys.argv[-1] == "1":
    setup()
else:
    proc()
