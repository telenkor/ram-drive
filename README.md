# RAM Drive
RAM Drive for Mac OS with a simple graphical user interface. AppleScript powered. Designed to create a disk partition in RAM.

If you have a sufficient amount of RAM and you rarely use all of it, then with this program you can:
- Place some cache here
- Use as a temporary folder for anything
- If your data requires very fast access

<p align="center">
<img width="231" height="247" src="https://github.com/divrn/ram-drive/assets/31967374/2571220e-6ca4-47f8-93e6-38d538ed97b7">
</p>

## Features

<p align="center">
<img width="480" height="247" src="https://github.com/divrn/ram-drive/assets/31967374/275f18e1-2133-4227-82ef-9f35765c0a27">
</p>

- Very high read/write speed
- Easy mounting and unmounting
 
Another feature of using this program is saving SSD resources. For example, if you place temporary Photoshop files or browser cache here.

## Modification

You can change the <em>Disk size</em> in megabytes and <em>Volume name</em> directly from the interface. By double clicking on the corresponding field.
If you don't like the existing set of values, you can change it in code.

The best way to do this is modifying the application from the [Releases](https://github.com/divrn/ram-drive/releases).
Copy RAM Drive.app from the ram-drive-v2.x.x.dmg to any location. Open RAM Drive.app in AppleScript Editor (/Applications/Utilities/Script Editor.app) or a third-party [Script Debugger](https://latenightsw.com/).
All you need to do is write the desired values into this line:
```applescript
set Table to make new table with data {{"4096", "RAM Disk"}, {"8192", "RAM Disk"}, {"16384", "RAM Disk"}}
```
You can leave one entry {"xxxx", "name"}, or you can add new ones. For example:
```applescript
set Table to make new table with data {{"6666", "Photoshop_cache"}}
```

## Important

If you already have one disk mounted and you want to mount another one, then it is not necessary to change its name to a unique one. The application will not allow identical names and will automatically add _1, _2... to the name.

> :warning: Do not save important information in a single copy to this disk.
> It is not intended for long-term storage.
> A power failure or rebooting your computer will permanently destroy all data!

## System Requirements
- Mac OS Yosemite (10.10) or later
- Not tested on Apple M-series
