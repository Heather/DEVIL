悪魔
----

``` fsharp
Getting Custom F# Compiler with Unicode Support  -> Successfully installed 'FSharp.Unicode 1.0'.
Getting Failess build tool with CSS EDSL library -> Successfully installed 'Failess 0.0.4'.
Getting light todo list management util          -> Successfully installed 'ctodo 1.3.0'.
Failess Arguments:
"FSI"
"devilish.fsx"
FSI-Path: tools\FSharp.Unicode\tools\fsi.exe
MSBuild-Path: c:\Windows\Microsoft.NET\Framework\v4.0.30319\MSBuild.exe
Running Buildscript: D:\Heather\Contrib\mono\DEVIL\devilish.fsx
<== Build

The resulting target order is:
 - Build
Starting Target: Build
 --- Building CSS ---
Finished Target: Build

---------------------------------------------------------------------
Build Time Report
---------------------------------------------------------------------
Target     Duration
------     --------
Build      00:00:00.1521362
Total:     00:00:00.1792305
Status:    Ok
---------------------------------------------------------------------
Ready.

Sync file: ./TODO
synchronization complete, local database updated
+
+ TODO:
+---+------+
| 0 | Test |
+---+------+
```

 - FAILESS - https://github.com/Heather/Failess based on FAKE, inspired by Clay
 - F# Fork - https://github.com/Heather/fsharp just to allow custom operators
 
```fsharp
open 悪魔
Target "Build" /> fun () -> 
    ☭ "Site.css" [
        a <<[
            ⠅ visited >< ⠅ link @ color -- "#034af3"
            ⠅ hover -|[ TextDecoration.none
                        color -- "#1d60ff"
                        ] ]
        [   ⠂ "rightcolumn"  .> h1;
            ⠂ "rightcolumn"  .> h2;
            ⠂ "leftcolumn"   .> h1;
            ⠂ "leftcolumn"   .> h2] @@ marginTop -- px 0
        div << [
            ⠂ "hideSkiplink"-|[
                backgroundColor -- "#3a4f63"
                width -- prc 100 ]
            ⠂ "accountInfo" @ width -- prc 42
            ⠂ menu << [
                ★[padding -/ px4 4 0 4 8]
                ☆ ul << [
                    ★  [ listStyle   -- ListStyle.None
                         margin      -- px 0
                         padding     -- px 0
                         width       -- auto ]
                    ☆ li ++ a << [
                        ★ ✿
                        ⠅ visited -| ✿
                        ⠅ hover-|[
                            backgroundColor -- "#bfcbd6"
                            color           -- "#465c71"
                            textDecoration  -- TextDecoration.None ]
                        ⠅ active-|[
                            backgroundColor -- "#465c71"
                            color           -- "#cfdbe6"
                            textDecoration  -- TextDecoration.None ]
                        ] ] ] ]
        "fieldset" << [
            ★  [    margin -/ [em 1.0; px 0]
                    padding -- em 1.0
                    Border.set (px 1) Border.Solid "#ccc" ]
            ☆ p @ margin -/ px4 2 12 10 10
            ⠂ "login" -. "inline" @ display -- Display.Inline
            ⠂ "login" ++ label 
                >< ⠂ "register" ++ label 
                >< ⠂ "changePassword" ++ label 
                    @ Display.block
            ]
        Border.set (px 1) Border.Solid "#ccc" 
        |> fun ➷ ->
            input << [
                ⠂ "textEntry "      -|[ ➷; width -- px 320 ]
                ⠂ "passwordEntry"   -|[ ➷; width -- px 320 ]
                ]
        ]
"Build"; RunParameterTargetOrDefault "target" "Build"
```