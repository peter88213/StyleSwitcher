rem Generate a list of function calls for each ODT file within [userprofile]\Documents

set _docroot="%userprofile%\Documents"
set _genfile=OOult.bat
pushd %_docroot%
for /F "tokens=*" %%l in ('dir *.odt /s /b') do echo unlink_template.py "%%l" >> %_genfile%
popd
move /Y  %_docroot%\%_genfile% .