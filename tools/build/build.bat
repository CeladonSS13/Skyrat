@echo off
REM SS1984 ADDITION START
echo Starting SS1984 RUST update/compile...
call "%~dp0\..\build_rust_1984.bat" %*
IF ERRORLEVEL 1 (
    exit %ERRORLEVEL%
)
echo Starting actual build...
REM SS1984 ADDITION END
"%~dp0\..\bootstrap\javascript.bat" "%~dp0\build.ts" %*
