import os
import sys

def setup():
    file = open(os.path.expanduser(f"~/codes/setup_show_nooptions.tcl"), "r")
    lines = file.readlines()
    file.close()
    file = open(os.path.expanduser(f"~/codes/setup_show_nooptions.tcl"), "w")
    lines[4] = f'set top "{sys.argv[1]}"\n' 
    lines[5] = f'set folder "{sys.argv[2]}"\n' 
    file.writelines(lines)
    file.close()
