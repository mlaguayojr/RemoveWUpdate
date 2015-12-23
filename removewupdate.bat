::Mario Luis Aguayo, Jr.
::removewupdate.bat
::(2015) mlaguayojr@gmail.com
echo off
color 0f
cls
echo Scanning system for %1 patch
echo Finding System root
set t=%comspec%
echo Getting patch listing
%t:~0,20%\dism.exe /online /get-packages /format:table > "%cd%\patches.log"
echo Scanning for patch %1
call "%cd%\find.exe" %1
for /f "delims=" %%i in ('type "%cd%\status.log"') do set output=%%i
if %output% neq "not found" (set pkg=%output% && goto remove) else (echo %output%)

:remove
echo Found package name for %1: %pkg%
echo Removing package
%t:~0,20%\dism.exe /Online /Remove-Package /PackageName:%pkg% /quiet /norestart
msg * "Please restart your computer!"
exit
