@echo on
echo "Checking for updated server files."
git fetch
git pull

echo "Starting launcher. Enjoy our adventures in Tarkov! :)"
@echo off
start "" SPT.Launcher.exe