@echo off
@break off
@title Exports Copy, Move, Backup
@color 0a
@cls

setlocal EnableDelayedExpansion
 
if exist PathLocation\*.7z (
  echo Export Files detected
  if "!errorlevel!" EQU "0" (
	echo Starting Process
	
    "PathLocation\mapYDrive.bat"

    "PathLocation\Scripts\mkdir.bat"

    copy "PathLocation\\*.7z" "PathLocation\"%date:~-4,4%""%date:~-10,2%"%date:~-7,2%""""

    "PathLocation\7-Zip\7z.exe" e -pPasswordText PathLocation\*.7z -oPathLocation\

    del PathLocation\*.7z

    move "PathLocation\a" "PathLocation\"

    move "PathLocation\b" "PathLocation\"

    move "PathLocation\c" "PathLocation\"

    move "PathLocation\d" "PathLocation\"

    move "PathLocation\e" "PathLocation\"
	
    ) else (echo Files not found, stopping process.)
  ) else ( echo Something went wrong! Files not found, stopping process.)
)
