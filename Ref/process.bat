@echo off
rem ** Process MP3 files with SoundStretch by using lame.exe for mp3/wav decoding/encoding
rem **
rem ** Usage: process [inputfile.mp3] [outputfile.mp3] "[switches]"
rem ** notice: add quotes "" around the "[switches]" to get them work properly
rem **
rem ** example: process.bat file.mp3 file_faster.mp3 "-tempo=25" "-pitch=-2"

rem ** Extract processing parameters
set original=%1
set target=%2
set params=%3 %4 %5 %6

echo ***
echo *** Process file %original% to %target%
echo *** using SoundStretch with parameters %params%
echo ***

rem ** Process the file by piping lame-decoding -> soundstretch -> lame-encoding :
lame --silent --decode %original% - | soundstretch stdin stdout %params% | lame --silent -v - %target%
