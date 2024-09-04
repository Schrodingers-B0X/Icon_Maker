# XCIPTV Icon Maker

A combination of scripts and tools to be used in Windows to create your own icons for XCIPTV. It was built trying to get the most out of basic/limited programming languages and as I wanted to add more to it, it surprised me what was possible with only batch script and powershell. You can use a single background and logo, then launch the batch script "XCIPTV_Icon_Maker.bat" from the root folder can be double clicked which then asks the user for some basic inputs.

# Step 1

Drop a background and logo into the main folder. Background can be jpeg or png. Aany aspect ratio or resolution (recommended at least 720p to look good on TV). The script handles conversion to jpeg and cropping from centre to make it 16:9. Logo must be png, but can be any resolution (recommended 512p) and aspect ratio, the script handles making the logo square ready for using in your app.

# Step 2

Pick your theme name, your "icon style" which are pulled from the Icon-Presets folder (experiment with adding your own). You can pick the icon border and then the opacity and colour of it's background.

# Step 3

Sit back and the tool will generate a preview of what the app will look like with your shiny new icons. If you click change, you will be taken back to step 2 to try again and preview your changes.

# Something you aren't happy with or it doesn't do?

Then **modify it or make your own**. This work's been given away and is aimed towards the reverse-engineering community. It uses ImageMagick (which for context is also included in parts of Adobe's suite... namely, Photoshop). Reverse-engineering anything takes patience and the will to learn. Hand-holding people through things teaches them nothing.

I hope someone contributes to it and surprises us all with their work. We all gain that way. **Take it and bring back something better! 😄**
