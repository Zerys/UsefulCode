REM Makes a folder, based on current date.
REM Written in Batch in a .bat file.
REM Format YY/MM/DD

@echo off
@break off
@title Create folder with batch but only if it doesn't already exist based on current date. Format YY/MM/DD
@color 0a
@cls

setlocal EnableDelayedExpansion

if not exist "PathLocation\"%date:~-4,4%""%date:~-10,2%"%date:~-7,2%""" (
  mkdir "PathLocation\"%date:~-4,4%""%date:~-10,2%"%date:~-7,2%"""
  if "!errorlevel!" EQU "0" (
    echo Folder created successfully
  ) else (
    echo Error while creating folder
  )
) else (
  echo Folder already exists
)
