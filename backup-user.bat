@echo off
SETLOCAL

:: === Configuration ===
set "SRC=C:\Users"
set "DST=E:\Backups\Users"
set "LOG=E:\Backups\backup_log.txt"

:: === Timestamp Header ===
echo ======================================== >> "%LOG%"
echo Backup started at %DATE% %TIME% >> "%LOG%"
echo ======================================== >> "%LOG%"

:: === Start Robocopy ===
robocopy "%SRC%" "%DST%" /E /Z /W:1 /R:1 /FFT /TEE /LOG+:"%LOG%" ^
 /XD "AppData\Local" "AppData\LocalLow" "AppData\Temp" ^
     "AppData\Roaming\Microsoft\Windows\Recent" ^
     "AppData\Roaming\Microsoft\Windows\Themes\CachedFiles" ^
     "AppData\Roaming\Adobe" ^
 /XF "NTUSER.DAT" "ntuser.dat.LOG1" "ntuser.dat.LOG2"

:: === Completion Message ===
echo ======================================== >> "%LOG%"
echo Backup finished at %DATE% %TIME% >> "%LOG%"
echo ======================================== >> "%LOG%"

echo Backup complete. See log file at: %LOG%
pause
ENDLOCAL
