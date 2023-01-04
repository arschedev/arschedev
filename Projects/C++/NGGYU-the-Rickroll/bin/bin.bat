@echo off
echo compile c++ to windows/
g++ ../main.cpp -static-libgcc -static-libstdc++ -o ./windows/nggyu.exe

echo.
echo Press any key to close . . .
pause > nul