@echo off
REM
REM summary: Removes the OOLoadStyles software package.
REM 
REM author: Peter Triesberger
REM see: https://github.com/peter88213/OOLoadStyles
REM license: The MIT License (https://opensource.org/licenses/mit-license.php)
REM copyright: (c) 2019, Peter Triesberger
REM 
REM note: This script is to be executed manually.
REM 
REM precondition: OOLoadStyles is installed.
REM precondition: OpenOffice.org 3.x or Apache OpenOffice 4.x is installed.
REM postcondition: Previously auto-installed items of OOLoadStyles are removed.
REM postcondition: The templates remain, if user wants so.
REM 
REM since: 2019-06-25

set _release=0.4.3

set _OpenOffice4_w64=c:\Program Files (x86)\OpenOffice 4
set _OpenOffice4_w32=c:\Program Files\OpenOffice 4
set _OpenOffice3_w64=c:\Program Files (x86)\OpenOffice.org 3
set _OpenOffice3_w32=c:\Program Files\OpenOffice.org 3
set _LibreOffice6_w64=c:\Program Files (x86)\LibreOffice 6
set _LibreOffice6_w32=c:\Program Files\LibreOffice 6

set _OpenOffice4_Userprofile=AppData\Roaming\OpenOffice\4\user
set _OpenOffice3_Userprofile=AppData\Roaming\OpenOffice.org\3\user
set _LibreOffice6_Userprofile=AppData\Roaming\LibreOffice\4\user

echo -----------------------------------------------------------------
echo # OOLoadStyles (OpenOffice style loader) v%_release%
echo Removing software package ...
echo -----------------------------------------------------------------
rem Detect Combination of Windows and Office 
if exist "%_OpenOffice4_w64%\program\swriter.exe" goto OpenOffice4-Win64
if exist "%_OpenOffice4_w32%\program\swriter.exe" goto OpenOffice4-Win32
if exist "%_OpenOffice3_w64%\program\swriter.exe" goto OpenOffice3-Win64
if exist "%_OpenOffice3_w32%\program\swriter.exe" goto OpenOffice3-Win32
rem if exist "%_LibreOffice6_w64%\program\swriter.exe" goto LibreOffice6-Win64
rem if exist "%_LibreOffice6_w32%\program\swriter.exe" goto LibreOffice6-Win32
echo ERROR: No supported version of OpenOffice/LibreOffice found!
echo De-Installation aborted.
goto end

:OpenOffice4-Win64
set _writer=%_OpenOffice4_w64%
set _user=%USERPROFILE%\%_OpenOffice4_Userprofile%
set _ext=OOLoadStyles-A-%_release%.oxt
echo OpenOffice 4.x - Windows (64 bit)
goto settings_done

:OpenOffice4-Win32
set _writer=%_OpenOffice4_w32%
set _user=%USERPROFILE%\%_OpenOffice4_Userprofile%
set _ext=OOLoadStyles-A-%_release%.oxt
echo OpenOffice 4.x - Windows (32 bit)
goto settings_done

:OpenOffice3-Win64
set _writer=%_OpenOffice3_w64%
set _user=%USERPROFILE%\%_OpenOffice3_Userprofile%
set _ext=OOLoadStyles-%_release%.oxt
echo OpenOffice 3.x - Windows (64 bit)
goto settings_done

:OpenOffice3-Win32
set _writer=%_OpenOffice3_w32%
set _user=%USERPROFILE%\%_OpenOffice3_Userprofile%
set _ext=OOLoadStyles-%_release%.oxt
echo OpenOffice 3.x - Windows (32 bit)
goto settings_done

:LibreOffice6-Win64
set _writer=%_LibreOffice6_w64%
set _user=%USERPROFILE%\%_LibreOffice6_Userprofile%
set _ext="OOLoadStyles-L-"%_release%.oxt
echo LibreOffice 6.x - Windows (64 bit)
goto settings_done

:LibreOffice6-Win32
set _writer=%_LibreOffice6_w32%
set _user=%USERPROFILE%\%_LibreOffice6_Userprofile%
set _ext="OOLoadStyles-L-"%_release%.oxt
echo LibreOffice 6.x - Windows (32 bit)
goto settings_done

:settings_done

echo Removing OpenOffice extension %_ext% ...

"%_writer%\program\unopkg" remove -f %_ext%

echo Deleting template in %_user%\template (on confirmation only) ...

set _file="%_user%\template\Default.ott"
if exist %_file% del /p %_file%

set _file="%_user%\template\StandardPages.ott"
if exist %_file% del /p %_file%

set _file="%_user%\template\Printout.ott"
if exist %_file% del /p %_file%

echo -----------------------------------------------------------------
echo #
echo # OOLoadStyles v%_release% is removed from your PC.
echo #
echo -----------------------------------------------------------------
pause



:end