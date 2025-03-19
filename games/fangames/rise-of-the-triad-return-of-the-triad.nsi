!include "..\..\includes\standard.nsh"

Name "Return of the Triad"
InstallDir "C:\MulderLoad\Return of the Triad"

Section "Return of the Triad v1.6 + GZDoom v4.14"
    SetOutPath $INSTDIR

    !insertmacro Download https://github.com/ZDoom/gzdoom/releases/download/g4.14.0/gzdoom-4-14-0a-windows.zip gzdoom-4-14-0a-windows.zip
    nsisunz::Unzip "$INSTDIR\gzdoom-4-14-0a-windows.zip" "$INSTDIR"
    Delete gzdoom-4-14-0a-windows.zip

    !insertmacro Download https://www.mediafire.com/file_premium/fov7484ttj1bntq/rott_tc_16.zip/file rott_tc_16.zip
    nsisunz::Unzip "$INSTDIR\rott_tc_16.zip" "$INSTDIR"
    Delete rott_tc_16.zip
SectionEnd

Section "Addon - Scream of the Triad"
    SetOutPath $INSTDIR
    !insertmacro Download https://www.mediafire.com/file_premium/zv9c0s06tq70qgi/ROTT_ScreamTriad.zip/file ROTT_ScreamTriad.zip
    nsisunz::Unzip "$INSTDIR\ROTT_ScreamTriad.zip" "$INSTDIR"
    Delete ROTT_ScreamTriad.zip
SectionEnd

Section "Freedoom: Phase 1 (if you don't own Doom)"
    SetOutPath $INSTDIR
    !insertmacro Download https://github.com/freedoom/freedoom/releases/download/v0.13.0/freedoom-0.13.0.zip freedoom-0.13.0.zip
    nsisunz::Unzip /noextractpath /file "freedoom-0.13.0\freedoom1.wad" "$INSTDIR\freedoom-0.13.0.zip" "$INSTDIR"
    Delete freedoom-0.13.0.zip
SectionEnd
