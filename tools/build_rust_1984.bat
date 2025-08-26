@echo off

set REPO_URL=https://github.com/skyrat1984test/rust-skyrat-1984.git
set TARGET_DIR="%~dp0\..\RUST_REMOTE"

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
