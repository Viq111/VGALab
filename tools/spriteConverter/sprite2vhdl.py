# -*- coding:Utf-8 -*-
# x Package
prog_name = "myprog"
# version:
version = 1
# By Viq
# License: Creative Commons Attribution-ShareAlike 3.0 (CC BY-SA 3.0) 
# (http://creativecommons.org/licenses/by-sa/3.0/)

##############
### IMPORT ###
##############
import os, time
from PIL import Image

###############
### GLOBALS ###
###############

###############
### CLASSES ###
###############


###################
### DEFINITIONS ###
###################

def outputSprite(img_in, txt_out):
    "Output a sprite as VHDL"
    im = Image.open(img_in)
    out = open(txt_out, "w")
    temp = Image.new("RGB", (16, 16), "white")
    out.write("""library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Sprite is
    Port ( relativeX : in INTEGER;
           relativeY : in INTEGER;
		   drawIt : in STD_LOGIC;
		   RGB : out STD_LOGIC_VECTOR (0 to 2) );
end Sprite;

architecture Behavioral of Sprite is
begin
	-- Begin of sprite Code
""")
    out.write("\t-- From " + str(img_in) + "\n")
    out.write("\tRGB <= ")
    if im.size != (16, 16):
        raise IOError("Image must be 16x16")
    for x in range(16):
        for y in range(16):
            col = im.getpixel((x,y))
            # Get 1-bit color
            res = ""
            l = []
            for i in range(3):
                if col[i] < 128:
                    res += "0"
                    l.append(0)
                else:
                    res += "1"
                    l.append(255)
            temp.putpixel((x, y), tuple(l))
            if res != "000":
                out.write('\t"' + res + '"' + " when ((drawIt = '1') and (relativeX = " + str(x) + ") and (relativeY = " + str(y) + ')) else\n\t\t')
    out.write('\t"000";\n')
    out.write("\t-- End of Sprite Code\nend Behavioral;")
    temp.save("temp.png")

##################
###  __MAIN__  ###
##################

if __name__ == "__main__":
    print "> Welcome to " + str(prog_name) + " (r" + str(version) + ")"
    print "> By Viq (under CC BY-SA 3.0 license)"
    print "> Loading program ..."
    in_ = raw_input("Enter img path to encode:")
    out_ = "CharacterSprite.vhd"
    print "It will be written in " + out_
    outputSprite(in_,out_ )
