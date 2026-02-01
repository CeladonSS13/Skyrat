@echo off
setlocal enabledelayedexpansion

set REPO_URL=https://github.com/skyrat1984test/rust-skyrat-1984.git
set TARGET_DIR="%~dp0\..\RUST_REMOTE"
set REQUIRED_FLAG_TO_BUILD=BUILD_LOCAL

set buildLocal=false
if exist "%~dp0\build_rust_config.txt" (
    set "firstLine="
    for /f "usebackq delims=" %%a in ("%~dp0\build_rust_config.txt") do (
        set "firstLine=%%a"
    )
    for /f "tokens=* delims= " %%x in ("!firstLine!") do set "firstLine=%%x"
    if /i "!firstLine!"=="!REQUIRED_FLAG_TO_BUILD!" (
        set buildLocal=true
    )
)

if /i "%buildLocal%"=="false" (
    xcopy "%~dp0\..\rust_cached\rust_1984.dll" "%~dp0\.." /Y /q
    IF %ERRORLEVEL% NEQ 0 (
        ECHO Failed to copy rust_1984.dll. Is file exist: rust_cached\rust_1984.dll?
        exit 117
    )
    ECHO Copied rust_cached\rust_1984.dll

    xcopy "%~dp0\..\rust_cached\rust_g.dll" "%~dp0\.." /Y /q
    IF %ERRORLEVEL% NEQ 0 (
        ECHO Failed to copy rust_g.dll. Is file exist: rust_cached\rust_g.dll?
        exit 117
    )
    ECHO Copied rust_cached\rust_g.dll

    echo Skipping rust build and use cached from rust_cached.
    echo ------
    echo If you have troubles like PROCEDURE NOT FOUND in DM, then try to build it locally by creating tools\build_rust_config with first line:
    echo %REQUIRED_FLAG_TO_BUILD%
    echo You can also ask to update cached version
    echo ------
    exit /b 0
)

REM Check if folder exists (order is important)
if exist %TARGET_DIR% (
    cd %TARGET_DIR%
    echo Fetching and force checkout to origin...
    git fetch origin master
    git checkout -f master
)
if not exist %TARGET_DIR% (
    mkdir %TARGET_DIR%
    cd %TARGET_DIR%
    echo Cloning remote...
    git clone %REPO_URL% .
)

WHERE "cargo" >nul 2>&1
IF %ERRORLEVEL% NEQ 0 (
    ECHO "cargo" command was not found. Install cargo for windows and rerun: https://win.rustup.rs/
    exit 101
)
WHERE "rustup" >nul 2>&1
IF %ERRORLEVEL% NEQ 0 (
    ECHO "rustup" command was not found. Install rust for windows and rerun: https://win.rustup.rs/
    exit 102
)

cd %TARGET_DIR%

rustup target add i686-pc-windows-msvc
cargo build --release --target i686-pc-windows-msvc

IF %ERRORLEVEL% NEQ 0 (
    ECHO Failed to build original rust
    exit 104
)

2>nul (call >> "%~dp0\..\rust_g.dll") || (
    ECHO rust_g.dll is currently locked. Trying to kill dreamdaemon.exe...
    taskkill /IM dreamdaemon.exe /F
)

xcopy "%TARGET_DIR%\target\i686-pc-windows-msvc\release\rust_g.dll" "%~dp0\.." /Y /q
IF %ERRORLEVEL% NEQ 0 (
    ECHO Failed to copy original rust_g.dll
    exit 105
)

cd "%~dp0\..\RUST"

rustup target add i686-pc-windows-msvc
cargo build --release --target i686-pc-windows-msvc

IF %ERRORLEVEL% NEQ 0 (
    ECHO Failed to build modular rust 1984
    exit 106
)

cd "%~dp0\.."

xcopy "%~dp0\..\RUST\target\i686-pc-windows-msvc\release\rust_1984.dll" "%~dp0\.." /Y /q
IF %ERRORLEVEL% NEQ 0 (
    ECHO Failed to copy rust_1984.dll
    exit 107
)

exit /b 0
