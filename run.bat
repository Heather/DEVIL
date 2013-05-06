@echo off

cls
SET EnableNuGetPackageRestore=true

::F# Unicode
if not exist "tools\Heather\tools\fsc.exe" (
    echo Getting Custom F# Compiler with Unicode Support
    "tools\nuget\nuget.exe" "install" "Heather" "-OutputDirectory" "tools" "-ExcludeVersion"
)

::Failess - FAKE with custom FSI Support and CSS EDSL Library attached
if not exist "tools\Failess\tools\Failess.exe" (
    echo Getting Failess build tool with CSS EDSL library
    "tools\nuget\nuget.exe" "install" "Failess" "-OutputDirectory" "tools" "-ExcludeVersion"
)

::ctodo
if not exist "tools\ctodo\tools\cctodo_100.exe" (
    echo Getting light todo list management util
	"tools\nuget\nuget.exe" "install" "ctodo" "-OutputDirectory" "tools" "-ExcludeVersion"
)

::Env
set c=tools\Heather\tools\
set f=tools\Failess\tools\

::Compile CSS
%c%fsc.exe -o:Devil.dll --noframework --optimize+ -r:%c%FSharp.Core.dll -r:%f%FailessLib.dll --target:library --warn:4 --utf8output --fullpaths Devil.fs
%f%Failess.exe FSI=%c%fsi.exe devilish.fsx

::Read todo
set todo=call todo.cmd
rm todo.db3

%todo% initdb
%todo% set git 0
%todo% set syncfile TODO
%todo% sync

echo +
echo + TODO:
%todo%

pause