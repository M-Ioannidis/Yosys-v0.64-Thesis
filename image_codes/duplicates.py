import os
import sys
import re
def find_same_size_files(folder_path):
    # Get full paths of files only (ignore directories)
    files = [
        os.path.join(folder_path, f)
        for f in os.listdir(folder_path)
        if os.path.isfile(os.path.join(folder_path, f))
    ]

    # Sort files for consistent comparison order
    

    def natural_key(s):
        return [
            int(text) if text.isdigit() else text.lower()
            for text in re.split(r'(\d+)', s)
        ]

    files.sort(key=lambda f: natural_key(os.path.basename(f)))
    #print(f"Files found: {files}")
    same_size_files = []

    i = 0
    current_file = files[i]
    current_size = os.path.getsize(current_file)
    while i < len(files) - 1:
        next_file = files[i + 1]
        next_size = os.path.getsize(next_file)
        #print(f"Comparing: (size: {current_size}) (size: {next_size})")
        if current_size == next_size or next_size == 0:
            same_size_files.append(next_file)
        else:
            # Move to next comparison base
            current_file = next_file
            current_size = next_size

        i += 1

    return same_size_files


if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: python script.py <folder_path>")
        sys.exit(1)

    folder = sys.argv[1]

    result = find_same_size_files(folder)
    for i in result:
        os.remove(i)

    #print("Files with same size as their next neighbor:")
    #for f in result:
    #    print(f)
