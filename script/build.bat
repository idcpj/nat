@echo off
echo "start build linux transponder"


SET GOOS=windows



call:build inner

call:build outer

echo "finish build linux transponder"

goto :EOF


:build

    del /F /S /Q ..\build\windows\%1_server\

    md   ..\build\windows\%1_server\bin\
    md   ..\build\windows\%1_server\config\

    xcopy/ye   ..\config\%1.yaml  ..\build\windows\%1_server\config\

    go build -ldflags "-w -s" -gcflags "all=-N -l"  -o ..\build\windows\%1_server\bin  ..\cmd\%1_server.go

goto:EOF



