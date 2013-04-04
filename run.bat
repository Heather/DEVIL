@echo off

::Env
set compilerpath=D:\Heather\Contrib\mono\fsharp\lib\release\4.0\
set failesspath=D:\Heather\Contrib\mono\Failess\build\

::Compile CSS
%compilerpath%fsc.exe -o:Devil.dll --noframework --optimize+ -r:%compilerpath%FSharp.Core.dll -r:%failesspath%FailessLib.dll --target:library --warn:4 --utf8output --fullpaths devil.fs
%failesspath%Failess.exe FSI=%compilerpath%fsi.exe devilish.fsx

pause