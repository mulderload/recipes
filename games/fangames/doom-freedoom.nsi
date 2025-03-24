!include "..\..\templates\standard.nsh"

Name "Freedoom"
InstallDir "C:\MulderLoad\Freedoom"

Section "Freedoom v0.13 + GZDoom v4.14"
    SectionIn RO
    SetOutPath $INSTDIR

    !insertmacro Download https://github.com/ZDoom/gzdoom/releases/download/g4.14.0/gzdoom-4-14-0a-windows.zip "gzdoom.zip"
    nsisunz::Unzip "gzdoom.zip" ".\"
    Delete "gzdoom.zip"

    !insertmacro Download https://github.com/freedoom/freedoom/releases/download/v0.13.0/freedm-0.13.0.zip "freedm.zip"
    nsisunz::Unzip /noextractpath /file "freedm-0.13.0\freedm.wad" "freedm.zip" ".\"
    Delete "freedm.zip"

    !insertmacro Download https://github.com/freedoom/freedoom/releases/download/v0.13.0/freedoom-0.13.0.zip "freedoom.zip"
    nsisunz::Unzip /noextractpath /file "freedoom-0.13.0\freedoom1.wad" "freedoom.zip" ".\"
    nsisunz::Unzip /noextractpath /file "freedoom-0.13.0\freedoom2.wad" "freedoom.zip" ".\"
    Delete "freedoom.zip"
SectionEnd

Section /o "Doom 1 Shareware IWAD"
    SetOutPath $INSTDIR

    !insertmacro Download https://www.doomworld.com/3ddownloads/ports/shareware_doom_iwad.zip "shareware_doom_iwad.zip"
    nsisunz::Unzip "shareware_doom_iwad.zip" ".\"
    Delete "shareware_doom_iwad.zip"
SectionEnd
