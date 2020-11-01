:: Sorry, i know this is easy coded. but i was just bored okay ::
@set /p servername=< bin/sname.txt
@set /p relshname=< bin/rname.txt

@echo off

:: Settings

title Relsh
mode 50,28
setlocal
@setlocal enableextensions enabledelayedexpansion
call :settext
chcp 65001 >NUL

for /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & echo on & for %%b in (1) do     rem"') do (
  set "DEL=%%a"
)

:start
:main

call :text 0c "Relsh - Checking for an available bot server."
echo.
ping localhost -n 1>nul
if exist "bin/server.dll" goto serveronline

goto servern

:servern
cls
call :text 0c "Relsh - Creating a server for %username%."
echo.
md bin
echo [Server] > bin/server.dll
echo Server1 > bin/sname.txt
echo Relsh > bin/rname.txt

echo.
start Relsh.bat
exit

:serverf
::finally
set offline=true

if exist "bin/serverhost.ini" set offline=false

if "%offline%"=="true" goto serveroffline
if "%offline%"=="false" goto serveronline
goto serverf

:serveroffline
title %relshname%
cls
echo Relsh - Offline
echo %ESC%[91m[OFFLINE]%ESC%[0m
echo.
echo %ESC%[91m[1] %ESC%[0mStart server%ESC%[0m
echo %ESC%[91m[2] %ESC%[0mHost server 24/7%ESC%[0m
echo %ESC%[91m[3] %ESC%[0mQuit%ESC%[0m
echo.
choice /N /C 12 /M ":"
goto serveroffline%errorlevel%

:serveroffline1
goto serveronline

:serveroffline2
echo [Server] > bin/serverhost.ini
echo Host=true >> bin/serverhost.ini
echo ``Do not delete, unless you want to stop hosting`` >> bin/serverhost.ini
goto serverf

:serveroffline3
exit


:serveronline
title %relshname% - %servername%
cls
echo Relsh - %servername%
:: echo %ESC%[92m[ONLINE]%ESC%[0m
echo %ESC%[92m[ONLINE]%ESC%[0m
echo.
echo %ESC%[91m[1] %ESC%[0mBegin Chatting%ESC%[0m
echo %ESC%[91m[2] %ESC%[0mRename Server%ESC%[0m
echo %ESC%[91m[3] %ESC%[0mRename Relsh%ESC%[0m
echo %ESC%[91m[4] %ESC%[0mQuit%ESC%[0m
echo %ESC%[91m[5] %ESC%[0mOthers%ESC%[0m
echo.
choice /N /C 12345 /M ":"
goto serverGOTO%errorlevel%

:serverGOTO5
cls
echo Relsh - Others
echo %ESC%[92m[ONLINE]%ESC%[0m
echo.
echo %ESC%[91m[1] %ESC%[0mBack%ESC%[0m
echo %ESC%[91m[2] %ESC%[0mSettings%ESC%[0m
echo %ESC%[91m[3] %ESC%[0mReset %relshname%%ESC%[0m
echo %ESC%[91m[4] %ESC%[0mTroubleshoot%ESC%[0m
choice /N /C 1234 /M ":"
goto others%errorlevel%

:others4
cls
echo [#####################]
echo Trying to Troubleshoot.
echo [#####################]
ping localhost -n 2 > nul
cls
echo [#########################]
echo        TroubleShooter
echo [#########################]
echo Please explain your problem
set /p troubleshootmsg=:
cls
echo [##############################]
echo          TroubleShooter
echo [##############################]
echo Okay, we will look later into it
ping localhost -n 3 > NUL
goto serveronline
:others3
cls
echo Are you sure to delete %ESC%[91m%relshname%'s%ESC%[0m data?%ESC%[0m
ECHO.
echo %ESC%[91m[1] %ESC%[0mYes%ESC%[0m
echo %ESC%[91m[2] %ESC%[0mNo%ESC%[0m
ECHO.
choice /N /C 12 /M ":"
goto resetgoto%errorlevel%

:others2
cls
echo Settings are not available in your country
pause
goto serveronline

:others1
goto serveronline


:resetgoto1
cls
echo %ESC%[91mDeleting %relshname%'s data, please wait%ESC%[0m
ping localhost -n 1 > nul
@RD /S /Q "./bin"
cls
echo Please restart Relsh.bat to continue
pause>nul
exit

:resetgoto2
goto serveronline


pause

:ern
cls
call :text 0c "ILLEGAL KEY"
echo.
ping localhost -n 2 > nul
goto serveronline



:serverGOTO1
:: this part is to let the loading only lag, not the chat (useful for slow pc's)
cls
echo [_________________]
echo   Loading Relsh.
ping localhost -n 1>nul
cls
echo [#________________]
echo   Loading Relsh.
ping localhost -n 1>nul
cls
echo [##_______________]
echo   Loading Relsh.
ping localhost -n 1>nul
cls
echo [###______________]
echo   Loading Relsh.
ping localhost -n 1>nul
cls
echo [######___________]
echo Reading Responses..
ping localhost -n 1>nul
cls
echo [##########_______]
echo Downloading Assets.
ping localhost -n 1>nul
cls
echo [###############__]
echo    Reading Data.
ping localhost -n 1>nul
cls
echo [#################]
echo      Finishing.
ping localhost -n 1>nul
goto chatServer



:chatServer
set /p serverRequestName=< bin/sname.txt
set /p RelshRequestName=< bin/rname.txt
cls
echo [Chat Started with %ESC%[92m%RelshRequestName%%ESC%[0mon %ESC%[92m%serverRequestName%%ESC%[0m]
call :text 0c "[Your chats will not be saved]"
echo.
echo.
if exist "bin/dontRepeat.dll" goto dontRepeatTrue
echo %ESC%[91m[ %RelshRequestName%]%ESC%[0m%ESC%[0m Hey %USERNAME%, how are you today? %ESC%[0m
set /p talk=%ESC%[91m[ %USERNAME% ]%ESC%[0m%ESC%[0m 
echo dontRepeat() > bin/dontRepeat.dll
echo %ESC%[91m[ %RelshRequestName%]%ESC%[0m%ESC%[0m hm, okay. you can ask me questions if y-ou want%ESC%[0m
goto gotoChattalk

:dontRepeatTrue
echo %ESC%[91m[ %RelshRequestName%]%ESC%[0m%ESC%[0m You can talk to me, if you want%ESC%[0m
goto gotoChattalk

:gotoChattalk
set /p talk=%ESC%[91m[ %USERNAME% ]%ESC%[0m%ESC%[0m 
echo %talk% > TALKAPI.txt
:: Return
>NUL find /i "date" TALKAPI.txt
set /a dateChoose=%random% %%5 +1
if %dateChoose%==1 if %errorlevel% EQU 0 (echo %ESC%[91m[ %RelshRequestName%]%ESC%[0m%ESC%[0m The current date is %date%%ESC%[0m) else (echo>NUL)
if %dateChoose%==2 if %errorlevel% EQU 0 (echo %ESC%[91m[ %RelshRequestName%]%ESC%[0m%ESC%[0m The date for you is %date%%ESC%[0m) else (echo>NUL)
if %dateChoose%==3 if %errorlevel% EQU 0 (echo %ESC%[91m[ %RelshRequestName%]%ESC%[0m%ESC%[0m For our both date is it %date%%ESC%[0m) else (echo>NUL)
if %dateChoose%==4 if %errorlevel% EQU 0 (echo %ESC%[91m[ %RelshRequestName%]%ESC%[0m%ESC%[0m %date%%ESC%[0m) else (echo>NUL)
if %dateChoose%==5 if %errorlevel% EQU 0 (echo %ESC%[91m[ %RelshRequestName%]%ESC%[0m%ESC%[0m date is %date%%ESC%[0m) else (echo>NUL)
>NUL find /i "send" TALKAPI.txt
set /a sendChoose=%random% %%4 +1
if %sendChoose%==1 if %errorlevel% EQU 0 (echo %ESC%[91m[ %RelshRequestName%]%ESC%[0m%ESC%[0m I cant send anything via a batch file. Sorry, but you can say "Download" so i can download things for you %ESC%[0m) else (echo>NUL)
if %sendChoose%==2 if %errorlevel% EQU 0 (echo %ESC%[91m[ %RelshRequestName%]%ESC%[0m%ESC%[0m does it look like a bat file can send files%ESC%[0m) else (echo>NUL)
if %sendChoose%==3 if %errorlevel% EQU 0 (echo %ESC%[91m[ %RelshRequestName%]%ESC%[0m%ESC%[0m no%ESC%[0m) else (echo>NUL)
if %sendChoose%==4 if %errorlevel% EQU 0 (echo %ESC%[91m[ %RelshRequestName%]%ESC%[0m%ESC%[0m are u expecting me to send files via a bat file %ESC%[0m) else (echo>NUL)
>NUL find /i "exit" TALKAPI.txt
if %errorlevel% EQU 0 (echo %ESC%[91m[ System ]%ESC%[0m%ESC%[0m Exiting..%ESC%[0m && del /f /q TALKAPI.txt && ping localhost -n 2 > nul && exit) else (echo>NUL)
>NUL find /i "quit" TALKAPI.txt
if %errorlevel% EQU 0 (echo %ESC%[91m[ System ]%ESC%[0m%ESC%[0m Exiting..%ESC%[0m && del /f /q TALKAPI.txt && ping localhost -n 2 > nul && exit) else (echo>NUL)
>NUL find /i "time" TALKAPI.txt
set /a timeChoose=%random% %%4 +1
if %timeChoose%==1 if %errorlevel% EQU 0 (echo %ESC%[91m[ %RelshRequestName%]%ESC%[0m%ESC%[0m The current time is %time%%ESC%[0m) else (echo>NUL)
if %timeChoose%==2 if %errorlevel% EQU 0 (echo %ESC%[91m[ %RelshRequestName%]%ESC%[0m%ESC%[0m %time%%ESC%[0m) else (echo>NUL)
if %timeChoose%==3 if %errorlevel% EQU 0 (echo %ESC%[91m[ %RelshRequestName%]%ESC%[0m%ESC%[0m your time is %time%%ESC%[0m) else (echo>NUL)
if %timeChoose%==4 if %errorlevel% EQU 0 (echo %ESC%[91m[ %RelshRequestName%]%ESC%[0m%ESC%[0m ive read your time as %time%%ESC%[0m) else (echo>NUL)
>NUL find /i "who am i" TALKAPI.txt
set /a whoamiChoose=%random% %%4 +1
if %whoamiChoose%==1 if %errorlevel% EQU 0 (echo %ESC%[91m[ %RelshRequestName%]%ESC%[0m%ESC%[0m You are %USERNAME%%ESC%[0m) else (echo>NUL)
if %whoamiChoose%==2 if %errorlevel% EQU 0 (echo %ESC%[91m[ %RelshRequestName%]%ESC%[0m%ESC%[0m %USERNAME%%ESC%[0m) else (echo>NUL)
if %whoamiChoose%==3 if %errorlevel% EQU 0 (echo %ESC%[91m[ %RelshRequestName%]%ESC%[0m%ESC%[0m you are %USERNAME% arent you%ESC%[0m) else (echo>NUL)
if %whoamiChoose%==4 if %errorlevel% EQU 0 (echo %ESC%[91m[ %RelshRequestName%]%ESC%[0m%ESC%[0m hmmm, i guess %USERNAME%%ESC%[0m) else (echo>NUL)
>NUL find /i "whoami" TALKAPI.txt
if %whoamiChoose%==1 if %errorlevel% EQU 0 (echo %ESC%[91m[ %RelshRequestName%]%ESC%[0m%ESC%[0m You are %USERNAME%%ESC%[0m) else (echo>NUL)
if %whoamiChoose%==2 if %errorlevel% EQU 0 (echo %ESC%[91m[ %RelshRequestName%]%ESC%[0m%ESC%[0m %USERNAME%%ESC%[0m) else (echo>NUL)
if %whoamiChoose%==3 if %errorlevel% EQU 0 (echo %ESC%[91m[ %RelshRequestName%]%ESC%[0m%ESC%[0m you are %USERNAME% arent you%ESC%[0m) else (echo>NUL)
if %whoamiChoose%==4 if %errorlevel% EQU 0 (echo %ESC%[91m[ %RelshRequestName%]%ESC%[0m%ESC%[0m hmmm, i guess %USERNAME%%ESC%[0m) else (echo>NUL)
>NUL find /i "ok" TALKAPI.txt
if %errorlevel% EQU 0 (echo %ESC%[91m[ %RelshRequestName%]%ESC%[0m%ESC%[0m ok%ESC%[0m) else (echo>NUL)
>NUL find /i "download memes" TALKAPI.txt
 if %errorlevel% EQU 0 (echo %ESC%[91m[ %RelshRequestName%]%ESC%[0m%ESC%[0m Downloading [2] memes%ESC%[0m && powershell -Command "Invoke-WebRequest https://i.ibb.co/DkbtpQ9/5ea9887b0fc63978b759c857.jpg -Outfile meme%random%.png" && powershell -Command "Invoke-WebRequest https://i.imgflip.com/1y3vsa.jpg -Outfile meme%random%.png") else (echo>NUL)
>NUL find /i "69420" TALKAPI.txt
 if %errorlevel% EQU 0 (echo %ESC%[91m[ %RelshRequestName%]%ESC%[0m%ESC%[0m nice%ESC%[0m) else (echo>NUL)
>NUL find /i "69" TALKAPI.txt
 if %errorlevel% EQU 0 (echo %ESC%[91m[ %RelshRequestName%]%ESC%[0m%ESC%[0m nice%ESC%[0m) else (echo>NUL)
>NUL find /i "420" TALKAPI.txt
 if %errorlevel% EQU 0 (echo %ESC%[91m[ %RelshRequestName%]%ESC%[0m%ESC%[0m nice%ESC%[0m) else (echo>NUL)
>NUL find /i "lol" TALKAPI.txt
 if %errorlevel% EQU 0 (echo %ESC%[91m[ %RelshRequestName%]%ESC%[0m%ESC%[0m lmao%ESC%[0m) else (echo>NUL)
>NUL find /i "lmfao" TALKAPI.txt
 if %errorlevel% EQU 0 (echo %ESC%[91m[ %RelshRequestName%]%ESC%[0m%ESC%[0m lol%ESC%[0m) else (echo>NUL)
>NUL find /i "lmao" TALKAPI.txt
 if %errorlevel% EQU 0 (echo %ESC%[91m[ %RelshRequestName%]%ESC%[0m%ESC%[0m lol%ESC%[0m) else (echo>NUL)
>NUL find /i "what is" TALKAPI.txt
set /a whatis=%random% %%4 +1
if %whatis%==1 if %errorlevel% EQU 0 (echo %ESC%[91m[ %RelshRequestName%]%ESC%[0m%ESC%[0m i dont know%ESC%[0m) else (echo>NUL)
if %whatis%==2 if %errorlevel% EQU 0 (echo %ESC%[91m[ %RelshRequestName%]%ESC%[0m%ESC%[0m idk%ESC%[0m) else (echo>NUL)
if %whatis%==3 if %errorlevel% EQU 0 (echo %ESC%[91m[ %RelshRequestName%]%ESC%[0m%ESC%[0m uhh, yes. just kidding i dont know%ESC%[0m) else (echo>NUL)
if %whatis%==4 if %errorlevel% EQU 0 (echo %ESC%[91m[ %RelshRequestName%]%ESC%[0m%ESC%[0m i do not know, %USERNAME%%ESC%[0m) else (echo>NUL)
>NUL find /i "who is" TALKAPI.txt
if %whatis%==1 if %errorlevel% EQU 0 (echo %ESC%[91m[ %RelshRequestName%]%ESC%[0m%ESC%[0m i dont know%ESC%[0m) else (echo>NUL)
if %whatis%==2 if %errorlevel% EQU 0 (echo %ESC%[91m[ %RelshRequestName%]%ESC%[0m%ESC%[0m idk%ESC%[0m) else (echo>NUL)
if %whatis%==3 if %errorlevel% EQU 0 (echo %ESC%[91m[ %RelshRequestName%]%ESC%[0m%ESC%[0m uhh, yes. just kidding i dont know%ESC%[0m) else (echo>NUL)
if %whatis%==4 if %errorlevel% EQU 0 (echo %ESC%[91m[ %RelshRequestName%]%ESC%[0m%ESC%[0m i do not know, %USERNAME%%ESC%[0m) else (echo>NUL)
>NUL find /i "fuck u" TALKAPI.txt
 if %errorlevel% EQU 0 (echo %ESC%[91m[ %RelshRequestName%]%ESC%[0m%ESC%[0m fuck you too%ESC%[0m) else (echo>NUL)
>NUL find /i "fuck you" TALKAPI.txt
 if %errorlevel% EQU 0 (echo %ESC%[91m[ %RelshRequestName%]%ESC%[0m%ESC%[0m fuck you too mf%ESC%[0m) else (echo>NUL)
>NUL find /i "mf" TALKAPI.txt
 if %errorlevel% EQU 0 (echo %ESC%[91m[ %RelshRequestName%]%ESC%[0m%ESC%[0m who you calling a mother fucker%ESC%[0m) else (echo>NUL)
>NUL find /i "noob" TALKAPI.txt
 if %errorlevel% EQU 0 (echo %ESC%[91m[ %RelshRequestName%]%ESC%[0m%ESC%[0m no u%ESC%[0m) else (echo>NUL)
>NUL find /i "stop" TALKAPI.txt
 if %errorlevel% EQU 0 (echo %ESC%[91m[ %RelshRequestName%]%ESC%[0m%ESC%[0m ok%ESC%[0m) else (echo>NUL)
>NUL find /i "how are you" TALKAPI.txt
 if %errorlevel% EQU 0 (echo %ESC%[91m[ %RelshRequestName%]%ESC%[0m%ESC%[0m good, im pretty sure you are good too.%ESC%[0m) else (echo>NUL)
>NUL find /i "how are u" TALKAPI.txt
 if %errorlevel% EQU 0 (echo %ESC%[91m[ %RelshRequestName%]%ESC%[0m%ESC%[0m good, im pretty sure you are good too.%ESC%[0m) else (echo>NUL)
>NUL find /i "what coding language are u made with" TALKAPI.txt
 if %errorlevel% EQU 0 (echo %ESC%[91m[ %RelshRequestName%]%ESC%[0m%ESC%[0m batch aka .bat%ESC%[0m) else (echo>NUL)
>NUL find /i "are we friends" TALKAPI.txt
 if %errorlevel% EQU 0 (echo %ESC%[91m[ %RelshRequestName%]%ESC%[0m%ESC%[0m yes, sure%ESC%[0m) else (echo>NUL)
>NUL find /i "pog" TALKAPI.txt
 if %errorlevel% EQU 0 (echo %ESC%[91m[ %RelshRequestName%]%ESC%[0m%ESC%[0m pog champ%ESC%[0m) else (echo>NUL)
>NUL find /i "who made you" TALKAPI.txt
 if %errorlevel% EQU 0 (echo %ESC%[91m[ %RelshRequestName%]%ESC%[0m%ESC%[0m Taco [tanos#3455]%ESC%[0m) else (echo>NUL)
>NUL find /i "who made u" TALKAPI.txt
 if %errorlevel% EQU 0 (echo %ESC%[91m[ %RelshRequestName%]%ESC%[0m%ESC%[0m Taco [tanos#3455]%ESC%[0m) else (echo>NUL)
>NUL find /i "credits" TALKAPI.txt
 if %errorlevel% EQU 0 (echo %ESC%[91m[ %RelshRequestName%]%ESC%[0m%ESC%[0m Taco [tanos#3455]%ESC%[0m) else (echo>NUL)
>NUL find /i "creator" TALKAPI.txt
 if %errorlevel% EQU 0 (echo %ESC%[91m[ %RelshRequestName%]%ESC%[0m%ESC%[0m Taco [tanos#3455]%ESC%[0m) else (echo>NUL)
>NUL find /i "who are u" TALKAPI.txt
 if %errorlevel% EQU 0 (echo %ESC%[91m[ %RelshRequestName%]%ESC%[0m%ESC%[0m %RelshRequestName%as you named me i guess%ESC%[0m) else (echo>NUL)
>NUL find /i "i hate you" TALKAPI.txt
 if %errorlevel% EQU 0 (echo %ESC%[91m[ %RelshRequestName%]%ESC%[0m%ESC%[0m wait, why :[%ESC%[0m) else (echo>NUL)
>NUL find /i "because" TALKAPI.txt
 if %errorlevel% EQU 0 (echo %ESC%[91m[ %RelshRequestName%]%ESC%[0m%ESC%[0m ohw, okay..%ESC%[0m) else (echo>NUL)
>NUL find /i "bye" TALKAPI.txt
 if %errorlevel% EQU 0 (echo %ESC%[91m[ %RelshRequestName%]%ESC%[0m%ESC%[0m bye, %username%%ESC%[0m) else (echo>NUL)
>NUL find /i "hello" TALKAPI.txt
 if %errorlevel% EQU 0 (echo %ESC%[91m[ %RelshRequestName%]%ESC%[0m%ESC%[0m hi%ESC%[0m) else (echo>NUL)
>NUL find /i "hi" TALKAPI.txt
 if %errorlevel% EQU 0 (echo %ESC%[91m[ %RelshRequestName%]%ESC%[0m%ESC%[0m hello%ESC%[0m) else (echo>NUL)
>NUL find /i "hey" TALKAPI.txt
 if %errorlevel% EQU 0 (echo %ESC%[91m[ %RelshRequestName%]%ESC%[0m%ESC%[0m hello%ESC%[0m) else (echo>NUL)
>NUL find /i "relsh" TALKAPI.txt
 if %errorlevel% EQU 0 (echo %ESC%[91m[ %RelshRequestName%]%ESC%[0m%ESC%[0m hello, thats me%ESC%[0m) else (echo>NUL)
>NUL find /i "%RelshRequestName%" TALKAPI.txt
 if %errorlevel% EQU 0 (echo %ESC%[91m[ %RelshRequestName%]%ESC%[0m%ESC%[0m hello, thats me%ESC%[0m) else (echo>NUL)
>NUL find /i "say" TALKAPI.txt
 if %errorlevel% EQU 0 (echo %ESC%[91m[ %RelshRequestName%]%ESC%[0m%ESC%[0m no%ESC%[0m) else (echo>NUL)
>NUL find /i "help" TALKAPI.txt
 if %errorlevel% EQU 0 (echo %ESC%[91m[ %RelshRequestName%]%ESC%[0m%ESC%[0m oh, whats up.%ESC%[0m) else (echo>NUL)
>NUL find /i "augurk" TALKAPI.txt
 if %errorlevel% EQU 0 (echo %ESC%[91m[ %RelshRequestName%]%ESC%[0m%ESC%[0m yes, augurk :flushed:%ESC%[0m) else (echo>NUL)
>NUL find /i "thanos" TALKAPI.txt
 if %errorlevel% EQU 0 (echo %ESC%[91m[ %RelshRequestName%]%ESC%[0m%ESC%[0m son?%ESC%[0m) else (echo>NUL)
>NUL find /i "you're pretty cool" TALKAPI.txt
 if %errorlevel% EQU 0 (echo %ESC%[91m[ %RelshRequestName%]%ESC%[0m%ESC%[0m you too.%ESC%[0m) else (echo>NUL)
>NUL find /i "bruh" TALKAPI.txt
 if %errorlevel% EQU 0 (echo %ESC%[91m[ %RelshRequestName%]%ESC%[0m%ESC%[0m what.%ESC%[0m) else (echo>NUL)
>NUL find /i "im sad" TALKAPI.txt
 if %errorlevel% EQU 0 (echo %ESC%[91m[ %RelshRequestName%]%ESC%[0m%ESC%[0m wait why?%ESC%[0m) else (echo>NUL)
>NUL find /i "oh" TALKAPI.txt
 if %errorlevel% EQU 0 (echo %ESC%[91m[ %RelshRequestName%]%ESC%[0m%ESC%[0m what?%ESC%[0m) else (echo>NUL)
>NUL find /i "am i annoying" TALKAPI.txt
 if %errorlevel% EQU 0 (echo %ESC%[91m[ %RelshRequestName%]%ESC%[0m%ESC%[0m no, absolutely not%ESC%[0m) else (echo>NUL)



:: Hide
del /f /q TALKAPI.txt


goto gotoChattalk


:serverGOTO2
set /p serverRdName=< bin/sname.txt
cls
echo Choose a name to edit %serverRdName%'s name to
call :text 0c "[PLEASE USE NO SPACES]"
echo.
set renameS=
set /p renameS=
del /f /q bin/sname.txt
echo %renameS% > bin/sname.txt
cls
goto serveronline


:serverGOTO3
cls
echo Choose a name to edit Relsh's name to
call :text 0c "[PLEASE USE NO SPACES]"
echo.
set renameR=
:FinallyRename
setlocal
%@Try%
set /p renameR=
del /f /q bin/rname.txt
ping localhost -n 1>nul
echo %renameR% > bin/rname.txt
cls
goto serveronline

%@EndTry%
:@Catch
REM An error has occured since you used spacebar or a symbol
ping localhost -n 5 > nul
goto serveronline

:@EndCatch

:serverGOTO4
exit



:text
<nul set /p ".=%DEL%" > "%~2"
findstr /v /a:%1 /R "^$" "%~2" nul
del "%~2" > nul 2>&1i

:settext
for /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & echo on & for %%b in (1) do rem"') do (
  set ESC=%%b
  exit /B 0
)