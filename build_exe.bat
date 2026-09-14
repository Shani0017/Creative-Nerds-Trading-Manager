@echo off
pip install -r requirements.txt
pip install pyinstaller
REM Apostrophe deliberately dropped from the --name/exe filename (not the
REM in-app title, which keeps it) -- PyInstaller auto-generates a .spec
REM file that wraps this value in single quotes without escaping, so an
REM apostrophe here breaks the spec with a syntax error before the build
REM ever runs.
pyinstaller --onefile --windowed --name "Creative Nerds Trading Manager" --icon "assets\icon.ico" --collect-data customtkinter --collect-data matplotlib --add-data "assets;assets" --exclude-module PyQt5 --exclude-module PyQt6 --exclude-module PySide2 --exclude-module PySide6 --exclude-module pandas --exclude-module scipy --exclude-module torch --exclude-module tensorflow --exclude-module IPython --exclude-module notebook main.py
echo.
echo Build complete. Find the app at "dist\Creative Nerds Trading Manager.exe"
pause
