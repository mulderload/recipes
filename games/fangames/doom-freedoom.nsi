!include "..\..\includes\standard.nsh"

Name "Freedoom"
InstallDir "C:\MulderLoad\Freedoom"

Section "Freedoom v0.13 + GZDoom v4.14"
    SetOutPath $INSTDIR

    !insertmacro Download https://github.com/ZDoom/gzdoom/releases/download/g4.14.0/gzdoom-4-14-0a-windows.zip gzdoom-4-14-0a-windows.zip
    nsisunz::Unzip "$INSTDIR\gzdoom-4-14-0a-windows.zip" "$INSTDIR"
    Delete gzdoom-4-14-0a-windows.zip

    !insertmacro Download https://github.com/freedoom/freedoom/releases/download/v0.13.0/freedm-0.13.0.zip freedm-0.13.0.zip
    nsisunz::Unzip "$INSTDIR\freedm-0.13.0.zip" "$INSTDIR"
    Delete freedm-0.13.0.zip
    Rename freedm-0.13.0\freedm.wad freedm.wad

    !insertmacro Download https://github.com/freedoom/freedoom/releases/download/v0.13.0/freedoom-0.13.0.zip freedoom-0.13.0.zip
    nsisunz::Unzip "$INSTDIR\freedoom-0.13.0.zip" "$INSTDIR"
    Delete freedoom-0.13.0.zip
    Rename freedoom-0.13.0\freedoom1.wad freedoom1.wad
    Rename freedoom-0.13.0\freedoom2.wad freedoom2.wad
SectionEnd

Section "Doom 1 Shareware IWAD"
    SetOutPath $INSTDIR
    !insertmacro Download https://www.doomworld.com/3ddownloads/ports/shareware_doom_iwad.zip shareware_doom_iwad.zip
    nsisunz::Unzip "$INSTDIR\shareware_doom_iwad.zip" "$INSTDIR"
    Delete shareware_doom_iwad.zip
SectionEnd
