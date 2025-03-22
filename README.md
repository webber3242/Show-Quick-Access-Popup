Goal
Launch Quick Access Popup if it’s not running.

Activate Quick Access Popup and send the Ctrl+3 hotkey if it’s running.

Add a system-wide context menu entry called "Show Quick Access Popup" for easy access.

Scripts
1. QuickAccessPopup.bat
What it does:

Checks if QuickAccessPopup.exe is running.

Activates the window and sends Ctrl+3 if running.

Launches Quick Access Popup via a .lnk shortcut if not running.

What to adjust:

Process Name: Update QuickAccessPopup.exe if needed.

Shortcut Path: Set the correct path to the .lnk file.

Hotkey: Modify SendWait("^3") for a different hotkey.

2. QuickAccessPopup.ps1
What it does:

Same functionality as the batch script but written in PowerShell.

What to adjust:

Process Name: Update QuickAccessPopup.

Shortcut Path: Set the correct path to the .lnk file.

Hotkey: Modify keybd_event calls for a different hotkey.

How to Use
1. Running the Scripts
Batch Script:

Save as QuickAccessPopup.bat and double-click to run.

PowerShell Script:

Save as QuickAccessPopup.ps1 and run in PowerShell:

powershell
Copy
.\QuickAccessPopup.ps1
2. Adding the Context Menu
Save the following as AddContextMenu.reg:

reg
Copy
Windows Registry Editor Version 5.00

[HKEY_CLASSES_ROOT\*\shell\ShowQuickAccessPopup]
@="Show Quick Access Popup"
"Icon"="C:\\Path\\To\\Shortcut.lnk"

[HKEY_CLASSES_ROOT\*\shell\ShowQuickAccessPopup\command]
@="\"C:\\Windows\\System32\\WindowsPowerShell\\v1.0\\powershell.exe\" -NoProfile -ExecutionPolicy Bypass -File \"C:\\Path\\To\\QuickAccessPopup.ps1\""

[HKEY_CLASSES_ROOT\Folder\shell\ShowQuickAccessPopup]
@="Show Quick Access Popup"
"Icon"="C:\\Path\\To\\Shortcut.lnk"

[HKEY_CLASSES_ROOT\Folder\shell\ShowQuickAccessPopup\command]
@="\"C:\\Windows\\System32\\WindowsPowerShell\\v1.0\\powershell.exe\" -NoProfile -ExecutionPolicy Bypass -File \"C:\\Path\\To\\QuickAccessPopup.ps1\""
Double-click the .reg file to add the context menu entry.

