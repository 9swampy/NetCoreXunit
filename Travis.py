import os
import sys
import re
from subprocess import call

os.chdir(os.path.dirname(__file__))
root_directory = os.getcwd()
regexp = re.compile(r'src\\NetCoreXunit.?$')
result = False
for child in os.walk(root_directory):
    if regexp.search(child[0]) is not None:
        test_path = os.path.join(root_directory, child[0])
        if os.path.isdir(test_path):
            print (test_path)
            os.chdir(test_path)
            call (["dotnet", "test", "-xml", "output.xml"])
            if 'result="Fail"' in open("output.xml").read():
                print (test_path + ": Failed tests detected")
                result = True
            else:
                print (test_path + ": All tests passed")

os.chdir(os.path.dirname(__file__))

if result:
    print ("Failed tests detected")
    sys.exit(1)

