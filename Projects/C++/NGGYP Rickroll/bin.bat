@echo off
echo compile c++ to bin/windows
g++ main.cpp -static-libgcc -static-libstdc++ -o bin/windows/nggyp.exe

echo.
echo Press any key to close . . .
pause > nul