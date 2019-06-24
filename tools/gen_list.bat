set _docroot="%userprofile%\Documents"
set _genfile=OOult.bat
pushd %_docroot%
for /F "tokens=*" %%l in ('dir *.odt /s /b') do echo call ult.bat "%%l" >> %_genfile%
popd
