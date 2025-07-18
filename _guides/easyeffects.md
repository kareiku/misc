---
title: Easy Effects Presets Guide
layout: default
---

# Easy Effects

## Creating a Custom Preset

1. Set your effects as you want.
2. Click "Presets" at the top-right of the main window.
3. In the "Local" section, set a name and press **+**.

A new preset should have appeared in the list.

- Click the "download" button (it means "save" in EasyEffects) and then the
  tick each time you want to save your changes in that preset.

## Obtaining the JSON File for a Custom Preset

As of version 7.2.4, there's not an export button for full effects' presets
(don't let the button in the "Equaliser" effect page mislead you!)

For that, we have to find the created file ourselves and copy it elsewhere. We
can do so by looking in these directories:

`~/.var/app/com.github.wwmm.easyeffects/config/easyeffects/`

- `./output/` for "output" presets.
- `./input/` for "input" presets.

## Importing a Custom Preset from a JSON File

1. Click "Presets" at the top-right of the main window.
2. Click at the button right of the **+** (the one with a group of folders).
3. Select your preset JSON file and import.
4. Load whenever you like.

(Given this is a *flatpak* package, we assume the system to be Linux.)
