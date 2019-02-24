REM @echo off

if not exist "artifacts" mkdir artifacts && cd artifacts
if not exist "win" mkdir win && cd win
if not exist "lib" mkdir lib && cd lib

git clone https://github.com/pybind/pybind11.git
set PYBIND11_DIR=..\pybind11

curl -OL https://github.com/nigels-com/glew/releases/download/glew-2.1.0/glew-2.1.0-win32.zip -o glew-2.1.0-win32.zip
7z e glew-2.1.0-win32.zip

dir
dir glew-2.1.0-win32

cmake ..\..\.. -G "Visual Studio 15 2017 Win64" -DBUILD_EXAMPLES="OFF" -DBUILD_PYTHON="ON" -DVERSION="0.0.2" || exit /b 1
msbuild /nologo /verbosity:quiet /p:Configuration=Release Project.sln || exit /b 1

cd ..\..\..