@echo off
setlocal

if "%~1"=="" (
    echo Usage: split_pinterest_csv.bat your_file.csv
    pause
    exit /b
)

set INPUT=%~1
set FILEDIR=%~dp1
set BASENAME=%~n1
set OUTPUT=%FILEDIR%%BASENAME%_split

if not exist "%OUTPUT%" mkdir "%OUTPUT%"

echo Splitting %INPUT% into %OUTPUT%...

powershell -NoProfile -Command "$rows = Import-Csv '%INPUT%'; $i = 1; foreach ($row in $rows) { $file = Join-Path '%OUTPUT%' ('pin_' + $i + '.csv'); $row | Export-Csv -Path $file -NoTypeInformation -Encoding UTF8; $i++ }"

echo Done!
pause