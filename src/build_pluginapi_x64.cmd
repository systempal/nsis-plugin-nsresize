@echo off
call "C:\Program Files\Microsoft Visual Studio\2022\Community\VC\Auxiliary\Build\vcvars64.bat"
cd /d %~dp0
cl /c /O2 /DUNICODE /D_UNICODE /GS- /TC pluginapi.c /Fo:pluginapi_x64.obj
lib /OUT:nsis_unicode\pluginapi_x64.lib pluginapi_x64.obj
del pluginapi_x64.obj
echo Done!
