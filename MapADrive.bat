REM A Batch file script to check if a drive exists, if not map it, if so delete it and remap it.
REM Written in a .bat file. 

@echo off
@break off
@title Map Network drive for process
@color 0a
@cls

setlocal EnableDelayedExpansion

if exist "Y:" (
  net use /delete Y: /y >NUL
  if "!errorlevel!" EQU "0" (
    echo Drive Mapped Successfully
    net use Y: DriveNamePath
  ) else (
    echo Error Mapping drive
  )
) else (
  net use Y: DriveNamePath
)
