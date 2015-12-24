::Mario Luis Aguayo, Jr.
::removewupdate.bat
::(2015) mlaguayojr@gmail.com
echo off
color 0f
cls
echo Finding System root
set t=%comspec%
echo Getting package name for patch %1
%t:~0,20%\dism.exe /online /get-packages /format:table | findstr /i /c:"%1" > patches.log
call "%cd%\find.exe" %1
for /f "delims=" %%i in ('type "%cd%\status.log"') do set output=%%i
if %output% neq "not found" (set pkg=%output% && goto remove) else (echo patch was %output% && exit)

:remove
echo Found package name for %1: %pkg%
echo Removing package
%t:~0,20%\dism.exe /Online /Remove-Package /PackageName:%pkg% /quiet /norestart
msg * "Please restart your computer."
exit
