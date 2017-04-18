This is a batch script that sets up folders for ReShade automatically.

To use it, simply place it in the root folder of a game and run it.
Alternatively you can drag the ReShade DLL onto it.

Full list of what it does:
* Creates a folder structure like such:

  `(...)\ReShade`

  `(...)\ReShade\Presets`

  `(...)\ReShade\Screenshots`

  `(...)\ReShade\Shaders`

  `(...)\ReShade\Textures`

* Create an empty preset file:

  `(...)\ReShade\Presets\Default.ini`

* Create a configuration file, named `[renderer].ini`, where `[renderer]` can be either `d3d9`, `dxgi` or `opengl32`.

The configuration file will disable the tutorial, set a dark color scheme, set up the folders, the preset file, set input to be blocked while the ReShade GUI is open and set the shortcut keys as such:

   `F12` Toggle GUI

   `F10` Toggle Effects

   `PrintScreen` Take a screenshot

