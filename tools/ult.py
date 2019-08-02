'''

ult.py 

@summary: Unlink template from an ODT document (command line)
Extracts and modifies "meta.xml" removing the "meta.template" entry.

Syntax: ult.py <ODT file to modify>

@author: Peter Triesberger
@see: https://github.com/peter88213/OOLoadStyles
@version: v0.0.1
@license: The MIT License (https://opensource.org/licenses/mit-license.php)
@copyright: (c) 2019, Peter Triesberger
@since: 2019-06-23

'''
import sys, re, zipfile


    
if __name__ == '__main__':
    xmldoc ="meta.xml"
    odtdoc = sys.argv[1]
    try:
        with zipfile.ZipFile(odtdoc,'r') as myzip:
            myzip.extract(xmldoc)
            myzip.close
        myTextFile = open(xmldoc,'r',encoding = 'utf-8')
        str = myTextFile.read()
        myTextFile.close()
        if re.search('<meta:template.*/>', str) != None:
            result = re.split('<meta:template.*/>', str)
            myTextFile = open(xmldoc,'w',encoding = 'utf-8')
            myTextFile.write(result[0]+ result[1])
            myTextFile.close()
    except:
        print("Syntax: ult.py <ODT file to modify>")
    