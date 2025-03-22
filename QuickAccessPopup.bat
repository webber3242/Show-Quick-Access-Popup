@echo off
set processName=QuickAccessPopup.exe
set shortcutPath="C:\Users\web\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\QuickAccessPopup - Shortcut.lnk"

REM Check if the process is running
tasklist /FI "IMAGENAME eq %processName%" 2>NUL | find /I /N "%processName%">NUL
if "%ERRORLEVEL%"=="0" (
    REM If running, activate the window and send Ctrl+3 (keydown/keyup)
    powershell -Command "Add-Type -TypeDefinition @\"
    using System;
    using System.Runtime.InteropServices;
    public class Win32 {
        [DllImport(\"user32.dll\")]
        public static extern bool SetForegroundWindow(IntPtr hWnd);
        [DllImport(\"user32.dll\")]
        public static extern void keybd_event(byte bVk, byte bScan, uint dwFlags, UIntPtr dwExtraInfo);
    }
\"@; $hwnd = (Get-Process -Name '%processName%').MainWindowHandle; [Win32]::SetForegroundWindow($hwnd); Start-Sleep -Milliseconds 100; [Win32]::keybd_event(0x11, 0, 0, [UIntPtr]::Zero); [Win32]::keybd_event(0x33, 0, 0, [UIntPtr]::Zero); Start-Sleep -Milliseconds 50; [Win32]::keybd_event(0x11, 0, 0x0002, [UIntPtr]::Zero); [Win32]::keybd_event(0x33, 0, 0x0002, [UIntPtr]::Zero)"
) else (
    REM If not running, launch the shortcut
    start %shortcutPath%
)

REM Exit the script
exit
