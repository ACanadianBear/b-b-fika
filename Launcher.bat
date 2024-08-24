@echo off
setlocal
:: "Backing up game configs"
set SPT_SETTINGS=./user/sptSettings
set TEMP_SPT_SETTINGS=./user/aptSettings/temp

set LAUNCHER_CONFIG=./user/launcher
set LAUNCHER_TEMP=./user/launcher/temp

if not exist "%TEMP_SPT_SETTINGS%" (
    mkdir "%TEMP_SPT_SETTINGS%"
)

if "%1"=="-preserve-launcher" (
    if not exist "%LAUNCHER_TEMP%" (
        mkdir "%LAUNCHER_TEMP%"
    )

    move /y "%LAUNCHER_CONFIG%" "%LAUNCHER_TEMP%"
)

move /y "%SPT_SETTINGS%" "%TEMP_SPT_SETTINGS%"

echo "Checking for updated server files."
git fetch

git pull

if "%1"=="-preserve-launcher" (

    move /y "%LAUNCHER_TEMP%" "%LAUNCHER_CONFIG%"
)

move /y "%TEMP_SPT_SETTINGS%" "%SPT_SETTINGS%"

RMDIR /s /q "$TEMP_SPT_SETTINGS%"
del /s /q "$LAUNCHER_TEMP%"

echo "Starting launcher. Enjoy our adventures in Tarkov! :)"

start "" SPT.Launcher.exe