@echo off
set projectName=SuperTo.csproj
set /p apikey=input apikey if u want to push package:
:start
set op=clear_pack_push
set /p op=�������������pack��push��delete��clear��ֱ�ӻس������������
if "%op%"=="pack" (
..\nuget.exe pack "%projectName%" -Build -Properties Configuration=Release
goto start)
if "%op%"=="push" (
..\nuget.exe setApiKey "%apikey%"
..\nuget.exe push *.nupkg  -Source https://www.nuget.org/api/v2/package
goto start)

if "%op%"=="delete" (
set /p id=����������ƣ�
set /p version=������汾�ţ�
..\nuget.exe delete "%id%" "%version%"  -Source https://www.nuget.org/api/v2/package
goto start)

if "%op%"=="clear" (
del /s *.nupkg
goto start)

if "%op%"=="clear_pack_push" (
del /s *.nupkg
..\nuget.exe pack "%projectName%" -Build -Properties Configuration=Release
..\nuget.exe setApiKey "%apikey%"
..\nuget.exe push *.nupkg  -Source https://www.nuget.org/api/v2/package
goto start)

echo ����������Ч
goto start
pause  