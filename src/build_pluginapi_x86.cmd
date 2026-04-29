@echo off
call "C:\Program Files\Microsoft Visual Studio\2022\Community\VC\Auxiliary\Build\vcvars32.bat"
cd /d %~dp0

REM Build Unicode version
cl /c /O2 /DUNICODE /D_UNICODE /GS- /TC pluginapi.c /Fo:pluginapi_unicode.obj
lib /OUT:nsis_unicode\pluginapi.lib pluginapi_unicode.obj
del pluginapi_unicode.obj

REM Build ANSI version
cl /c /O2 /GS- /TC pluginapi.c /Fo:pluginapi_ansi.obj
lib /OUT:nsis_ansi\pluginapi.lib pluginapi_ansi.obj
del pluginapi_ansi.obj

echo Done!
