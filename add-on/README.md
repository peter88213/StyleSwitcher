# Unlink OTT templates from all ODT files in [userprofile]\Documents

## Please note:
This toolkit is experimental. **Use it at your own risk**. 
Do not use it, if you are not familiar with the Windows cmd language. 
Do not use it, in case you don't understand the batch code. 

## Function
* Do a recursive search for ODT files in your *[userprofile]\Documents* folder.
* Extract *meta.xml* from each ODT.file.
* Leave the ODT file untouched, if *meta.xml* contains no <meta:template .../> tag.
* Otherwise, Remove <meta:template .../> tag from *meta.xml*, and replace ODT file's *meta.xml*.

This will remove the ODT's links to any OTT (document template) file, leaving the document's styles as they are.

## Requirements
* Python 3 installation (PATH must be set).
* 7zip packer installation.

## Procedure
1. Back up your [userprofile]\Documents folder.
2. Run **gen_list.bat** to generate **OOult.bat**.
3. Edit **OOult.bat** and remove lines containing files you wish to omit.
4. Run **OOult.bat**.

 
