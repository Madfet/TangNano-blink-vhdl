import sys

with open("src.tcl", "w") as source_files:
        if len(sys.argv) > 1:
            for i, arg in enumerate(sys.argv):
                if i != 0:
                    print(f"add_file [file normalize {arg}]", file=source_files)
        else:
            print("No Source file list !")
