@echo on
cd /d %~dp0
powershell -ExecutionPolicy Bypass ./ketcindy-installer.ps1

pause
