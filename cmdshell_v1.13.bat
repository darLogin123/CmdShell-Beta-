@echo off
title CMD Shell v1.13
color 0a

:boot
cls
echo ===============================
echo   CMD SHELL  Version 1.13
echo ===============================
echo.
set /p cmd=cmdshell^> 

:: ===== 內建指令 =====
if "%cmd%"=="help" goto help
if "%cmd%"=="exit" exit
if "%cmd%"=="clear" cls & goto boot
if "%cmd%"=="ver" echo Version 1.13 & pause & goto boot
if "%cmd%"=="whoami" echo User: %username% & pause & goto boot

:: ===== 加強版 start（open）=====
if /i "%cmd:~0,4%"=="open" (
    start "" %cmd:~5%
    goto boot
)

:: ===== 原生 start 仍可用 =====
if /i "%cmd:~0,5%"=="start" (
    %cmd%
    goto boot
)

:: ===== color 指令 =====
if /i "%cmd:~0,5%"=="color" (
    %cmd%
    goto boot
)

:: ===== echo 指令 =====
if /i "%cmd:~0,4%"=="echo" (
    %cmd%
    pause
    goto boot
)

:: ===== 其他 CMD 指令 =====
%cmd%
pause
goto boot

:help
cls
echo ===== Commands =====
echo help        - show help
echo clear       - clear screen
echo ver         - show version
echo whoami     - show username
echo color XX    - change color
echo echo text   - print text
echo open app    - Start App, website
echo start app or website   - native CMD start
echo exit        - exit shell
echo ===================
pause
goto boot
