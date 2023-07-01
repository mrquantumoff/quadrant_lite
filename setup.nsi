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
InstallDir "$LOCALAPPDATA\Programs\mrquantumoff.dev\mcmodpackmanager_lite"

# For removing Start Menu shortcut in Windows 7
RequestExecutionLevel admin

# start default section
Section

    # set the installation directory as the destination for the following actions
    SetOutPath $INSTDIR

    # create the uninstaller
    WriteUninstaller "$INSTDIR\uninstall.exe"

    # point the new shortcut at the program uninstaller
    CreateShortcut "$SMPROGRAMS\Minecraft Modpack Manager Lite.lnk" "$INSTDIR\mcmodpackmanager_lite.exe"
    CreateShortcut "$SMPROGRAMS\Uninstall Minecraft Modpack Manager Lite.lnk" "$INSTDIR\uninstall.exe"

    File "target\release\mcmodpackmanager_lite.exe"

SectionEnd

# uninstaller section start
Section "uninstall"

    # first, delete the uninstaller
    Delete "$INSTDIR\uninstall.exe"

    # second, remove the link from the start menu
    Delete "$SMPROGRAMS\Minecraft Modpack Manager Lite.lnk"
    Delete "$SMPROGRAMS\Uninstall Minecraft Modpack Manager Lite.lnk"

    Delete $INSTDIR

# uninstaller section end
SectionEnd