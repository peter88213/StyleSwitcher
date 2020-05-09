'''
ult.py 

Unlink template from an ODT document (command line)
Extracts and modifies "meta.xml" removing the "meta.template" entry.

Syntax: ult.py <ODT file to modify>

Copyright (c) 2019, peter88213
For further information see https://github.com/peter88213/yW2OO
Published under the MIT License (https://opensource.org/licenses/mit-license.php)
'''
import sys
import re
import zipfile


if __name__ == '__main__':
    xmldoc = "meta.xml"
    odtdoc = sys.argv[1]
    try:
        with zipfile.ZipFile(odtdoc, 'r') as myzip:
            myzip.extract(xmldoc)
            myzip.close
        myTextFile = open(xmldoc, 'r', encoding='utf-8')
        str = myTextFile.read()
        myTextFile.close()
        if re.search('<meta:template.*/>', str) != None:
            result = re.split('<meta:template.*/>', str)
            myTextFile = open(xmldoc, 'w', encoding='utf-8')
            myTextFile.write(result[0] + result[1])
            myTextFile.close()
    except:
        print("Syntax: ult.py <ODT file to modify>")
