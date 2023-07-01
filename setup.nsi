!include "MUI2.nsh"

!define MUI_ICON "ui/images/Product.ico"
!insertmacro MUI_PAGE_DIRECTORY # In which folder install page.
!insertmacro MUI_PAGE_LICENSE "LICENSE.rtf"
!insertmacro MUI_PAGE_INSTFILES # Installing page.

!insertmacro MUI_UNPAGE_CONFIRM
!insertmacro MUI_UNPAGE_INSTFILES


# define the name of the app
Name "Minecraft Modpack Manager Lite"


# define name of installer
OutFile "MCModpackManagerLiteSetup.exe"

# define installation directory
InstallDir "$PROGRAMFILES64\mrquantumoff.dev\mcmodpackmanager_lite"

# For removing Start Menu shortcut in Windows 7
RequestExecutionLevel admin

# start default section
Section
    Var /GLOBAL APP_REGISTRY_PATH

    StrCpy $APP_REGISTRY_PATH "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Minecraft Modpack Manager Lite"

    # set the installation directory as the destination for the following actions
    SetOutPath $INSTDIR

    # create the uninstaller
    WriteUninstaller "$INSTDIR\uninstall.exe"

    # point the new shortcut at the program uninstaller
    CreateShortcut "$SMPROGRAMS\Minecraft Modpack Manager Lite.lnk" "$INSTDIR\mcmodpackmanager_lite.exe"
    CreateShortcut "$SMPROGRAMS\Uninstall Minecraft Modpack Manager Lite.lnk" "$INSTDIR\uninstall.exe"

    File "target\release\mcmodpackmanager_lite.exe"
    File "ui\images\Product.ico"

    WriteRegStr HKLM "$APP_REGISTRY_PATH" "Publisher" "MrQuantumOFF (Demir Yerli)"
    WriteRegStr HKLM "$APP_REGISTRY_PATH" "UninstallString" "$INSTDIR\uninstall.exe"
    WriteRegStr HKLM "$APP_REGISTRY_PATH" "URLInfoAbout" "https://github.com/mrquantumoff/mcmodpackmanager_lite"
    WriteRegStr HKLM "$APP_REGISTRY_PATH" "InstallLocation" "$INSTDIR"
    WriteRegStr HKLM "$APP_REGISTRY_PATH" "DisplayName" "Minecraft Modpack Manager Lite"
    WriteRegStr HKLM "$APP_REGISTRY_PATH" "DisplayIcon" "$INSTDIR\Product.ico"
    WriteRegDWORD HKLM "$APP_REGISTRY_PATH" "NoModify" "1"
    WriteRegDWORD HKLM "$APP_REGISTRY_PATH" "NoRepair" "1"






SectionEnd

# uninstaller section start
Section "uninstall"
    StrCpy $APP_REGISTRY_PATH "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Minecraft Modpack Manager Lite"

    # first, delete the uninstaller
    Delete "$INSTDIR\uninstall.exe"

    # second, remove the link from the start menu
    Delete "$SMPROGRAMS\Minecraft Modpack Manager Lite.lnk"
    Delete "$SMPROGRAMS\Uninstall Minecraft Modpack Manager Lite.lnk"
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