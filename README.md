# Aseprite Scripts

## Installation
Inside your Aseprite's folder, there is a "scripts" folder. Drop the files in it.

## Scripts

### Export Layers
- Filename : `export_layers.lua`
- Operation : exports all layers in different files next to the source file.
  Resulting files will take the layer's name.
- Best used : with an already saved file with only one frame. The current frame
  will be selected for exporting. Layers without a Cel in the current frame will
  be skipped.
- Possible uses : I built the script to easily handle a PBR texture's different
  maps in the same file, using Aseprite to unwrap it into the different files.
