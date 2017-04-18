::ReShade Environment Creator

@echo off

if [%1]==[] goto:noname
set _RESHADE_NAME_=%~n1
goto:havename

:noname
echo Reminder you can simply drag and drop the ReShade .dll on this batch file to skip this step.
:tryagain
echo.
echo Select a graphics API:
echo 0 - DirectX 9
echo 1 - DirectX 10/11
echo 2 - OpenGL
echo ReShade 3.0 doesn't natively support DirectX 8, you'll need to use d3d8to9: https://reshade.me/d3d8to9
set /p _API_=

if [%_API_%]==[0] (
	set _RESHADE_NAME_=d3d9
	goto:havename
)
if [%_API_%]==[1] (
	set _RESHADE_NAME_=dxgi
	goto:havename
)
if [%_API_%]==[2] (
	set _RESHADE_NAME_=opengl32
	goto:havename
)

echo Invalid API, please try again or press Ctrl+C to quit.
goto:tryagain

:havename

::Create folders
md "ReShade\Presets" >nul 2>&1
md "ReShade\Screenshots" >nul 2>&1
md "ReShade\Shaders" >nul 2>&1
md "ReShade\Textures" >nul 2>&1

::Create a default preset file if none exists
if not exist "ReShade\Presets\Default.ini" (
	type NUL > "ReShade\Presets\Default.ini"
)

::Create ReShade game configuration file.
(
	echo [GENERAL]
	echo PerformanceMode=0
    echo TutorialProgress=4
    echo ScreenshotFormat=1
    echo ShowClock=0
    echo ShowFPS=0
	echo ScreenshotPath=%cd%\ReShade\Screenshots
	echo EffectSearchPaths=%cd%\ReShade\Shaders
	echo TextureSearchPaths=%cd%\ReShade\Textures
    echo CurrentPreset=0
    echo PresetFiles=%cd%\ReShade\Presets\Default.ini
	echo PreprocessorDefinitions=RESHADE_DEPTH_LINEARIZATION_FAR_PLANE=1000.0,RESHADE_DEPTH_INPUT_IS_UPSIDE_DOWN=0,RESHADE_DEPTH_INPUT_IS_REVERSED=0,RESHADE_DEPTH_INPUT_IS_LOGARITHMIC=0
    echo.
    echo [INPUT]
	echo KeyMenu=123,0,0
	echo KeyScreenshot=44,0,0
    echo KeyEffects=121,0,0
	echo InputProcessing=2
	echo.
	echo [STYLE]
    echo Alpha=0.950000
    echo ColFPSText=1.000000,1.000000,0.000000
	echo ColActive=0.313726,0.313726,0.313726
	echo ColBackground=0.086275,0.086275,0.086275
	echo ColText=0.866667,0.866667,0.866667
	echo ColItemBackground=0.196078,0.196078,0.196078
	echo.
) > %_RESHADE_NAME_%.ini

exit
