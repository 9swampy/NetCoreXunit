import os
import sys
import re
from subprocess import call

print ("Hello, Python!")

root_directory = os.getcwd()
print (root_directory)

regexp = re.compile(r'src[\/\\]NetCoreXunit.?$')
result = False
for child in os.walk(root_directory):
    print (child[0])
    if regexp.search(child[0]) is not None:
        print ("Matched")
        test_path = os.path.join(root_directory, child[0])
        if os.path.isdir(test_path):
            print ("IsDir")
            print (test_path)
            os.chdir(test_path)
            call (["dotnet", "test", "-xml", "output.xml"])
            if 'result="Fail"' in open("output.xml").read():
                print (test_path + ": Failed tests detected")
                result = True
            else:
                print (test_path + ": All tests passed")

os.chdir(root_directory)

if result:
    print ("Failed tests detected")
    sys.exit(1)

