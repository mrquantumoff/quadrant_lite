!include "MUI2.nsh"

!define MUI_ICON "ui/images/Product.ico"
!insertmacro MUI_PAGE_DIRECTORY # In which folder install page.
!insertmacro MUI_PAGE_LICENSE "LICENSE.rtf"
!insertmacro MUI_PAGE_INSTFILES # Installing page.

!insertmacro MUI_UNPAGE_CONFIRM
!insertmacro MUI_UNPAGE_INSTFILES


# define the name of the app
Name "Quadrant Lite"


# define name of installer
OutFile "QuadrantLiteSetup.exe"

# define installation directory
InstallDir "$PROGRAMFILES64\mrquantumoff.dev\quadrant_lite"

# For removing Start Menu shortcut in Windows 7
RequestExecutionLevel admin

# start default section
Section
    Var /GLOBAL APP_REGISTRY_PATH

    StrCpy $APP_REGISTRY_PATH "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Quadrant Lite"

    # set the installation directory as the destination for the following actions
    SetOutPath $INSTDIR

    # create the uninstaller
    WriteUninstaller "$INSTDIR\uninstall.exe"

    # point the new shortcut at the program uninstaller
    CreateShortcut "$SMPROGRAMS\Quadrant Lite.lnk" "$INSTDIR\quadrant_lite.exe"
    CreateShortcut "$SMPROGRAMS\Uninstall Quadrant Lite.lnk" "$INSTDIR\uninstall.exe"

    File "target\release\quadrant_lite.exe"
    File "ui\images\Product.ico"

    WriteRegStr HKLM "$APP_REGISTRY_PATH" "Publisher" "MrQuantumOFF (Demir Yerli)"
    WriteRegStr HKLM "$APP_REGISTRY_PATH" "UninstallString" "$INSTDIR\uninstall.exe"
    WriteRegStr HKLM "$APP_REGISTRY_PATH" "URLInfoAbout" "https://github.com/mrquantumoff/quadrant_lite"
    WriteRegStr HKLM "$APP_REGISTRY_PATH" "InstallLocation" "$INSTDIR"
    WriteRegStr HKLM "$APP_REGISTRY_PATH" "DisplayName" "Quadrant Lite"
    WriteRegStr HKLM "$APP_REGISTRY_PATH" "DisplayIcon" "$INSTDIR\Product.ico"
    WriteRegDWORD HKLM "$APP_REGISTRY_PATH" "NoModify" "1"
    WriteRegDWORD HKLM "$APP_REGISTRY_PATH" "NoRepair" "1"






SectionEnd

# uninstaller section start
Section "uninstall"
    StrCpy $APP_REGISTRY_PATH "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Quadrant Lite"

    # first, delete the uninstaller
    Delete "$INSTDIR\uninstall.exe"

    # second, remove the link from the start menu
    Delete "$SMPROGRAMS\Quadrant Lite.lnk"
    Delete "$SMPROGRAMS\Uninstall Quadrant Lite.lnk"
    DeleteRegValue HKLM "$APP_REGISTRY_PATH" "Publisher"
    DeleteRegValue HKLM "$APP_REGISTRY_PATH" "UninstallString"
    DeleteRegValue HKLM "$APP_REGISTRY_PATH" "URLInfoAbout"
    DeleteRegValue HKLM "$APP_REGISTRY_PATH" "InstallLocation"
    DeleteRegValue HKLM "$APP_REGISTRY_PATH" "DisplayName"
    DeleteRegValue HKLM "$APP_REGISTRY_PATH" "DisplayIcon"
    DeleteRegValue HKLM "$APP_REGISTRY_PATH" "NoModify"
    DeleteRegValue HKLM "$APP_REGISTRY_PATH" "NoRepair"
    DeleteRegKey HKLM "$APP_REGISTRY_PATH"
    Delete $INSTDIR

    

# uninstaller section end
SectionEnd