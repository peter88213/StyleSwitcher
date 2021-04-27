REM Prepare a newly compiled version for commit

set _version=1.4.0

REM Delete the old version ...
del ..\*.oxt
del ..\*.xml

REM Put the new version to the official update location ...
move ..\oxt\*.oxt ..\
move ..\oxt\*.xml ..\

REM Copy the home page template and set the version
copy ..\docs\template\index.md ..\docs
python set_version.py %_version%

pause