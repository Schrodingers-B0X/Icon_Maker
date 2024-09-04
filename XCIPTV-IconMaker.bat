@echo off
SETLOCAL EnableDelayedExpansion

:TEAMNAME
echo.
echo  _______________________________________________________________________________________________________________
echo ^|                                                                                                               ^|
echo ^|          DROP A BACKGROUND AND LOGO INTO THE MAIN FOLDER WHERE THE XCIPTV-IconMaker.bat IS LOCATED            ^|
echo ^|                                                                                                               ^|
echo ^|                                  NAME THE FILES "background" AND "logo"                                       ^|
echo ^|                                                                                                               ^|
echo ^|                         "logo" must be a png file with a transparent background                               ^|
echo ^|                                                                                                               ^|
echo ^|                  "background" can be any jpeg, png etc (tool will handle conversion to jpg)                   ^|
echo ^|                                                                                                               ^|
echo ^|            Resolution and aspect ratio isn't too important. The tool will handle resize, crop etc.            ^|
echo ^|                                                                                                               ^|
echo ^|                 FOR BEST RESULTS AIM FOR A MINIMUM OF 512p FOR LOGO AND 720p FOR BACKGROUND                   ^|
echo ^|_______________________________________________________________________________________________________________^|
echo.
set /p themenamebef=Enter your theme name here (no spaces):
rem Remove whitespaces
set "themename="
echo.
for %%a in (%themenamebef%) do set "themename=!themename!%%a"

set "FOLDER=!themename!"
mkdir "Completed\!FOLDER!\Edits\Icons" 2>NUL
move /y "background.*" "Completed\!FOLDER!\" >nul
move /y "logo.png" "Completed\!FOLDER!\logo.png" >nul

:STYLENUM

set /p style=Enter which style number (1 or more):

if not exist "Icon-Presets\Category-Icons\Style!style!" (
	echo.
    echo Icon-Presets\Category-Icons\Style!style! folder doesn't exist. Try again
	goto STYLENUM
)

set "ICONSTYLE=Style!style!"
echo.

set /p num=Enter opacity percentage to the nearest 10%% (0-100):

IF "%num%"=="0" (
    set "alpha=00"
) ELSE IF "%num%"=="10" (
    set "alpha=1a"
) ELSE IF "%num%"=="20" (
    set "alpha=33"
) ELSE IF "%num%"=="30" (
    set "alpha=4d"
) ELSE IF "%num%"=="40" (
    set "alpha=66"
) ELSE IF "%num%"=="50" (
    set "alpha=80"
) ELSE IF "%num%"=="60" (
    set "alpha=99"
) ELSE IF "%num%"=="70" (
    set "alpha=b3"
) ELSE IF "%num%"=="80" (
    set "alpha=cc"
) ELSE IF "%num%"=="90" (
    set "alpha=e6"
) ELSE IF "%num%"=="100" (
    set "alpha=FF"
) ELSE (
    echo That's not an option. Try again.
    goto BORDERMENU
)

REM Process icons
"Tools\ImageMagick\magick" "Icon-Presets\Category-Icons\!ICONSTYLE!\movies.png" -trim +repage -strip "Icon-Presets\Category-Icons\!ICONSTYLE!\movies.png"
FOR /F "tokens=*" %%x IN ('Tools\ImageMagick\magick Icon-Presets\Category-Icons\!ICONSTYLE!\movies.png -format "%%[fx:max(w,h)]" info:') DO SET maxDim=%%x
"Tools\ImageMagick\magick" "Icon-Presets\Category-Icons\!ICONSTYLE!\movies.png" -gravity center -background none -extent !maxDim!x!maxDim! -resize 512x512 "Icon-Presets\Category-Icons\!ICONSTYLE!\movies.png"

"Tools\ImageMagick\magick" "Icon-Presets\Category-Icons\!ICONSTYLE!\series.png" -trim +repage -strip "Icon-Presets\Category-Icons\!ICONSTYLE!\series.png"
FOR /F "tokens=*" %%x IN ('Tools\ImageMagick\magick Icon-Presets\Category-Icons\!ICONSTYLE!\series.png -format "%%[fx:max(w,h)]" info:') DO SET maxDim=%%x
"Tools\ImageMagick\magick" "Icon-Presets\Category-Icons\!ICONSTYLE!\series.png" -gravity center -background none -extent !maxDim!x!maxDim! -resize 512x512 "Icon-Presets\Category-Icons\!ICONSTYLE!\series.png"

"Tools\ImageMagick\magick" "Icon-Presets\Category-Icons\!ICONSTYLE!\live.png" -trim +repage -strip "Icon-Presets\Category-Icons\!ICONSTYLE!\live.png"
FOR /F "tokens=*" %%x IN ('Tools\ImageMagick\magick Icon-Presets\Category-Icons\!ICONSTYLE!\live.png -format "%%[fx:max(w,h)]" info:') DO SET maxDim=%%x
"Tools\ImageMagick\magick" "Icon-Presets\Category-Icons\!ICONSTYLE!\live.png" -gravity center -background none -extent !maxDim!x!maxDim! -resize 512x512 "Icon-Presets\Category-Icons\!ICONSTYLE!\live.png"

"Tools\ImageMagick\magick" "Icon-Presets\Category-Icons\!ICONSTYLE!\guide.png" -trim +repage -strip "Icon-Presets\Category-Icons\!ICONSTYLE!\guide.png"
FOR /F "tokens=*" %%x IN ('Tools\ImageMagick\magick Icon-Presets\Category-Icons\!ICONSTYLE!\guide.png -format "%%[fx:max(w,h)]" info:') DO SET maxDim=%%x
"Tools\ImageMagick\magick" "Icon-Presets\Category-Icons\!ICONSTYLE!\guide.png" -gravity center -background none -extent !maxDim!x!maxDim! -resize 512x512 "Icon-Presets\Category-Icons\!ICONSTYLE!\guide.png"

:BORDERMENU

echo  _______________________________________________________________________________________________________________
echo ^|                                   ___               ___             _                                         ^|
echo ^|                                  ^|_ _^|__ ___ _ _   ^| _ ) ___ _ _ __^| ^|___ _ _ ___                             ^|
echo ^|                                   ^| ^|/ _/ _ \ ' \  ^| _ \/ _ \ '_/ _` / -_) '_(_-^<                             ^|
echo ^|                                  ^|___\__\___/_^|^|_^| ^|___/\___/_^| \__,_\___^|_^| /__/                             ^|
echo ^|_______________________________________________________________________________________________________________^|
echo  _______________________________________________________________________________________________________________
echo ^|                                                                                                               ^|
echo ^|                                     WHAT STYLE OF BORDERS WOULD YOU LIKE?                                     ^|
echo ^|                                                                                                               ^|
echo ^|                                                   1. Gold                                                     ^|
echo ^|                                                   2. Silver                                                   ^|
echo ^|                                                   3. Default                                                  ^|
echo ^|_______________________________________________________________________________________________________________^|
echo.

set /p border=Enter your choice (1-3):

IF "%border%"=="1" (
    set "BORDERSTYLE=Gold"
	mkdir "Completed\!FOLDER!\Edits\Icons\Gold" 2>NUL
) ELSE IF "!border!"=="2" (
    set "BORDERSTYLE=Silver"
	mkdir "Completed\!FOLDER!\Edits\Icons\Silver" 2>NUL
) ELSE IF "!border!"=="3" (
    set "BORDERSTYLE=Default"
	mkdir "Completed\!FOLDER!\Edits\Icons\Default" 2>NUL
	set "colour=#000000"
	goto IMAGEWIZ
) ELSE (
    echo That's not an option. Try again.
    goto BORDERMENU
)

:COLOURPICKER
echo.
echo Choose a colour from the colour picker to set icon backgrounds

REM Get color from color picker
FOR /F "tokens=*" %%i IN ('powershell -ExecutionPolicy Bypass -File Tools\colourpicker.ps1') DO SET colour=%%i

REM Use the color in ImageMagick command
echo.

:IMAGEWIZ
echo Creating !FOLDER! icon sets!

REM Process logo
"Tools\ImageMagick\magick" "Completed\!FOLDER!\logo.png" -trim +repage -strip "Completed\!FOLDER!\Edits\logo-trimmed.png"
FOR /F "tokens=*" %%x IN ('Tools\ImageMagick\magick Completed\!FOLDER!\Edits\logo-trimmed.png -format "%%[fx:max(w,h)]" info:') DO SET maxDim=%%x
"Tools\ImageMagick\magick" "Completed\!FOLDER!\Edits\logo-trimmed.png" -gravity center -background none -extent !maxDim!x!maxDim! -resize 512x512 "Completed\!FOLDER!\Edits\logo-512.png"

"Tools\ImageMagick\magick" "Completed\!FOLDER!\Edits\logo-512.png" ^
    -alpha extract -channel A -morphology Dilate Disk:20 -blur 0x15 -negate ^
    -write mpr:mask +delete ^
    mpr:mask -channel A -negate -background "!colour!" -alpha shape ^
    "Completed\!FOLDER!\Edits\logo-glow-only.png"

"Tools\ImageMagick\magick" "Completed\!FOLDER!\Edits\logo-512.png" "Completed\!FOLDER!\Edits\logo-glow-only.png" ^
    -compose DstOver -composite ^
    "Completed\!FOLDER!\Edits\logo-glow.png"

del "Completed\!FOLDER!\Edits\logo-trimmed.png"

REM Process background
REM Check if it's not a .jpg and convert if needed
FOR %%i IN (Completed\!FOLDER!\background.*) DO (
    IF NOT "%%~xi"==".jpg" (
        "Tools\ImageMagick\magick" "%%i" "Completed\!FOLDER!\background.jpg"
        del "%%i"
    )
)

REM Calculate aspect ratio and resize accordingly
FOR /F "tokens=1,2" %%a IN ('Tools\ImageMagick\magick Completed\!FOLDER!\background.jpg -format "%%w %%h" info:') DO (
    SET width=%%a
    SET height=%%b
    SET /A ratio=width*1000/height
)

REM If aspect ratio isn't 1:1 crop the relevant axis to meet 1:1 ratio, then resize to 1920x1080
IF !ratio! LSS 1760 (
    "Tools\ImageMagick\magick" "Completed\!FOLDER!\background.jpg" -resize 1920x -gravity center -crop 1920x1080+0+0 +repage -strip "Completed\!FOLDER!\Edits\background.jpg"
) ELSE IF !ratio! GTR 1780 (
    "Tools\ImageMagick\magick" "Completed\!FOLDER!\background.jpg" -resize x1080 -gravity center -crop 1920x1080+0+0 +repage -strip "Completed\!FOLDER!\Edits\background.jpg"
) ELSE IF !ratio! GEQ 1760 IF !ratio! LEQ 1780 (
    "Tools\ImageMagick\magick" "Completed\!FOLDER!\background.jpg" -resize 1920x -strip "Completed\!FOLDER!\Edits\background.jpg"
)

REM Create icon sets based on chosen colour and border style
"Tools\ImageMagick\magick" -size 512x512 xc:transparent ^
    -fill "!colour!!alpha!" -draw "roundrectangle 12,12 500,500 10,10" ^
    ( Icon-Presets\!BORDERSTYLE!\cat_icon.png ) -gravity center -composite ^
    Completed\!FOLDER!\cat_icon.png

"Tools\ImageMagick\magick" Completed\!FOLDER!\cat_icon.png ^
    ( Icon-Presets\!BORDERSTYLE!\cat_gs.png -resize 380x380 ) -gravity center -composite ^
    Completed\!FOLDER!\Edits\Icons\!BORDERSTYLE!\cat_gs.png

"Tools\ImageMagick\magick" Completed\!FOLDER!\cat_icon.png ^
    ( Icon-Presets\!BORDERSTYLE!\cat_notification_no.png -resize 380x380 ) -gravity center -composite ^
    Completed\!FOLDER!\Edits\Icons\!BORDERSTYLE!\cat_notification_no.png

"Tools\ImageMagick\magick" Completed\!FOLDER!\cat_icon.png ^
    ( Icon-Presets\!BORDERSTYLE!\cat_notification_yes.png -resize 380x380 ) -gravity center -composite ^
    Completed\!FOLDER!\Edits\Icons\!BORDERSTYLE!\cat_notification_yes.png

"Tools\ImageMagick\magick" Completed\!FOLDER!\cat_icon.png ^
    ( Icon-Presets\!BORDERSTYLE!\cat_rec.png -resize 380x380 ) -gravity center -composite ^
    Completed\!FOLDER!\Edits\Icons\!BORDERSTYLE!\cat_rec.png

"Tools\ImageMagick\magick" Completed\!FOLDER!\cat_icon.png ^
    ( Icon-Presets\!BORDERSTYLE!\cat_remind.png -resize 380x380 ) -gravity center -composite ^
    Completed\!FOLDER!\Edits\Icons\!BORDERSTYLE!\cat_remind.png

"Tools\ImageMagick\magick" Completed\!FOLDER!\cat_icon.png ^
    ( Icon-Presets\!BORDERSTYLE!\cat_remind.png -resize 380x380 ) -gravity center -composite ^
    Completed\!FOLDER!\Edits\Icons\!BORDERSTYLE!\cat_pr.png

"Tools\ImageMagick\magick" Completed\!FOLDER!\cat_icon.png ^
    ( Icon-Presets\!BORDERSTYLE!\cat_vpn.png -resize 380x380 ) -gravity center -composite ^
    Completed\!FOLDER!\Edits\Icons\!BORDERSTYLE!\cat_vpn.png

"Tools\ImageMagick\magick" Completed\!FOLDER!\cat_icon.png ^
    ( Icon-Presets\!BORDERSTYLE!\cat_vpn_connected.png -resize 380x380 ) -gravity center -composite ^
    Completed\!FOLDER!\Edits\Icons\!BORDERSTYLE!\cat_vpn_connected.png

"Tools\ImageMagick\magick" Completed\!FOLDER!\cat_icon.png ^
    ( Icon-Presets\!BORDERSTYLE!\cat_update.png -resize 380x380 ) -gravity center -composite ^
    Completed\!FOLDER!\Edits\Icons\!BORDERSTYLE!\cat_update.png

"Tools\ImageMagick\magick" Completed\!FOLDER!\cat_icon.png ^
    ( Icon-Presets\!BORDERSTYLE!\sport_btn.png -resize 380x380 ) -gravity center -composite ^
    Completed\!FOLDER!\Edits\Icons\!BORDERSTYLE!\sport_btn.png

IF "%border%"=="3" (
    goto DEFAULTICONS
) ELSE (
	goto CUSTOMICONS
)

:DEFAULTICONS
xcopy "Icon-Presets\!BORDERSTYLE!\account.png" "Completed\!FOLDER!\Edits\Icons\!BORDERSTYLE!\account.png*" /Y /Q > nul
xcopy "Icon-Presets\!BORDERSTYLE!\cat_epg.png" "Completed\!FOLDER!\Edits\Icons\!BORDERSTYLE!\btn_epg.png*" /Y /Q > nul
xcopy "Icon-Presets\!BORDERSTYLE!\cat_vod.png" "Completed\!FOLDER!\Edits\Icons\!BORDERSTYLE!\btn_vod.png*" /Y /Q > nul
xcopy "Icon-Presets\!BORDERSTYLE!\cat_series.png" "Completed\!FOLDER!\Edits\Icons\!BORDERSTYLE!\btn_series.png*" /Y /Q > nul
xcopy "Icon-Presets\!BORDERSTYLE!\cat_tv.png" "Completed\!FOLDER!\Edits\Icons\!BORDERSTYLE!\btn_tv.png*" /Y /Q > nul
xcopy "Icon-Presets\!BORDERSTYLE!\catchup.png" "Completed\!FOLDER!\Edits\Icons\!BORDERSTYLE!\catchup.png*" /Y /Q > nul
xcopy "Icon-Presets\!BORDERSTYLE!\favorite.png" "Completed\!FOLDER!\Edits\Icons\!BORDERSTYLE!\favorite.png*" /Y /Q > nul
xcopy "Icon-Presets\!BORDERSTYLE!\multi.png" "Completed\!FOLDER!\Edits\Icons\!BORDERSTYLE!\multi.png*" /Y /Q > nul
xcopy "Icon-Presets\!BORDERSTYLE!\radio.png" "Completed\!FOLDER!\Edits\Icons\!BORDERSTYLE!\radio.png*" /Y /Q > nul
xcopy "Icon-Presets\!BORDERSTYLE!\settings.png" "Completed\!FOLDER!\Edits\Icons\!BORDERSTYLE!\settings.png*" /Y /Q > nul
goto OTHERART

:CUSTOMICONS

"Tools\ImageMagick\magick" Completed\!FOLDER!\cat_icon.png ^
    ( Completed\!FOLDER!\Edits\logo-glow.png -resize 320x320 ) -gravity center -geometry +0-50 -composite ^
    Completed\!FOLDER!\catlogo_icon.png

"Tools\ImageMagick\magick" Completed\!FOLDER!\cat_icon.png ^
    ( Icon-Presets\!BORDERSTYLE!\movies.png ) -gravity center -geometry +0+175 -composite ^
    ( Icon-Presets\Category-Icons\!ICONSTYLE!\movies.png -resize 320x320 ) -gravity center -geometry +0-50 -composite ^
    Completed\!FOLDER!\Edits\Icons\!BORDERSTYLE!\btn_vod.png

"Tools\ImageMagick\magick" Completed\!FOLDER!\cat_icon.png ^
    ( Icon-Presets\!BORDERSTYLE!\series.png ) -gravity center -geometry +0+175 -composite ^
    ( Icon-Presets\Category-Icons\!ICONSTYLE!\series.png -resize 320x320 ) -gravity center -geometry +0-50 -composite ^
    Completed\!FOLDER!\Edits\Icons\!BORDERSTYLE!\btn_series.png

"Tools\ImageMagick\magick" Completed\!FOLDER!\cat_icon.png ^
    ( Icon-Presets\!BORDERSTYLE!\live.png ) -gravity center -geometry +0+175 -composite ^
    ( Icon-Presets\Category-Icons\!ICONSTYLE!\live.png -resize 320x320 ) -gravity center -geometry +0-50 -composite ^
    Completed\!FOLDER!\Edits\Icons\!BORDERSTYLE!\btn_tv.png

"Tools\ImageMagick\magick" Completed\!FOLDER!\cat_icon.png ^
    ( Icon-Presets\!BORDERSTYLE!\guide.png ) -gravity center -geometry +0+175 -composite ^
    ( Icon-Presets\Category-Icons\!ICONSTYLE!\guide.png -resize 320x320 ) -gravity center -geometry +0-50 -composite ^
    Completed\!FOLDER!\Edits\Icons\!BORDERSTYLE!\btn_epg.png

"Tools\ImageMagick\magick" Completed\!FOLDER!\cat_icon.png ^
    ( Icon-Presets\!BORDERSTYLE!\multi.png -resize 380x380 ) -gravity center -composite ^
    Completed\!FOLDER!\Edits\Icons\!BORDERSTYLE!\multi.png

"Tools\ImageMagick\magick" Completed\!FOLDER!\cat_icon.png ^
    ( Icon-Presets\!BORDERSTYLE!\settings.png -resize 380x380 ) -gravity center -composite ^
    Completed\!FOLDER!\Edits\Icons\!BORDERSTYLE!\settings.png

"Tools\ImageMagick\magick" Completed\!FOLDER!\cat_icon.png ^
    ( Icon-Presets\!BORDERSTYLE!\account.png -resize 380x380 ) -gravity center -composite ^
    Completed\!FOLDER!\Edits\Icons\!BORDERSTYLE!\account.png

"Tools\ImageMagick\magick" Completed\!FOLDER!\cat_icon.png ^
    ( Icon-Presets\!BORDERSTYLE!\radio.png -resize 380x380 ) -gravity center -composite ^
    Completed\!FOLDER!\Edits\Icons\!BORDERSTYLE!\radio.png

"Tools\ImageMagick\magick" Completed\!FOLDER!\cat_icon.png ^
    ( Icon-Presets\!BORDERSTYLE!\catchup.png -resize 380x380 ) -gravity center -composite ^
    Completed\!FOLDER!\Edits\Icons\!BORDERSTYLE!\catchup.png

"Tools\ImageMagick\magick" Completed\!FOLDER!\cat_icon.png ^
    ( Icon-Presets\!BORDERSTYLE!\favorite.png -resize 380x380 ) -gravity center -composite ^
    Completed\!FOLDER!\Edits\Icons\!BORDERSTYLE!\favorite.png

:OTHERART
"Tools\ImageMagick\magick" Icon-Presets\!BORDERSTYLE!\bgthree.jpg ^
    ( Completed\!FOLDER!\Edits\logo-glow.png ) -gravity center -composite ^
    Completed\!FOLDER!\Edits\bgthree.jpg

"Tools\ImageMagick\magick" -size 512x512 xc:transparent ^
    ( Icon-Presets\!BORDERSTYLE!\iconbg.png ) -gravity center -composite ^
    ( Completed\!FOLDER!\Edits\logo-glow.png -resize 380x380 ) -gravity center -composite ^
	( Icon-Presets\!BORDERSTYLE!\cat_icon.png ) -gravity center -composite ^
    Completed\!FOLDER!\Edits\Icons\!BORDERSTYLE!\icon.png

"Tools\ImageMagick\magick" Icon-Presets\!BORDERSTYLE!\banner.png ^
    ( Completed\!FOLDER!\Edits\logo-glow.png -resize 145x145 ) -gravity center -composite ^
    Completed\!FOLDER!\Edits\Icons\!BORDERSTYLE!\banner.png

:XCPREVIEW
"Tools\ImageMagick\magick" -size 1920x1080 xc:transparent ^
    ( Completed\!FOLDER!\Edits\background.jpg -gravity center ) -composite ^
    ( Completed\!FOLDER!\Edits\Icons\!BORDERSTYLE!\btn_tv.png -resize 360x360 -gravity southwest -geometry +231+360 ) -composite ^
    ( Completed\!FOLDER!\Edits\Icons\!BORDERSTYLE!\btn_epg.png -resize 360x360 -gravity southwest -geometry +596+360 ) -composite ^
    ( Completed\!FOLDER!\Edits\Icons\!BORDERSTYLE!\btn_vod.png -resize 360x360 -gravity southwest -geometry +963+360 ) -composite ^
    ( Completed\!FOLDER!\Edits\Icons\!BORDERSTYLE!\btn_series.png -resize 360x360 -gravity southwest -geometry +1329+360 ) -composite ^
	( Completed\!FOLDER!\Edits\Icons\!BORDERSTYLE!\account.png -resize 144x144 -gravity southwest -geometry +22+36 ) -composite ^
	( Completed\!FOLDER!\Edits\Icons\!BORDERSTYLE!\multi.png -resize 144x144 -gravity southwest -geometry +172+36 ) -composite ^
	( Completed\!FOLDER!\Edits\Icons\!BORDERSTYLE!\catchup.png -resize 144x144 -gravity southwest -geometry +322+36 ) -composite ^
	( Completed\!FOLDER!\Edits\Icons\!BORDERSTYLE!\favorite.png -resize 144x144 -gravity southwest -geometry +1460+36 ) -composite ^
	( Completed\!FOLDER!\Edits\Icons\!BORDERSTYLE!\radio.png -resize 144x144 -gravity southwest -geometry +1610+36 ) -composite ^
	( Completed\!FOLDER!\Edits\Icons\!BORDERSTYLE!\settings.png -resize 144x144 -gravity southwest -geometry +1760+36 ) -composite ^
	( Completed\!FOLDER!\Edits\Icons\!BORDERSTYLE!\cat_gs.png -resize 82x82 -gravity southwest -geometry +1513+989 ) -composite ^
	( Completed\!FOLDER!\Edits\Icons\!BORDERSTYLE!\sport_btn.png -resize 82x82 -gravity southwest -geometry +1613+989 ) -composite ^
	( Completed\!FOLDER!\Edits\Icons\!BORDERSTYLE!\cat_remind.png -resize 82x82 -gravity southwest -geometry +1713+989 ) -composite ^
	( Completed\!FOLDER!\Edits\Icons\!BORDERSTYLE!\cat_rec.png -resize 82x82 -gravity southwest -geometry +1813+989 ) -composite ^
	( Completed\!FOLDER!\Edits\logo-glow.png -resize 180x180 -gravity southwest -geometry +870+858 ) -composite ^
    Completed\!FOLDER!\Edits\preview.jpg
xcopy /Y "Completed\!FOLDER!\Edits\preview.jpg" "Icon-Presets\*" > nul
"Tools\ImageMagick\magick" -size 1920x1080 xc:transparent ^
    ( Completed\!FOLDER!\Edits\bgthree.jpg -gravity center ) -composite ^
    ( Icon-Presets\guidepreview.png -gravity center ) -composite ^
    ( Completed\!FOLDER!\Edits\logo-glow.png -resize 128x128 -gravity southwest -geometry +896+946 ) -composite ^
    Completed\!FOLDER!\Edits\previewvod.jpg
xcopy /Y "Completed\!FOLDER!\Edits\previewvod.jpg" "Icon-Presets\*" > nul

REM Run PowerShell script and capture the result
for /f %%i in ('powershell -ExecutionPolicy Bypass -File "Tools\xcpreview.ps1"') do set prev=%%i

REM Use the prev variable as needed
IF "%prev%"=="OK" (
	explorer "Completed\!FOLDER!\Edits\Icons\!BORDERSTYLE!\"
) else (
    echo.
    goto STYLENUM
)

del "Completed\!FOLDER!\cat_icon.png" 2>NUL
del "Completed\!FOLDER!\catlogo_icon.png" 2>NUL
del "Completed\!FOLDER!\Edits\logo-glow-only.png" 2>NUL
del "Completed\!FOLDER!\Edits\logo-glow.png" 2>NUL
ENDLOCAL
pause
exit
