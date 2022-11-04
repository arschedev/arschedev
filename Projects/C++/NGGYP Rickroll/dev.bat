@echo off

goto re

:run
echo . . . Compilation . . .
g++ main.cpp -o main.exe
echo . . . Done! . . .
echo . . . Press any key to run . . .
pause > nul
cls
main.exe
goto re

:re
title ctrl+c to abort
echo . . . Press any key to (re)compile . . .
pause > nul
cls
goto run