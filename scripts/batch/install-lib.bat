@echo off
setlocal

if "%~4"=="" (
    echo Usage: %~nx0 ^<file^> ^<groupId^> ^<artifactId^> ^<version^> [packaging] [generatePom]
    exit /b 1
)

set "file=%~1"
set "groupId=%~2"
set "artifactId=%~3"
set "version=%~4"
set "packaging=%~5"
if "%packaging%"=="" set "packaging=jar"
set "generatePom=%~6"
if "%generatePom%"=="" set "generatePom=true"

if not exist "%file%" (
    echo Error: "%file%" not found.
    exit /b 2
)

where mvn >nul 2>&1
if errorlevel 1 (
    echo Error: Maven ^(mvn^) is not installed or not in PATH.
    exit /b 3
)

mvn install:install-file ^
    -Dfile="%file%" ^
    -DgroupId="%groupId%" ^
    -DartifactId="%artifactId%" ^
    -Dversion="%version%" ^
    -Dpackaging="%packaging%" ^
    -DgeneratePom="%generatePom%"

endlocal
exit /b 0
