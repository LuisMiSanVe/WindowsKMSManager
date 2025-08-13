@echo off
mode con: cols=45 lines=20
:menu
cls
echo =============================================
echo              WINDOWS KMS MANAGER
echo =============================================
echo 1. Register KMS and activate generic licence
echo 2. Delete KMS and licence data
echo 3. View KMS and licence info
echo 4. Exit
echo =============================================
set /p choice=Enter your choice (1-4): 
echo =============================================

if "%choice%"=="1" goto register
if "%choice%"=="2" goto delete
if "%choice%"=="3" goto info
if "%choice%"=="4" goto exit

echo Invalid choice, try again.
echo =============================================
pause
goto menu

:register
echo Programs command execution history:
echo =============================================
:: Install the generic KMS key for Windows 10/11 Pro (replace with the key of your Windows version)
echo Installing generic key...
slmgr /ipk W269N-WFGWX-YVC9B-4J6C9-T83GX
:: Set the KMS server (replace with your actual KMS server)
echo Setting up KMS server...
slmgr /skms kms.server.address
:: Attempt activation
echo Activating Windows...
slmgr /ato
:: Show activation status
echo Showing activation status...
slmgr /xpr
:: Show KMS info
echo Showing KMS info...
slmgr /dlv
echo =============================================
pause
goto menu

:delete
echo Programs command execution history:
echo =============================================
:: Clears KMS data
echo Clearing KMS data...
slmgr /ckms
:: Clears key data
echo Clearing key and licence data...
slmgr /upk
slmgr /cpky
:: Show activation status
echo Showing activation status...
slmgr /xpr
:: Show KMS info
echo Showing KMS info...
slmgr /dlv
echo =============================================
pause
goto menu

:info
echo Programs command execution history:
echo =============================================
:: Show activation status
echo Showing activation status...
slmgr /xpr
:: Show KMS info
echo Showing KMS info...
slmgr /dlv
echo =============================================
pause
goto menu

:exit
echo Goodbye!
echo =============================================
pause
exit
