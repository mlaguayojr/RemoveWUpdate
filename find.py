"""
Mario Luis Aguayo Jr.
(2015) mlaguayojr@gmail.com
This is intended to work with removewupdate.bat
python 2.7
"""

import sys, os

def main(args):
	if len(str(args).split(" "))==1:
		pkg = ""
		patch = str(args).strip().replace("[\'","").replace("\']","")
		with open("patches.log",'r') as f:
			for i in f:
				if str(patch) in i:
					pkg = str(i[:i.index("|")]).strip().replace("\n","")
					break
				else:
					pkg = "not found"

		f.close()
		print pkg
		f = open('status.log','w')
		f.write(pkg)
		f.close()
	else:
		print "find.exe KB#######"
		print "\nThis will remove windows update KB####### from the computer"

if __name__ == '__main__':
	main(sys.argv[1:])
