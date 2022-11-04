@echo off
echo compile c++ to bin/windows
g++ main.cpp -static-libgcc -static-libstdc++ -o bin/windows/QuadEqus.exe

echo.
echo Press any key to close . . .
pause > nul