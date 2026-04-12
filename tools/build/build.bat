@echo off
REM Celadon ADDITION START
echo Starting Celadon RUST update/compile...
call "%~dp0\..\build_rust_celadon.bat" %*
IF ERRORLEVEL 1 (
    ECHO "Error occured while building rust. Check other messages for more info"
    pause
    exit %ERRORLEVEL%
)
echo Starting actual build...
REM Celadon ADDITION END
"%~dp0\..\bootstrap\javascript.bat" "%~dp0\build.ts" %*
