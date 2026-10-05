Codes: All the verilog files for each category.

logs and images: All the logs, dumps, images and synthesized files to be viewed alongside the text in the thesis 

codes_images: Codes used in order to automate the process of generating the synthesis flows along with the images and dumps. They are not optimal and there's definitely a better way to handle this but I didn't have the time or will to optimize them.

modified code: By default a macro command in Yosys automatically calls every pass without any option to generate an image between every pass. In order to generate the images for each pass, each macro command that's called by the macro "synth_ice40" was modified and recompiled in order to support that. Every folder (apart from ice40 which is found in the "techlibs" folder) is found in the "passes" folder.
